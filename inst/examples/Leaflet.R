#' ---
#' title: "Tilegrams in R"
#' author: "Bhaskar V. Karambelkar"
#' date: "October 13th, 2016"
#' output:
#'   html_document:
#'     toc: true
#'     toc_float: true
#'     code_folding: show
#' ---

#' ### Common Code

suppressPackageStartupMessages(library(tilegramsR))
library(leaflet)

# JS code ----

# A Javascript function we'll use style our leaflet widget
styleMap <- function(
  map, style = list(background='transparent')) {
  map %>%  htmlwidgets::onRender(
    JS("function(el, x, style) {
      var myMap = this;
      if($.isEmptyObject(myMap._container.style)) {
        myMap._container.style = {};
      }
      $.each(style, function(key, value) {
        myMap._container.style[key] = value;
      });
    }"),
    data = style
  )
}

# NPR ----
#' ### NPR

states <- NPR1to1@data$state
factpal <- colorFactor(colormap::colormap(
  nshades = length(states)), states)

#+ fig.width= 8, fig.height=4
leaflet(
  NPR1to1,
  options=leafletOptions(
    crs = leafletCRS("L.CRS.Simple"),
    minZoom = -1.5, maxZoom = -1.5,
    dragging = FALSE, zoomControl = FALSE,
    attributionControl = FALSE)) %>%
  addPolygons(
    weight=2,color='#000000', group = 'states',
    fillOpacity = 0.6, opacity = 1, fillColor= ~factpal(state),
    highlightOptions = highlightOptions(weight = 4)) %>%
  addLabelOnlyMarkers(
    data=NPR1to1.centers,
    label = ~as.character(state),
    labelOptions = labelOptions(
    noHide = 'T', textOnly = T,
    offset=c(-4,-10), textsize = '12px')) %>%
  styleMap()

# Pitch ----
#' ### Population

states <- Pitch_US_Population_2016_v1.states@data$state
factpal <- colorFactor(colormap::colormap(
  nshades = length(states)), states)

#+ fig.width= 9, fig.height=7
leaflet(
  options=leafletOptions(
    crs = leafletCRS("L.CRS.Simple"),
    minZoom = -1.5, maxZoom = -1.5,
    dragging = FALSE, zoomControl = FALSE,
    attributionControl = FALSE)) %>%
  addPolygons(
    data=Pitch_US_Population_2016_v1,
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.2,
    fillColor= ~factpal(state)) %>%
  addPolygons(
    data=Pitch_US_Population_2016_v1.states, group = 'states',
    weight=2,color='#000000',
    fill = T, opacity = 1, fillOpacity = 0,
    highlightOptions = highlightOptions(weight = 4)) %>%
  addLabelOnlyMarkers(
    data=Pitch_US_Population_2016_v1.centers,
    label = ~as.character(state),
    labelOptions = labelOptions(
    noHide = 'T', textOnly = T,
    offset=c(-4,-10), textsize = '15px')) %>%
  styleMap()


# 538.com ----
#' ### 538.com

states <- FiveThirtyEightElectoralCollege.states@data$state
factpal <- colorFactor(colormap::colormap(
  nshades = length(states)), states)

#+ fig.width= 9, fig.height=7
leaflet(
  options=leafletOptions(
    crs = leafletCRS("L.CRS.Simple"),
    minZoom = -1.5, maxZoom = -1.5,
    dragging = FALSE, zoomControl = FALSE,
    attributionControl = FALSE)) %>%
  addPolygons(
    data=FiveThirtyEightElectoralCollege,
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.2,
    fillColor= ~factpal(state)) %>%
  addPolygons(
    data=FiveThirtyEightElectoralCollege.states, group = 'states',
    weight=2,color='#000000',
    fill = T, opacity = 1, fillOpacity = 0,
    highlightOptions = highlightOptions(weight = 4)) %>%
  addLabelOnlyMarkers(
    data=FiveThirtyEightElectoralCollege.centers,
    label = ~as.character(state),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T,
      offset=c(-8,-20), textsize = '15px')) %>%
  styleMap()

