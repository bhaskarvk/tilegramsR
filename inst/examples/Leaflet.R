#' ---
#' title: "Tilegrams in R"
#' author: "Bhaskar V. Karambelkar"
#' output:
#'   html_document:
#'     toc: true
#'     toc_float: true
#'     code_folding: show
#' ---

#' The aim of this document is to show how various `tilegram` objects can be used for visualization purposes.

#' ### Common Code

suppressPackageStartupMessages(library(tilegramsR))
library(leaflet)
# devtools::install_github('bhaskarvk/leaflet.extras')
library(leaflet.extras)

getLeafletOptions <- function(minZoom, maxZoom, ...) {
  leafletOptions(
    crs = leafletCRS("L.CRS.Simple"),
    minZoom = minZoom, maxZoom = maxZoom,
    dragging = FALSE, zoomControl = FALSE,
    tap = FALSE,
    attributionControl = FALSE , ...)
}

getFactorPal <- function(f) {
  colorFactor(colormap::colormap(
    colormap = colormap::colormaps$hsv,
    nshades = length(f)), f)
}

# NPR ----
#' ### NPR

#+ fig.width= 8, fig.height=4
leaflet(
  sf_NPR1to1,
  options= getLeafletOptions(-1.5, -1.5)) %>%
  addPolygons(
    weight=2,color='#000000', group = 'states',
    fillOpacity = 0.6, opacity = 1, fillColor= ~getFactorPal(state)(state),
    highlightOptions = highlightOptions(weight = 4)) %>%
  addLabelOnlyMarkers(
    data=sf_NPR1to1.centers,
    label = ~as.character(state),
    labelOptions = labelOptions(
    noHide = 'T', textOnly = T,
    offset=c(-4,-10), textsize = '12px')) %>%
  setMapWidgetStyle()

# Pitch ----
#' ### Population

#+ fig.width= 9, fig.height=7
leaflet(
  options= getLeafletOptions(-1.5, -1.5)) %>%
  addPolygons(
    data=sf_Pitch_US_Population_2016_v1,
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.2,
    fillColor= ~getFactorPal(state)(state)) %>%
  addPolygons(
    data=sf_Pitch_US_Population_2016_v1.states, group = 'states',
    weight=2,color='#000000',
    fill = T, opacity = 1, fillOpacity = 0,
    highlightOptions = highlightOptions(weight = 4)) %>%
  addLabelOnlyMarkers(
    data=sf_Pitch_US_Population_2016_v1.centers,
    label = ~as.character(state),
    labelOptions = labelOptions(
    noHide = 'T', textOnly = T,
    offset=c(-4,-10), textsize = '15px')) %>%
  setMapWidgetStyle()


# 538.com ----
#' ### 538.com

#+ fig.width= 9, fig.height=7
leaflet(
  options= getLeafletOptions(-1.5, -1.5)) %>%
  addPolygons(
    data=sf_FiveThirtyEightElectoralCollege,
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.2,
    fillColor= ~getFactorPal(state)(state)) %>%
  addPolygons(
    data=sf_FiveThirtyEightElectoralCollege.states, group = 'states',
    weight=2,color='#000000',
    fill = T, opacity = 1, fillOpacity = 0,
    highlightOptions = highlightOptions(weight = 4)) %>%
  addLabelOnlyMarkers(
    data=sf_FiveThirtyEightElectoralCollege.centers,
    label = ~as.character(state),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T,
      offset=c(-8,-20), textsize = '15px')) %>%
  setMapWidgetStyle()

# Daily KOS Dual Hexbin ----
#' ### DKOS DualHex

