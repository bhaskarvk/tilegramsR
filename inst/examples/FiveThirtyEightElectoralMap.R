#' ---
#' title: "Electoral Vote Prediction Map in R"
#' author: "Bhaskar V. Karambelkar"
#' date: "October 12th, 2016"
#' output:
#'   html_document
#' ---
#'
#' ## Explanation of the code
#'
#' This is a faithful replication of [2016 election forecast](http://projects.fivethirtyeight.com/2016-election-forecast/) tilegram map in R with some added goodies.
#' <br/>
#' The idea is very simple even if the code may look a bit daunting.
#'
#' - Scrape data from http://projects.fivethirtyeight.com/2016-election-forecast/
#' - Use [tilegramsR](https://github.com/bhaskarvk/tilegramsR) as our polygons
#' - Color the states by the projected winning party's colors (blue=democrat, red=republican)
#' - Set each state's opacity proportional to the winning candidates percentage
#' - For each state create a pretty label that shows details for that state on hover.
#' - ???
#' - PROFIT
#' <br/>
#'
#' ### Libraries

#' <br/>
#' Libraries we need from CRAN
ensureCranPkg <- function(pkg) {
  if(!suppressWarnings(requireNamespace(pkg, quietly = TRUE))) {
    install.packages(pkg)
  }
}

ensureCranPkg('devtools')
ensureCranPkg('purrr')
ensureCranPkg('dplyr')
ensureCranPkg('htmlwidgets')
ensureCranPkg('stringr')
ensureCranPkg('rvest')
ensureCranPkg('xml2')
ensureCranPkg('htmltools')

#' <br/>
#' Libraries we need from github
if(!suppressWarnings(requireNamespace('leaflet',quietly = TRUE)) ||
   packageVersion('leaflet') < '1.0.2.9006') {
  devtools::install_github('rstudio/leaflet')
}

if(!suppressWarnings(requireNamespace('tilegramsR', quietly = TRUE))) {
  devtools::install_github('bhaskarvk/tilegramsR')
}

if(!suppressWarnings(requireNamespace('usgazetteer', quietly = TRUE))) {
  devtools::install_github('bhaskarvk/usgazetteer')
}

#' ## Data scraping
#' <br/>

library(tilegramsR)
library(leaflet)
library(magrittr)

# The URL for election forecast
url <- 'http://projects.fivethirtyeight.com/2016-election-forecast/?ex_cid=2016-senate-forecast'

g <- xml2::read_html(url)

# These divs hold our data
state.winprobs <- g %>% rvest::html_nodes('.cards')
state.winprobs <- state.winprobs[2:52] # Select only state data

# How many electoral votes per state
electoral.votes <- purrr::map_chr(state.winprobs,
                         function(winprob) {
                           winprob %>%
                             rvest::html_node('p.top-powerbar') %>%
                             rvest::html_text()
                         }) %>%
  stringr::str_extract('[0-9]+') %>% as.numeric()

# 2 letter abbreviations for the states
states <- purrr::map_chr(state.winprobs,
                         function(winprob) {
                           winprob %>%
                             rvest::html_node('div.card-winprob') %>%
                             rvest::html_attr('data-card-id')
                         }) %>%
  stringr::str_extract('^..')

# Winning probability per state of Democrats.
dem.winprobs <- purrr::map_chr(state.winprobs,
                               function(winprob) {
                                 winprob %>%
                                   rvest::html_nodes('div.dem p.winprob') %>%
                                   rvest::html_text()
                               }) %>%
  stringr::str_replace_all('[^0-9\\.]','') %>% as.numeric()

# Winning probability per state of Republicans.
rep.winprobs <- purrr::map_chr(state.winprobs,
                               function(winprob) {
                                 winprob %>%
                                   rvest::html_nodes('div.rep p.winprob') %>%
                                   rvest::html_text()
                               }) %>%
  stringr::str_replace_all('[^0-9\\.]','') %>% as.numeric()

# Combine into a data.frame
winprobs <- data.frame(state=states,
                       electoral.votes=electoral.votes,
                       dem.winprob=dem.winprobs,
                       rep.winprob=rep.winprobs) %>%
  dplyr::mutate(
    who=factor(ifelse(dem.winprob>rep.winprob,'D','R')))

# Join with the spatial data from tilegramsR package
spdf <- FiveThirtyEightElectoralCollege.states
spdf@data %<>% dplyr::left_join(winprobs, by=c('state'='state'))

# This is our pretty hover content
spdf@data$hoverText <- mapply(
  function(st, vts, dem, rep, w) {
    htmltools::HTML(
      sprintf(
        "<div style='font-size:12px;width:200px;float:left'>
            <span style='font-size:18px;font-weight:bold'>%s</span><br/>
            Chances of Winning<br/>
            <div style='width:95%%'>
              <span style='float:left'>Clinton</span>
              <span style='float:right'>Trump</span>
              <br/>
              <span style='color:#2aa1ec;float:left'>%s%%</span>
              <span style='color:#fe6a59;float:right'>%s%%</span><br clear='all'/>
              <span style='background:#2aa1ec;width:%s%%;float:left'>&nbsp;</span>
              <span style='background:#fe6a59;width:%s%%;float:right'>&nbsp;</span>
            </div>
            <br/><span style='font-size:10px'>%s electoral Votes</span>
        </div>",
        usgazetteer::state.areas.2010$State[
          which(usgazetteer::state.areas.2010$USPS==st)],
        dem, rep,
        dem, rep,
        vts
      )
    )
  },
  spdf@data$state, spdf@data$electoral.votes,
  spdf@data$dem.winprob, spdf@data$rep.winprob,
  spdf@data$who, SIMPLIFY = F) %>%
  set_names(spdf@data$states)


#' ## Map

#+ fig.width= 10, fig.height=8
# Dems are blue and Reps are red.
factpal <- colorFactor(c("#2aa1ec", "#fe6a59"), spdf@data$who)

leaflet(options=leafletOptions(
  crs = leafletCRS("L.CRS.Simple"),
  minZoom = -1.5, maxZoom = -1.5,
  dragging = FALSE, zoomControl = FALSE,
  attributionControl = FALSE)) %>%
  addPolygons(
    data=FiveThirtyEightElectoralCollege, group = 'college',
    weight=1,color='#000', fill=F, opacity=0.3) %>%
  addPolygons(
    data=spdf, group = 'states',
    weight=1, color='#222',
    fillColor= ~factpal(who), fill = T, opacity = 1,
    fillOpacity = ~ifelse(who=='D',(dem.winprob/100)-0.1,
                          (rep.winprob/100)-0.1),
    label=~hoverText,
    labelOptions = labelOptions(
      offset = c(-100,-140),
      #direction='bottom',
      textOnly = T,
      style=list(
        'background'='rgba(255,255,255,0.95)',
        'border-color' = 'rgba(0,0,0,1)',
        'border-radius' = '4px',
        'border-style' = 'solid',
        'border-width' = '4px')),
    highlightOptions = highlightOptions(weight = 3, bringToFront = TRUE)) %>%
  addLabelOnlyMarkers(
    data=FiveThirtyEightElectoralCollege.centers,
    label = ~as.character(state),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T,
      offset=c(-5,-10), textsize = '15px',
      style=list('color'='black')) )  %>%
  htmlwidgets::onRender(
    "function(el, t) {
        var myMap = this;
        // get rid of the ugly grey background
        myMap._container.style['background'] = '#ffffff';
    }")

#' <br/><br/>