# Daily KOS Dual Hexbin Tilegram ----
#' ### DKOS DualHex

states <- DKOS_50_State_OuterHex_Tilemap_v1@data$State
factpal <- colorFactor(colormap::colormap(
  nshades = length(states)), states)
factpal2 <- colorFactor(rev(colormap::colormap(
  nshades = length(states))), states)

#+ fig.width= 8, fig.height=5
leaflet(
  options=leafletOptions(
    crs = leafletCRS("L.CRS.Simple"),
    minZoom = 7, maxZoom = 7,
    dragging = FALSE, zoomControl = FALSE,
    attributionControl = FALSE)) %>%
  addPolygons(
    data=DKOS_50_State_OuterHex_Tilemap_v1, group='states',
    weight=2,color='#000000', opacity = 1,
    fillColor= ~factpal(State),
    highlightOptions = highlightOptions(weight = 4)) %>%
  addPolygons(
    data=DKOS_50_State_InnerHex_Tilemap_v1,
    weight=1,color='#000000', opacity=1, fillOpacity = 1,
    fillColor= ~factpal2(State),
    options = pathOptions(clickable = FALSE, pointerEvents = 'none')) %>%
  addLabelOnlyMarkers(
    data=DKOS_50_State_Hex_Tilemap_v1.centers,
    label = ~as.character(State),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T,
      offset=c(-4,-10), textsize = '12px',
      style=list('color'='#ffffff'))) %>%
  styleMap()


# Daily KOS Congressional Districts Hexbin Tilegram ----
#' ### DKOS CD

states <- DKOS_CD_Hexmap_v1.1.states@data$STATE
factpal <- colorFactor(colormap::colormap(
  nshades = length(states)), states)

#+ fig.width= 8, fig.height=5
leaflet(
  options=leafletOptions(
    crs = leafletCRS("L.CRS.Simple"),
    minZoom = 4, maxZoom = 4,
    dragging = FALSE, zoomControl = FALSE,
    attributionControl = FALSE)) %>%
  addPolygons(
    data=DKOS_CD_Hexmap_v1.1,
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.2,
    fillColor= ~factpal(STATEAB)) %>%
  addPolygons(
    data=DKOS_CD_Hexmap_v1.1.states, group = 'states',
    weight=2,color='#000000', fill = T,
    opacity = 1, fillOpacity = 0,
    highlightOptions = highlightOptions(weight = 4)) %>%
  addLabelOnlyMarkers(
    data=DKOS_CD_Hexmap_v1.1.centers,
    label = ~as.character(STATE),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-12,-15), textsize = '15px',
      direction="auto")) %>%
  styleMap()


# Daily KOS Electoral College Map ----
#' ### DKOS Electoral

states <- DKOS_Electoral_College_Map_v1.states@data$trueState
factpal <- colorFactor(colormap::colormap(
  nshades = length(states)), states)

#+ fig.width= 9, fig.height=6
leaflet(
  options=leafletOptions(
    crs = leafletCRS("L.CRS.Simple"),
    minZoom = 4, maxZoom = 4,
    dragging = FALSE, zoomControl = FALSE,
    attributionControl = FALSE)) %>%
  addPolygons(
    data=DKOS_Electoral_College_Map_v1,
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.2,
    fillColor= ~factpal(trueState)) %>%
  addPolygons(
    data=DKOS_Electoral_College_Map_v1.states, group = 'states',
    weight=2,color='#000000', fill = T,
    opacity = 1, fillOpacity = 0,
    highlightOptions = highlightOptions(weight = 4)) %>%
  addLabelOnlyMarkers(
    data=DKOS_Electoral_College_Map_v1.centers,
    label = ~as.character(trueState),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-12,-15), textsize = '15px',
      direction="auto")) %>%
  styleMap()

# Daily KOS Distorted_Electoral College Map ----
#' ### DKOS Distorted

states <- DKOS_Distorted_Electoral_College_Map_v1@data$STUSPS
factpal <- colorFactor(colormap::colormap(
  nshades = length(states)), states)

