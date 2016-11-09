# Pitch Interactive Population ----
#' Pitch_US_Population_2016_v1
#'
#' A `SpatialPolygonsDataFrame` where each polygon equals 500K people
#'
#' @format A SpatialPolygonsDataFrame
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' spdf <- Pitch_US_Population_2016_v1
#' leaflet(spdf) %>% addPolygons()
#' }
"Pitch_US_Population_2016_v1"

#' Pitch_US_Population_2016_v1.states
#'
#' A `SpatialPolygonsDataFrame` where each polygon represents a state
#'
#' @format A SpatialPolygonsDataFrame
#' @rdname Pitch_US_Population_2016_v1
"Pitch_US_Population_2016_v1.states"

#' Pitch_US_Population_2016_v1.centers
#'
#' A `SpatialPointsDataFrame` of centroids of each state
#'
#' @format A SpatialPointsDataFrame
#' @rdname Pitch_US_Population_2016_v1
"Pitch_US_Population_2016_v1.centers"

# FiveThirtyEight.com Electoral College ----
#' FiveThirtyEightElectoralCollege
#'
#' A `SpatialPolygonsDataFrame` where each polygon equals one electoral vote
#'
#' @format A SpatialPolygonsDataFrame
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' spdf <- FiveThirtyEightElectoralCollege
#' leaflet(spdf) %>% addPolygons()
#' }
"FiveThirtyEightElectoralCollege"

#' FiveThirtyEightElectoralCollege.states
#'
#' A `SpatialPolygonsDataFrame` where each polygon represents a state
#'
#' @format A SpatialPolygonsDataFrame
#' @rdname FiveThirtyEightElectoralCollege
"FiveThirtyEightElectoralCollege.states"

#' FiveThirtyEightElectoralCollege.centers
#'
#' A `SpatialPointsDataFrame` of centroids of each state
#'
#' @format A SpatialPointsDataFrame
#' @rdname FiveThirtyEightElectoralCollege
"FiveThirtyEightElectoralCollege.centers"

# NPR Hexbins ----
#' NPR1to1
#'
#' A `SpatialPolygonsDataFrame` where each polygon represents a state
#'
#' @format A SpatialPolygonsDataFrame
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' spdf <- NPR1to1
#' leaflet(spdf) %>% addPolygons()
#' }
"NPR1to1"

#' NPR1to1.centers
#'
#' A `SpatialPointsDataFrame` of centroids of each state
#'
#' @format A SpatialPointsDataFrame
#' @rdname NPR1to1
"NPR1to1.centers"

# Daily KOS Hexbins ----
#' DKOS_50_State_OuterHex_Tilemap_v1
#'
#' A `SpatialPolygonsDataFrame` where each polygon represents a state
#'
#' @format A SpatialPolygonsDataFrame
#' @rdname DKOS_50_State_Hex_Tilemap
"DKOS_50_State_OuterHex_Tilemap_v1"

#' DKOS_50_State_InnerHex_Tilemap_v1
#'
#' A `SpatialPolygonsDataFrame` where each polygon represents a state
#'
#' @format A SpatialPolygonsDataFrame
#' @rdname DKOS_50_State_Hex_Tilemap
"DKOS_50_State_InnerHex_Tilemap_v1"

#' DKOS_50_State_Hex_Tilemap_v1.centers
#'
#' A `SpatialPointsDataFrame` of centroids of each state
#'
#' @format A SpatialPointsDataFrame
#' @rdname DKOS_50_State_Hex_Tilemap
"DKOS_50_State_Hex_Tilemap_v1.centers"

# Daily KOS Congressional Districts ----
#' DKOS_CD_Hexmap_v1.1
#'
#' A `SpatialPolygonsDataFrame` where each polygon equals one congressional district
#'
#' @format A SpatialPolygonsDataFrame
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' spdf <- DKOS_CD_Hexmap_v1.1
#' leaflet(spdf) %>% addPolygons()
#' }
"DKOS_CD_Hexmap_v1.1"

#' DKOS_CD_Hexmap_v1.1.states
#'
#' A `SpatialPolygonsDataFrame` where each polygon represents a state
#'
#' @format A SpatialPolygonsDataFrame
#' @rdname DKOS_CD_Hexmap_v1.1
"DKOS_CD_Hexmap_v1.1.states"