#+ fig.width= 8, fig.height=5
leaflet(
  options= getLeafletOptions(7, 7)) %>%
  addPolygons(
    data=sf_DKOS_50_State_OuterHex_Tilemap_v1, group='states',
    weight=2,color='#000000', opacity = 1,
    fillColor= ~getFactorPal(State)(State),
    highlightOptions = highlightOptions(weight = 4))  %>%
  addPolygons(
    data=sf_DKOS_50_State_InnerHex_Tilemap_v1,
    weight=1,color='#000000', opacity=1, fillOpacity = 1,
    fillColor= ~getFactorPal(State)(State),
    options = pathOptions(clickable = FALSE, pointerEvents = 'none')) %>%
  addLabelOnlyMarkers(
    data=sf_DKOS_50_State_Hex_Tilemap_v1.centers,
    label = ~as.character(State),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T,
      offset=c(-4,-10), textsize = '12px',
      style=list('color'='#000000'))) %>%
  setMapWidgetStyle()


# Daily KOS Congressional Districts Hexbin ----
#' ### DKOS CD

#+ fig.width= 8, fig.height=5
leaflet(
  options= getLeafletOptions(4.0, 4.0)) %>%
  addPolygons(
    data=sf_DKOS_CD_Hexmap_v1.1,
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.2,
    fillColor= ~getFactorPal(STATEAB)(STATEAB)) %>%
  addPolygons(
    data=sf_DKOS_CD_Hexmap_v1.1.states, group = 'states',
    weight=2,color='#000000', fill = T,
    opacity = 1, fillOpacity = 0,
    highlightOptions = highlightOptions(weight = 4)) %>%
  addLabelOnlyMarkers(
    data=sf_DKOS_CD_Hexmap_v1.1.centers,
    label = ~as.character(STATEAB),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-12,-15), textsize = '15px',
      direction="auto")) %>%
  setMapWidgetStyle()


# Daily KOS Electoral College Map ----
#' ### DKOS Electoral

#+ fig.width= 9, fig.height=6
leaflet(
  options= getLeafletOptions(4, 4)) %>%
  addPolygons(
    data=sf_DKOS_Electoral_College_Map_v1,
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.2,
    fillColor= ~getFactorPal(State.abb)(State.abb)) %>%
  addPolygons(
    data=sf_DKOS_Electoral_College_Map_v1.states, group = 'states',
    weight=2,color='#000000', fill = T,
    opacity = 1, fillOpacity = 0,
    highlightOptions = highlightOptions(weight = 4)) %>%
  addLabelOnlyMarkers(
    data=sf_DKOS_Electoral_College_Map_v1.centers,
    label = ~as.character(State.abb),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-12,-15), textsize = '15px',
      direction="auto")) %>%
  setMapWidgetStyle()

# Daily KOS Distorted_Electoral College Map ----
#' ### DKOS Distorted

#+ fig.width= 9, fig.height=6
leaflet(
  options= getLeafletOptions(-12.5, -12.5)) %>%
  addPolygons(
    data=sf_DKOS_Distorted_Electoral_College_Map_v1, group = 'states',
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.7,
    fillColor= ~getFactorPal(STUSPS)(STUSPS),
    highlightOptions = highlightOptions(weight = 3)) %>%
  addLabelOnlyMarkers(
    data=sf_DKOS_Distorted_Electoral_College_Map_v1.centers,
    label = ~as.character(STUSPS),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-20,-15), textsize = '15px',
      direction="auto")) %>%
  setMapWidgetStyle()

# NPR Demers Cartogram ----
#' ### NPR Demers

#+ fig.width= 9, fig.height=6
leaflet(
  options= getLeafletOptions(0.1, 0.1)) %>%
  addPolygons(
    data=sf_NPR.DemersCartogram, group = 'states',
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.7,
    fillColor= ~getFactorPal(id)(id),
    highlightOptions = highlightOptions(weight = 3)) %>%
  addLabelOnlyMarkers(
    data=sf_NPR.DemersCartogram.centers,
    label = ~as.character(id),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-12,-15), textsize = '15px',
      direction="auto")) %>%
  setMapWidgetStyle()

# Washington Post Tilegram ----
#' ### Washington Post