#+ fig.width= 9, fig.height=6
leaflet(
  options=leafletOptions(
    crs = leafletCRS("L.CRS.Simple"),
    minZoom = -12.5, maxZoom = -12.5,
    dragging = FALSE, zoomControl = FALSE,
    attributionControl = FALSE)) %>%
  addPolygons(
    data=DKOS_Distorted_Electoral_College_Map_v1, group = 'states',
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.7,
    fillColor= ~factpal(STUSPS),
    highlightOptions = highlightOptions(weight = 3)) %>%
  addLabelOnlyMarkers(
    data=DKOS_Distorted_Electoral_College_Map_v1.centers,
    label = ~as.character(STUSPS),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-20,-15), textsize = '15px',
      direction="auto")) %>%
  styleMap()

# NPR Demers Cartogram ----
#' ### NPR Demers

states <- NPR.DemersCartogram@data$id
factpal <- colorFactor(colormap::colormap(
  nshades = length(states)), states)

#+ fig.width= 9, fig.height=6
leaflet(
  options=leafletOptions(
    crs = leafletCRS("L.CRS.Simple"),
    minZoom = 0.1, maxZoom = 0.1,
    dragging = FALSE, zoomControl = FALSE,
    attributionControl = FALSE)) %>%
  addPolygons(
    data=NPR.DemersCartogram, group = 'states',
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.7,
    fillColor= ~factpal(id),
    highlightOptions = highlightOptions(weight = 3)) %>%
  addLabelOnlyMarkers(
    data=NPR.DemersCartogram.centers,
    label = ~as.character(id),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-12,-15), textsize = '15px',
      direction="auto")) %>%
  styleMap()

# Washington Post Tilegram ----
#' ### Washington Post

states <- WP@data$id
factpal <- colorFactor(colormap::colormap(
  nshades = length(states)), states)

#+ fig.width= 9, fig.height=6
leaflet(
  options=leafletOptions(
    crs = leafletCRS("L.CRS.Simple"),
    minZoom = 0.1, maxZoom = 0.1,
    dragging = FALSE, zoomControl = FALSE,
    attributionControl = FALSE)) %>%
  addPolygons(
    data=WP, group = 'states',
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.7,
    fillColor= ~factpal(id),
    highlightOptions = highlightOptions(weight = 3)) %>%
  addLabelOnlyMarkers(
    data=WP.centers,
    label = ~as.character(id),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-10,-8), textsize = '15px',
      direction="auto")) %>%
  styleMap()

# Wall Street Journal Tilegram ----
#' ### Wall Street Journal

states <- WSJ@data$id
factpal <- colorFactor(colormap::colormap(
  nshades = length(states)), states)

#+ fig.width= 9, fig.height=6
leaflet(
  options=leafletOptions(
    crs = leafletCRS("L.CRS.Simple"),
    minZoom = 0.1, maxZoom = 0.1,
    dragging = FALSE, zoomControl = FALSE,
    attributionControl = FALSE)) %>%
  addPolygons(
    data=WSJ, group = 'states',
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.7,
    fillColor= ~factpal(id),
    highlightOptions = highlightOptions(weight = 3)) %>%
  addLabelOnlyMarkers(
    data=WSJ.centers,
    label = ~as.character(id),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-15,-8), textsize = '15px',
      direction="auto")) %>%
  styleMap()

# Datamap.io Tilegram ----
#' ### Datamap.io

states <- Datamap.io.tilegram@data$USPS
factpal <- colorFactor(colormap::colormap(
  nshades = length(states)), states)

#+ fig.width= 9, fig.height=6
leaflet(
  options=leafletOptions(
    crs = leafletCRS("L.CRS.Simple"),
    minZoom = -1, maxZoom = -1,
    dragging = FALSE, zoomControl = FALSE,
    attributionControl = FALSE)) %>%
  addPolygons(
    data=Datamap.io.tilegram, group = 'states',
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.7,
    fillColor= ~factpal(USPS),
    highlightOptions = highlightOptions(weight = 3)) %>%
  addLabelOnlyMarkers(
    data=Datamap.io.tilegram.centers,
    label = ~as.character(USPS),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-15,-8), textsize = '15px',
      direction="auto")) %>%
  styleMap()