#' DKOS_CD_Hexmap_v1.1.centers
#'
#' A `SpatialPointsDataFrame` of centroids of each state
#'
#' @format A SpatialPointsDataFrame
#' @rdname DKOS_CD_Hexmap_v1.1
"DKOS_CD_Hexmap_v1.1.centers"

# Daily KOS Electoral College ----
#' DKOS_Electoral_College_Map_v1
#'
#' A `SpatialPolygonsDataFrame` where each polygon equals one electoral college
#'
#' @format A SpatialPolygonsDataFrame
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' spdf <- DKOS_Electoral_College_Map_v1
#' leaflet(spdf) %>% addPolygons()
#' }
"DKOS_Electoral_College_Map_v1"

#' DKOS_Electoral_College_Map_v1.states
#'
#' A `SpatialPolygonsDataFrame` where each polygon represents a state
#'
#' @format A SpatialPolygonsDataFrame
#' @rdname DKOS_Electoral_College_Map_v1
"DKOS_Electoral_College_Map_v1.states"

#' DKOS_Electoral_College_Map_v1.centers
#'
#' A `SpatialPointsDataFrame` of centroids of each state
#'
#' @format A SpatialPointsDataFrame
#' @rdname DKOS_Electoral_College_Map_v1
"DKOS_Electoral_College_Map_v1.centers"

# Daily KOS Distorted Electoral College ----
#' DKOS_Distorted_Electoral_College_Map_v1
#'
#' A `SpatialPolygonsDataFrame` where each polygon represents a state
#'
#' @format A SpatialPolygonsDataFrame
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' spdf <- DKOS_Distorted_Electoral_College_Map_v1
#' leaflet(spdf) %>% addPolygons()
#' }
"DKOS_Distorted_Electoral_College_Map_v1"

#' DKOS_Distorted_Electoral_College_Map_v1.centers
#'
#' A `SpatialPointsDataFrame` of centroids of each state
#'
#' @format A SpatialPointsDataFrame
#' @rdname DKOS_Distorted_Electoral_College_Map_v1
"DKOS_Distorted_Electoral_College_Map_v1.centers"

# NPR Demers Cartogram ----
#' NPR.DemersCartogram
#'
#' A `SpatialPolygonsDataFrame` where each polygon represents a state
#'
#' @format A SpatialPolygonsDataFrame
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' spdf <- NPR.DemersCartogram
#' leaflet(spdf) %>% addPolygons()
#' }
"NPR.DemersCartogram"

#' NPR.DemersCartogram.centers
#'
#' A `SpatialPointsDataFrame` of centroids of each state
#'
#' @format A SpatialPointsDataFrame
#' @rdname NPR.DemersCartogram
"NPR.DemersCartogram.centers"

# Washington Post Tilegram ----
#' WP
#'
#' A `SpatialPolygonsDataFrame` where each polygon represents a state
#'
#' @format A SpatialPolygonsDataFrame
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' spdf <- WP
#' leaflet(spdf) %>% addPolygons()
#' }
"WP"

#' WP.centers
#'
#' A `SpatialPointsDataFrame` of centroids of each state
#'
#' @format A SpatialPointsDataFrame
#' @rdname WP
"WP.centers"

# Wall Street Journal Tilegram ----
#' WSJ
#'
#' A `SpatialPolygonsDataFrame` where each polygon represents a state
#'
#' @format A SpatialPolygonsDataFrame
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' spdf <- WSJ
#' leaflet(spdf) %>% addPolygons()
#' }
"WSJ"

#' WSJ.centers
#'
#' A `SpatialPointsDataFrame` of centroids of each state
#'
#' @format A SpatialPointsDataFrame
#' @rdname WSJ
"WSJ.centers"

# Datamap.io Tilegram ----
#' Datamap.io.tilegram
#'
#' A `SpatialPolygonsDataFrame` where each polygon represents a state
#'
#' @format A SpatialPolygonsDataFrame
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' spdf <- Datamap.io.tilegram
#' leaflet(spdf) %>% addPolygons()
#' }
"Datamap.io.tilegram"

#' Datamap.io.tilegram.centers
#'
#' A `SpatialPointsDataFrame` of centroids of each state
#'
#' @format A SpatialPointsDataFrame
#' @rdname Datamap.io.tilegram
"Datamap.io.tilegram.centers"