#+ fig.width= 9, fig.height=6
leaflet(
  options= getLeafletOptions(0.1, 0.1)) %>%
  addPolygons(
    data=sf_WP, group = 'states',
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.7,
    fillColor= ~getFactorPal(id)(id),
    highlightOptions = highlightOptions(weight = 3)) %>%
  addLabelOnlyMarkers(
    data=sf_WP.centers,
    label = ~as.character(id),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-10,-8), textsize = '15px',
      direction="auto")) %>%
  setMapWidgetStyle()

# Wall Street Journal ----
#' ### Wall Street Journal

#+ fig.width= 9, fig.height=6
leaflet(
  options= getLeafletOptions(0.1, 0.1)) %>%
  addPolygons(
    data=sf_WSJ, group = 'states',
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.7,
    fillColor= ~getFactorPal(id)(id),
    highlightOptions = highlightOptions(weight = 3)) %>%
  addLabelOnlyMarkers(
    data=sf_WSJ.centers,
    label = ~as.character(id),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-15,-8), textsize = '15px',
      direction="auto")) %>%
  setMapWidgetStyle()

# Datamap.io ----
#' ### Datamap.io

#+ fig.width= 9, fig.height=6
leaflet(
  options= getLeafletOptions(-1, -1)) %>%
  addPolygons(
    data=sf_Datamap.io.tilegram, group = 'states',
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.7,
    fillColor= ~getFactorPal(USPS)(USPS),
    highlightOptions = highlightOptions(weight = 3)) %>%
  addLabelOnlyMarkers(
    data=sf_Datamap.io.tilegram.centers,
    label = ~as.character(USPS),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-15,-8), textsize = '15px',
      direction="auto")) %>%
  setMapWidgetStyle()

# France ----
#' ### French Regions

#+ fig.width= 9, fig.height=7
leaflet(
  options= getLeafletOptions(-0.75, -0.75)) %>%
  addPolygons(
    data=sf_france_regions_population,
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.2,
    fillColor= ~getFactorPal(id)(id)) %>%
  addPolygons(
    data=sf_france_regions_population.regions, group = 'regions',
    weight=2,color='#000000',
    fill = T, opacity = 1, fillOpacity = 0,
    highlightOptions = highlightOptions(weight = 4)) %>%
  addLabelOnlyMarkers(
    data=sf_france_regions_population.centers,
    label = ~as.character(name),
    labelOptions = labelOptions(
    noHide = 'T', textOnly = T,
    offset=c(-50,0), textsize = '8px')) %>%
  setMapWidgetStyle()


#' ### All French Regions

#+ fig.width= 9, fig.height=7
leaflet(
  options= getLeafletOptions(-0.8, -0.8)) %>%
  addPolygons(
    data=sf_france_all_regions_population,
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.2,
    fillColor= ~getFactorPal(id)(id)) %>%
  addPolygons(
    data=sf_france_all_regions_population.regions, group = 'regions',
    weight=2,color='#000000',
    label = ~as.character(name),
    labelOptions = labelOptions(direction = 'auto'),
    fill = T, opacity = 1, fillOpacity = 0,
    highlightOptions = highlightOptions(weight = 4)) %>%
  addLabelOnlyMarkers(
    data=sf_france_all_regions_population.centers,
    label = ~as.character(name),
    labelOptions = labelOptions(
    noHide = 'T', textOnly = T, direction = 'auto',
    offset=c(-30,0), textsize = '8px')) %>%
  setMapWidgetStyle()

# Germany ----
#' ### Germany

#+ fig.width= 9, fig.height=6
leaflet(
  options= getLeafletOptions(-0.9, -0.9)) %>%
  addPolygons(
    data=sf_germany_constituencies,
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.7,
    fillColor= ~getFactorPal(id)(id),
    label = ~name,
    highlightOptions = highlightOptions(weight = 3)) %>%
  addLabelOnlyMarkers(
    data=sf_germany_constituencies.centers,
    label = ~as.character(id),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(0,-10),
      textsize = '8px' )) %>%
  setMapWidgetStyle()
