library(sp)
library(rgdal)

# Pitch Interactive's Population based tilegram ----

# Read The shapefile for US Population Tilegram
Pitch_US_Population_2016_v1 <- readOGR('./data-raw/Pitch_US_Population_2016_v1',
                                       'Pitch_US_Population_2016_v1')

devtools::use_data(Pitch_US_Population_2016_v1, overwrite = TRUE)

# Dissolve polygons in to state polygons
# So that we have one polygon per state
Pitch_US_Population_2016_v1.states <- rmapshaper::ms_dissolve(
  Pitch_US_Population_2016_v1, 'state'
)

devtools::use_data(Pitch_US_Population_2016_v1.states, overwrite = TRUE)

# Centers for each state of the US Population Timegram
Pitch_US_Population_2016_v1.centers = SpatialPointsDataFrame(
  rgeos::gCentroid(Pitch_US_Population_2016_v1.states,
                   byid = TRUE,
                   id=Pitch_US_Population_2016_v1.states@data$state),
  Pitch_US_Population_2016_v1.states@data, match.ID = F)

devtools::use_data(Pitch_US_Population_2016_v1.centers, overwrite = TRUE)

# fivethirtyeight.com's Electoral College based Tilegram ----

# Read the shapefile for the 538 Electoral College Tilegram
# So that we have one polygon per state
FiveThirtyEightElectoralCollege <- readOGR('./data-raw/FiveThirtyEightElectoralCollege',
                                           'FiveThirtyEightElectoralCollege')

devtools::use_data(FiveThirtyEightElectoralCollege, overwrite = TRUE)

# Dissolve polygons in to state polygons
FiveThirtyEightElectoralCollege.states <- rmapshaper::ms_dissolve(
  FiveThirtyEightElectoralCollege, 'state'
)

devtools::use_data(FiveThirtyEightElectoralCollege.states, overwrite = TRUE)


# Centers for each state of the 538 Electoral College Tilegram
FiveThirtyEightElectoralCollege.centers = SpatialPointsDataFrame(
  rgeos::gCentroid(FiveThirtyEightElectoralCollege.states,
                   byid = TRUE, id=FiveThirtyEightElectoralCollege.states@data$state),
  FiveThirtyEightElectoralCollege.states@data, match.ID = F)

devtools::use_data(FiveThirtyEightElectoralCollege.centers, overwrite = TRUE)

# NPR's Hexbin based tilegram ----

# Read the shapefile for the NPR 1 to 1 Tilegram
NPR1to1 <- readOGR('./data-raw/NPR1to1', 'NPR1to1')

devtools::use_data(NPR1to1, overwrite = TRUE)

# No need to dissolve polygons as we already have one polygon per state

# Centers for each state of the NPR 1 to 1 Tilegram
NPR1to1.centers = SpatialPointsDataFrame(
  rgeos::gCentroid(NPR1to1,
                   byid = TRUE, id=levels(NPR1to1@data$state)),
  NPR1to1@data, match.ID = F)

devtools::use_data(NPR1to1.centers, overwrite = TRUE)

# Congressional District Hexmaps from Daily KOS ----
# http://refinery.dailykosbeta.com/elections-maps/hexmap

DKOS_CD_Hexmap_v1.1 <- readOGR('./data-raw/HexCDv11/','HexCDv11')

devtools::use_data(DKOS_CD_Hexmap_v1.1, overwrite = TRUE)

# The states shapefile has an invalid geometry which is fixed using cleangeo
DKOS_CD_Hexmap_v1.1.states  <- cleangeo::clgeo_Clean(
  readOGR('./data-raw/HexSTv11/','HexSTv11'))

devtools::use_data(DKOS_CD_Hexmap_v1.1.states, overwrite = TRUE)

DKOS_CD_Hexmap_v1.1.centers = SpatialPointsDataFrame(
  rgeos::gCentroid(DKOS_CD_Hexmap_v1.1.states,
                   byid = TRUE, id=DKOS_CD_Hexmap_v1.1.states@data$STATE),
  DKOS_CD_Hexmap_v1.1.states@data, match.ID = F)

devtools::use_data(DKOS_CD_Hexmap_v1.1.centers, overwrite = TRUE)

# Electoral College Map from Daily KOS ----
# http://refinery.dailykosbeta.com/elections-maps/electoral-college-map

# The shapefile has an invalid geometry which is fixed using cleangeo
DKOS_Electoral_College_Map_v1 <- cleangeo::clgeo_Clean(
  readOGR('./data-raw/ElecCollv10/','ElecCollv10'))

# The state filed has different entries for Nebraska and Maine's Districts
# So we need to extract the trueState from them.
DKOS_Electoral_College_Map_v1@data %<>%
  dplyr::mutate(trueState=stringr::str_extract(State,'^..'))

devtools::use_data(DKOS_Electoral_College_Map_v1, overwrite = TRUE)

DKOS_Electoral_College_Map_v1.states <- rmapshaper::ms_dissolve(
  DKOS_Electoral_College_Map_v1, 'trueState'
)

devtools::use_data(DKOS_Electoral_College_Map_v1.states, overwrite = TRUE)

DKOS_Electoral_College_Map_v1.centers = SpatialPointsDataFrame(
  rgeos::gCentroid(DKOS_Electoral_College_Map_v1.states,
                   byid = TRUE,
                   id=DKOS_Electoral_College_Map_v1.states@data$trueState),
  DKOS_Electoral_College_Map_v1.states@data, match.ID = F)

devtools::use_data(DKOS_Electoral_College_Map_v1.centers, overwrite = TRUE)

# Distorted Electoral College Map from Daily KOS ----
# http://refinery.dailykosbeta.com/elections-maps/electoral-college-map

# The geometries of this shapefile can be simplified for performance reasons
DKOS_Distorted_Electoral_College_Map_v1 <- rmapshaper::ms_simplify(
  readOGR('./data-raw/DistortECv10/','DistortECv10'))

devtools::use_data(DKOS_Distorted_Electoral_College_Map_v1, overwrite = TRUE)

DKOS_Distorted_Electoral_College_Map_v1.centers = SpatialPointsDataFrame(
  rgeos::gCentroid(DKOS_Distorted_Electoral_College_Map_v1,
                   byid = TRUE,
                   id=DKOS_Distorted_Electoral_College_Map_v1@data$STUSPS),
  DKOS_Distorted_Electoral_College_Map_v1@data, match.ID = F)

devtools::use_data(DKOS_Distorted_Electoral_College_Map_v1.centers, overwrite = TRUE)

# 50 State Dual Hexbin Tilemap from Daily KOS ----
# http://refinery.dailykosbeta.com/elections-maps/tile-map

DKOS_50_State_OuterHex_Tilemap_v1 <- readOGR('./data-raw/TileOutv10/','TileOutv10')
DKOS_50_State_InnerHex_Tilemap_v1 <- readOGR('./data-raw/TileInv10/','TileInv10')

devtools::use_data(DKOS_50_State_OuterHex_Tilemap_v1, overwrite = TRUE)
devtools::use_data(DKOS_50_State_InnerHex_Tilemap_v1, overwrite = TRUE)


DKOS_50_State_Hex_Tilemap_v1.centers = SpatialPointsDataFrame(
  rgeos::gCentroid(DKOS_50_State_OuterHex_Tilemap_v1,
                   byid = TRUE, id=DKOS_50_State_OuterHex_Tilemap_v1@data$State),
  DKOS_50_State_OuterHex_Tilemap_v1@data, match.ID = F)

devtools::use_data(DKOS_50_State_Hex_Tilemap_v1.centers, overwrite = TRUE)
