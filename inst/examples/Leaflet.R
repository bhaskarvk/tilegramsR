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

# A Javascript function we'll use to highlight our states
highlightStates <- function(
  map, groupName='states', defaultWeight=2, hightlightWeight=4) {
  map %>%  htmlwidgets::onRender(
    sprintf(
      " function(el, t) {
          this._container.style['background'] = '#ffffff';
          var defaultStyle = {
            weight: %d,
          };
          var highlightStyle = {
            weight: %d,
          };

          var myMap = this;

          var layers = myMap.layerManager._byGroup.%s;
          for(var i in layers) {
            var layer = layers[i];
            layer.on('mouseover',
              function(e) {
              this.setStyle(highlightStyle);
              this.bringToFront();
              });
            layer.on('mouseout',
              function(e) {
                this.setStyle(defaultStyle);
                //this.bringToBack();
              });
          }
      }"
      ,
      defaultWeight, hightlightWeight, groupName
    )
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
    fillOpacity = 0.6, opacity = 1,
    fillColor= ~factpal(state)) %>%
  addLabelOnlyMarkers(
    data=NPR1to1.centers,
    label = ~as.character(state),
    labelOptions = labelOptions(
    noHide = 'T', textOnly = T,
    offset=c(-4,-10), textsize = '12px')) %>%
  highlightStates()

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
    fill = T, opacity = 1, fillOpacity = 0) %>%
  addLabelOnlyMarkers(
    data=Pitch_US_Population_2016_v1.centers,
    label = ~as.character(state),
    labelOptions = labelOptions(
    noHide = 'T', textOnly = T,
    offset=c(-4,-10), textsize = '15px')) %>%
  highlightStates()


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
    fill = T, opacity = 1, fillOpacity = 0) %>%
  addLabelOnlyMarkers(
    data=FiveThirtyEightElectoralCollege.centers,
    label = ~as.character(state),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T,
      offset=c(-8,-20), textsize = '15px')) %>%
  highlightStates()

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
    fillColor= ~factpal(State)) %>%
  addPolygons(
    data=DKOS_50_State_InnerHex_Tilemap_v1,
    weight=1,color='#000000', opacity=1, fillOpacity = 1,
    fillColor= ~factpal2(State)) %>%
  addLabelOnlyMarkers(
    data=DKOS_50_State_Hex_Tilemap_v1.centers,
    label = ~as.character(State),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T,
      offset=c(-4,-10), textsize = '12px',
      style=list('color'='#ffffff'))) %>%
  highlightStates()


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
    opacity = 1, fillOpacity = 0) %>%
  addLabelOnlyMarkers(
    data=DKOS_CD_Hexmap_v1.1.centers,
    label = ~as.character(STATE),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-12,-15), textsize = '15px',
      direction="auto")) %>%
  highlightStates()


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
    opacity = 1, fillOpacity = 0) %>%
  addLabelOnlyMarkers(
    data=DKOS_Electoral_College_Map_v1.centers,
    label = ~as.character(trueState),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-12,-15), textsize = '15px',
      direction="auto")) %>%
  highlightStates()

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
    fillColor= ~factpal(STUSPS)) %>%
  addLabelOnlyMarkers(
    data=DKOS_Distorted_Electoral_College_Map_v1.centers,
    label = ~as.character(STUSPS),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-20,-15), textsize = '15px',
      direction="auto")) %>%
  highlightStates()

# NPR Dorling Cartogram ----
#' ### NPR Dorling

states <- NPR.DorlingCartogram@data$id
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
    data=NPR.DorlingCartogram, group = 'states',
    weight=1,color='#000000', fillOpacity = 0.5, opacity=0.7,
    fillColor= ~factpal(id)) %>%
  addLabelOnlyMarkers(
    data=NPR.DorlingCartogram.centers,
    label = ~as.character(id),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-12,-15), textsize = '15px',
      direction="auto")) %>%
  highlightStates()

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
    fillColor= ~factpal(id)) %>%
  addLabelOnlyMarkers(
    data=WP.centers,
    label = ~as.character(id),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-10,-8), textsize = '15px',
      direction="auto")) %>%
  highlightStates()

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
    fillColor= ~factpal(id)) %>%
  addLabelOnlyMarkers(
    data=WSJ.centers,
    label = ~as.character(id),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-15,-8), textsize = '15px',
      direction="auto")) %>%
  highlightStates()

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
    fillColor= ~factpal(USPS)) %>%
  addLabelOnlyMarkers(
    data=Datamap.io.tilegram.centers,
    label = ~as.character(USPS),
    labelOptions = labelOptions(
      noHide = 'T', textOnly = T, offset=c(-15,-8), textsize = '15px',
      direction="auto")) %>%
  highlightStates()
