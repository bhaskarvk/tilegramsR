# Pitch Interactive Population ----
#' sf_Pitch_US_Population_2016_v1
#'
#' A `sf` object where each polygon equals 500K people
#'
#' @format sf
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' data <- sf_Pitch_US_Population_2016_v1
#' leaflet(data,
#'   options=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>%
#'   addPolygons()
#' }
"sf_Pitch_US_Population_2016_v1"

#' sf_Pitch_US_Population_2016_v1.states
#'
#' A `sf` object where each polygon represents a state
#'
#' @format sf
#' @rdname sf_Pitch_US_Population_2016_v1
"sf_Pitch_US_Population_2016_v1.states"

#' sf_Pitch_US_Population_2016_v1.centers
#'
#' A `sf` object of centroids of each state
#'
#' @format sf
#' @rdname sf_Pitch_US_Population_2016_v1
"sf_Pitch_US_Population_2016_v1.centers"

# FiveThirtyEight.com Electoral College ----
#' sf_FiveThirtyEightElectoralCollege
#'
#' A `sf` object where each polygon equals one electoral vote
#'
#' @format sf
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' data <- sf_FiveThirtyEightElectoralCollege
#' leaflet(data,
#'   options=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>%
#'   addPolygons()
#' }
"sf_FiveThirtyEightElectoralCollege"

#' sf_FiveThirtyEightElectoralCollege.states
#'
#' A `sf` object where each polygon represents a state
#'
#' @format sf
#' @rdname sf_FiveThirtyEightElectoralCollege
"sf_FiveThirtyEightElectoralCollege.states"

#' sf_FiveThirtyEightElectoralCollege.centers
#'
#' A `sf` object of centroids of each state
#'
#' @format sf
#' @rdname sf_FiveThirtyEightElectoralCollege
"sf_FiveThirtyEightElectoralCollege.centers"

# NPR Hexbins ----
#' sf_NPR1to1
#'
#' A `sf` object where each polygon represents a state
#'
#' @format sf
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' data <- sf_NPR1to1
#' leaflet(data,
#'   options=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>%
#'   addPolygons()
#' }
"sf_NPR1to1"

#' sf_NPR1to1.centers
#'
#' A `sf` object of centroids of each state
#'
#' @format sf
#' @rdname sf_NPR1to1
"sf_NPR1to1.centers"

# Daily KOS Hexbins ----
#' sf_DKOS_50_State_OuterHex_Tilemap_v1
#'
#' A `sf` object where each polygon represents a state
#'
#' @format sf
#' @rdname sf_DKOS_50_State_Hex_Tilemap
"sf_DKOS_50_State_OuterHex_Tilemap_v1"

#' sf_DKOS_50_State_InnerHex_Tilemap_v1
#'
#' A `sf` object where each polygon represents a state
#'
#' @format sf
#' @rdname sf_DKOS_50_State_Hex_Tilemap
"sf_DKOS_50_State_InnerHex_Tilemap_v1"

#' sf_DKOS_50_State_Hex_Tilemap_v1.centers
#'
#' A `sf` object of centroids of each state
#'
#' @format sf
#' @rdname sf_DKOS_50_State_Hex_Tilemap
"sf_DKOS_50_State_Hex_Tilemap_v1.centers"

# Daily KOS Congressional Districts ----
#' sf_DKOS_CD_Hexmap_v1.1
#'
#' A `sf` object where each polygon equals one congressional district
#'
#' @format sf
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' data <- sf_DKOS_CD_Hexmap_v1.1
#' leaflet(data,
#'   options=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>%
#'   addPolygons()
#' }
"sf_DKOS_CD_Hexmap_v1.1"

#' sf_DKOS_CD_Hexmap_v1.1.states
#'
#' A `sf` object where each polygon represents a state
#'
#' @format sf
#' @rdname sf_DKOS_CD_Hexmap_v1.1
"sf_DKOS_CD_Hexmap_v1.1.states"

#' sf_DKOS_CD_Hexmap_v1.1.centers
#'
#' A `sf` object of centroids of each state
#'
#' @format sf
#' @rdname sf_DKOS_CD_Hexmap_v1.1
"sf_DKOS_CD_Hexmap_v1.1.centers"

# Daily KOS Electoral College ----
#' sf_DKOS_Electoral_College_Map_v1
#'
#' A `sf` object where each polygon equals one electoral college
#'
#' @format sf
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' data <- sf_DKOS_Electoral_College_Map_v1
#' leaflet(data,
#'   options=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>%
#'   addPolygons()
#' }
"sf_DKOS_Electoral_College_Map_v1"

#' sf_DKOS_Electoral_College_Map_v1.states
#'
#' A `sf` object where each polygon represents a state
#'
#' @format sf
#' @rdname sf_DKOS_Electoral_College_Map_v1
"sf_DKOS_Electoral_College_Map_v1.states"

