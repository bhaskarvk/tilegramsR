#' ---
#' title: "Tilegrams in R"
#' author: "Bhaskar V. Karambelkar"
#' date: "October 11th, 2016"
#' ---
#'
#' <hr/>
library(tilegramsR)
library(leaflet)

#' ## NPR

states <- NPR1to1@data$state
factpal <- colorFactor(colormap::colormap(nshades = length(states)), states)

#+ fig.width= 8, fig.height=6
leaflet(NPR1to1,
        options=leafletOptions(
          crs = leafletCRS("L.CRS.Simple"),
          minZoom = -1.5, maxZoom = -1.5,
          dragging = FALSE, zoomControl = FALSE,
          attributionControl = FALSE)) %>%
  addPolygons(weight=1,color='#000000',
              fillOpacity = 0.6,
              popup = ~as.character(state),
              fillColor= ~factpal(state)) %>%
  addLabelOnlyMarkers(data=NPR1to1.centers,
              label = ~as.character(state),
              labelOptions = labelOptions(
                noHide = 'T', textOnly = T,
                offset=c(-4,-10), textsize = '12px')) %>%
  htmlwidgets::onRender("function(el, t) { this._container.style['background'] = '#ffffff';}")

#' ## Population

states <- Pitch_US_Population_2016_v1.states@data$state
factpal <- colorFactor(colormap::colormap(nshades = length(states)), states)

#+ fig.width= 9, fig.height=8
leaflet(options=leafletOptions(
  crs = leafletCRS("L.CRS.Simple"),
  minZoom = -1.5, maxZoom = -1.5,
  dragging = FALSE, zoomControl = FALSE,
  attributionControl = FALSE)) %>%
  addPolygons(data=Pitch_US_Population_2016_v1, group = 'pop',
              weight=1,color='#000000', fillOpacity = 0.5, opacity=0.2,
              fillColor= ~factpal(state)) %>%
  addPolygons(data=Pitch_US_Population_2016_v1.states, group = 'states',
              weight=2,color='#000000', fill = T, opacity = 0.9, fillOpacity = 0,
              label=~state) %>%
  addLabelOnlyMarkers(data=Pitch_US_Population_2016_v1.centers,
              label = ~as.character(state),
              labelOptions = labelOptions(
                noHide = 'T', textOnly = T, offset=c(-4,-10), textsize = '15px',
                direction="auto")) %>%
  htmlwidgets::onRender(
    " function(el, t) {
        this._container.style['background'] = '#ffffff';
        var defaultStyle = {
          color: '#000000',
          opacity:0.9,
          weight: 3,
          fillOpacity: 0,
        };
        var highlightStyle = {
          color: '#000000',
          opacity:1,
          weight: 5,
        };

        var myMap = this;

        var layers = myMap.layerManager._byGroup.states;
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
    }")


#' ## Electoral College

states <- FiveThirtyEightElectoralCollege.states@data$state
factpal <- colorFactor(colormap::colormap(nshades = length(states)), states)

#+ fig.width= 9, fig.height=8
leaflet(options=leafletOptions(
  crs = leafletCRS("L.CRS.Simple"),
  minZoom = -1.5, maxZoom = -1.5,
  dragging = FALSE, zoomControl = FALSE,
  attributionControl = FALSE)) %>%
  addPolygons(data=FiveThirtyEightElectoralCollege, group = 'college',
              weight=1,color='#000000', fillOpacity = 0.5, opacity=0.2,
              fillColor= ~factpal(state)) %>%
  addPolygons(data=FiveThirtyEightElectoralCollege.states, group = 'states',
              weight=2,color='#000000', fill = T, opacity = 0.9, fillOpacity = 0,
              label=~state) %>%
  addLabelOnlyMarkers(data=FiveThirtyEightElectoralCollege.centers,
              label = ~as.character(state),
              labelOptions = labelOptions(
                noHide = 'T', textOnly = T, offset=c(-20,-10), textsize = '15px',
                direction="auto")) %>%
  htmlwidgets::onRender(
    " function(el, t) {
        this._container.style['background'] = '#ffffff';
        var defaultStyle = {
          color: '#000000',
          opacity:0.9,
          weight: 3,
          fillOpacity: 0,
        };
        var highlightStyle = {
          color: '#000000',
          opacity:1,
          weight: 5,
        };

        var myMap = this;

        var layers = myMap.layerManager._byGroup.states;
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
    }")