#' sf_DKOS_Electoral_College_Map_v1.centers
#'
#' A `sf` object of centroids of each state
#'
#' @format sf
#' @rdname sf_DKOS_Electoral_College_Map_v1
"sf_DKOS_Electoral_College_Map_v1.centers"

# Daily KOS Distorted Electoral College ----
#' sf_DKOS_Distorted_Electoral_College_Map_v1
#'
#' A `sf` object where each polygon represents a state
#'
#' @format sf
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' data <- sf_DKOS_Distorted_Electoral_College_Map_v1
#' leaflet(data,
#'   options=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>%
#'   addPolygons()
#' }
"sf_DKOS_Distorted_Electoral_College_Map_v1"

#' sf_DKOS_Distorted_Electoral_College_Map_v1.centers
#'
#' A `sf` object of centroids of each state
#'
#' @format sf
#' @rdname sf_DKOS_Distorted_Electoral_College_Map_v1
"sf_DKOS_Distorted_Electoral_College_Map_v1.centers"

# NPR Demers Cartogram ----
#' sf_NPR.DemersCartogram
#'
#' A `sf` object where each polygon represents a state
#'
#' @format sf
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' data <- sf_NPR.DemersCartogram
#' leaflet(data,
#'   options=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>%
#'   addPolygons()
#' }
"sf_NPR.DemersCartogram"

#' sf_NPR.DemersCartogram.centers
#'
#' A `sf` object of centroids of each state
#'
#' @format sf
#' @rdname sf_NPR.DemersCartogram
"sf_NPR.DemersCartogram.centers"

# Washington Post Tilegram ----
#' sf_WP
#'
#' A `sf` object where each polygon represents a state
#'
#' @format sf
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' data <- sf_WP
#' leaflet(data,
#'   options=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>%
#'   addPolygons()
#' }
"sf_WP"

#' sf_WP.centers
#'
#' A `sf` object of centroids of each state
#'
#' @format sf
#' @rdname sf_WP
"sf_WP.centers"

# Wall Street Journal Tilegram ----
#' sf_WSJ
#'
#' A `sf` object where each polygon represents a state
#'
#' @format sf
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' spdf <- sf_WSJ
#' leaflet(spdf) %>% addPolygons()
#' }
"sf_WSJ"

#' sf_WSJ.centers
#'
#' A `sf` object of centroids of each state
#'
#' @format sf
#' @rdname sf_WSJ
"sf_WSJ.centers"

# Datamap.io Tilegram ----
#' sf_Datamap.io.tilegram
#'
#' A `sf` object where each polygon represents a state
#'
#' @format sf
#' @examples \dontrun{
#' library(leaflet)
#' library(tilegramsR)
#' data <- sf_Datamap.io.tilegram
#' leaflet(data,
#'   options=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>%
#'   addPolygons()
#' }
"sf_Datamap.io.tilegram"

#' sf_Datamap.io.tilegram.centers
#'
#' A `sf` object of centroids of each state
#'
#' @format sf
#' @rdname sf_Datamap.io.tilegram
"sf_Datamap.io.tilegram.centers"

# Germany Regions ----

#' sf_germany_constituencies
#'
#' A `sf` object for regions of Germany
"sf_germany_constituencies"

#' sf_germany_constituencies.centers
#'
#' A `sf` object of centroids of each German region.
#' @rdname sf_germany_constituencies
"sf_germany_constituencies.centers"

# France Regions ----

#' sf_france_regions_population
#'
#' A `sf` object for regions of France
"sf_france_regions_population"

#' sf_france_regions_population.regions
#'
#' A `sf` object of regional boundaries of each French region.
#' @rdname sf_france_regions_population
"sf_france_regions_population.regions"

#' sf_france_regions_population.centers
#'
#' A `sf` object of centroids of each French region.
#' @rdname sf_france_regions_population
"sf_france_regions_population.centers"

# France Regions with Overseas ----

#' sf_france_all_regions_population
#'
#' A `sf` object for regions of France including overseas.
"sf_france_all_regions_population"

#' sf_france_all_regions_population.regions
#'
#' A `sf` object of regional boundaries of each French region.
#' @rdname sf_france_all_regions_population
"sf_france_all_regions_population.regions"

#' sf_france_all_regions_population.centers
#'
#' A `sf` object of centroids of each French region.
#' @rdname sf_france_all_regions_population
"sf_france_all_regions_population.centers"

# France Departments ----

#' sf_france_departments
#'
#' A `sf` object for departments of France.
"sf_france_departments"

#' sf_france_departments.centers
#'
#' A `sf` object of centroids of each French department.
#' @rdname sf_france_departments
"sf_france_departments.centers"