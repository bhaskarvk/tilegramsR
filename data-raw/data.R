library(sf)

# Pitch Interactive's Population based tilegram ----

sf_Pitch_US_Population_2016_v1 <- read_sf(
  './data-raw/Pitch_US_Population_2016_v1',
  'Pitch_US_Population_2016_v1')
devtools::use_data(sf_Pitch_US_Population_2016_v1, overwrite = TRUE)

sf_Pitch_US_Population_2016_v1.states <-
  st_set_precision(sf_Pitch_US_Population_2016_v1, 1000) %>%
  dplyr::group_by(state) %>%
  dplyr::summarise(geometry = st_union(geometry)) %>%
  dplyr::ungroup()
devtools::use_data(sf_Pitch_US_Population_2016_v1.states, overwrite = TRUE)

sf_Pitch_US_Population_2016_v1.centers <- st_centroid(
  sf_Pitch_US_Population_2016_v1.states)
devtools::use_data(sf_Pitch_US_Population_2016_v1.centers, overwrite = TRUE)

# fivethirtyeight.com's Electoral College based Tilegram ----

# Read the shapefile for the 538 Electoral College Tilegram
sf_FiveThirtyEightElectoralCollege <- read_sf(
  './data-raw/FiveThirtyEightElectoralCollege',
  'FiveThirtyEightElectoralCollege')
devtools::use_data(sf_FiveThirtyEightElectoralCollege, overwrite = TRUE)

# Dissolve polygons in to state polygons
# So that we have one polygon per state
sf_FiveThirtyEightElectoralCollege.states <-
  st_set_precision(sf_FiveThirtyEightElectoralCollege, 1000) %>%
  dplyr::group_by(state) %>%
  dplyr::summarise(geometry = st_union(geometry)) %>%
  dplyr::ungroup()
devtools::use_data(sf_FiveThirtyEightElectoralCollege.states, overwrite = TRUE)

# Centers for each state of the 538 Electoral College Tilegram
sf_FiveThirtyEightElectoralCollege.centers <- st_centroid(
  sf_FiveThirtyEightElectoralCollege.states)
devtools::use_data(sf_FiveThirtyEightElectoralCollege.centers, overwrite = TRUE)

# NPR's Hexbin based tilegram ----

# Read the shapefile for the NPR 1 to 1 Tilegram
sf_NPR1to1 <- read_sf('./data-raw/NPR1to1', 'NPR1to1')
devtools::use_data(sf_NPR1to1, overwrite = TRUE)

# No need to dissolve polygons as we already have one polygon per state

# Centers for each state of the NPR 1 to 1 Tilegram
sf_NPR1to1.centers <- st_centroid(sf_NPR1to1)
devtools::use_data(sf_NPR1to1.centers, overwrite = TRUE)

# Congressional District Hexmaps from Daily KOS ----
# http://refinery.dailykosbeta.com/elections-maps/hexmap
sf_DKOS_CD_Hexmap_v1.1 <- read_sf('./data-raw/HexCDv11/','HexCDv11') %>%
  st_set_crs(NA)
devtools::use_data(sf_DKOS_CD_Hexmap_v1.1, overwrite = TRUE)

# Dissolve polygons in to state polygons
# So that we have one polygon per state
sf_DKOS_CD_Hexmap_v1.1.states  <-
  st_set_precision(sf_DKOS_CD_Hexmap_v1.1, 10) %>%
  dplyr::group_by(STATEAB) %>%
  dplyr::summarise(geometry = st_union(geometry)) %>%
  dplyr::ungroup()
devtools::use_data(sf_DKOS_CD_Hexmap_v1.1.states, overwrite = TRUE)

# Centers for each state of the DailyKOS Congressional Districts Hexmaps
sf_DKOS_CD_Hexmap_v1.1.centers <- st_centroid(sf_DKOS_CD_Hexmap_v1.1.states)
devtools::use_data(sf_DKOS_CD_Hexmap_v1.1.centers, overwrite = TRUE)

# Electoral College Map from Daily KOS ----
# http://refinery.dailykosbeta.com/elections-maps/electoral-college-map

# The state filed has different entries for Nebraska and Maine's Districts
# So we need to extract the trueState from them.
sf_DKOS_Electoral_College_Map_v1 <- read_sf(
  './data-raw/ElecCollv10/','ElecCollv10') %>%
  st_set_crs(NA) %>%
  dplyr::mutate(State.abb=as.factor(stringr::str_extract(State,'^..')))
devtools::use_data(sf_DKOS_Electoral_College_Map_v1, overwrite = TRUE)

sf_DKOS_Electoral_College_Map_v1.states <-
  st_set_precision(sf_DKOS_Electoral_College_Map_v1,1000) %>%
  dplyr::group_by(State.abb) %>%
  dplyr::summarise(geometry = st_union(geometry)) %>%
  dplyr::ungroup()

devtools::use_data(sf_DKOS_Electoral_College_Map_v1.states, overwrite = TRUE)

sf_DKOS_Electoral_College_Map_v1.centers <- st_centroid(
  sf_DKOS_Electoral_College_Map_v1.states )
devtools::use_data(sf_DKOS_Electoral_College_Map_v1.centers, overwrite = TRUE)

# Distorted Electoral College Map from Daily KOS ----
# http://refinery.dailykosbeta.com/elections-maps/electoral-college-map

sf_DKOS_Distorted_Electoral_College_Map_v1 <- read_sf(
  './data-raw/DistortECv10/','DistortECv10') %>%
  st_set_crs(NA) %>%
  st_simplify(preserveTopology = TRUE, 5000)

devtools::use_data(sf_DKOS_Distorted_Electoral_College_Map_v1, overwrite = TRUE)

sf_DKOS_Distorted_Electoral_College_Map_v1.centers <-
  st_centroid(sf_DKOS_Distorted_Electoral_College_Map_v1)

devtools::use_data(sf_DKOS_Distorted_Electoral_College_Map_v1.centers, overwrite = TRUE)

# 50 State Dual Hexbin Tilemap from Daily KOS ----
# http://refinery.dailykosbeta.com/elections-maps/tile-map

sf_DKOS_50_State_OuterHex_Tilemap_v1 <- read_sf(
  './data-raw/TileOutv10/','TileOutv10') %>%
  st_set_crs(NA)
sf_DKOS_50_State_InnerHex_Tilemap_v1 <- read_sf(
  './data-raw/TileInv10/','TileInv10') %>%
  st_set_crs(NA)

devtools::use_data(sf_DKOS_50_State_OuterHex_Tilemap_v1, overwrite = TRUE)
devtools::use_data(sf_DKOS_50_State_InnerHex_Tilemap_v1, overwrite = TRUE)


sf_DKOS_50_State_Hex_Tilemap_v1.centers <- st_centroid(
  sf_DKOS_50_State_OuterHex_Tilemap_v1)

devtools::use_data(sf_DKOS_50_State_Hex_Tilemap_v1.centers, overwrite = TRUE)

# NPR Demers Cartogram ----
# http://www.npr.org/2016/10/09/497277536

sf_NPR.DemersCartogram <- read_sf(
  './data-raw/NPR/npr.geojson', 'OGRGeoJSON') %>%
  st_set_crs(NA)

devtools::use_data(sf_NPR.DemersCartogram, overwrite = TRUE)

sf_NPR.DemersCartogram.centers <- st_centroid(sf_NPR.DemersCartogram)

devtools::use_data(sf_NPR.DemersCartogram.centers, overwrite = TRUE)

# Washington Post Tiles ----
# https://www.washingtonpost.com/graphics/politics/2016-election/50-state-poll/

sf_WP <- read_sf('./data-raw/WashingtonPost/wp.geojson', 'OGRGeoJSON') %>%
  st_set_crs(NA)

devtools::use_data(sf_WP, overwrite = TRUE)

sf_WP.centers <- st_centroid(sf_WP)
devtools::use_data(sf_WP.centers, overwrite = TRUE)

# Wall Street Journal Tiles ----
# http://graphics.wsj.com/elections/2016/2016-electoral-college-map-predictions/

sf_WSJ <- read_sf('./data-raw/WallStreetJournal/wsj.geojson', 'OGRGeoJSON') %>%
  st_set_crs(NA)
sf_WSJ.states <- read_sf('./data-raw/WallStreetJournal/wsj-states.geojson', 'OGRGeoJSON') %>%
  st_set_crs(NA)
devtools::use_data(sf_WSJ.states, overwrite = TRUE)

sf_WSJ.centers <- st_centroid(sf_WSJ.states)
devtools::use_data(sf_WSJ.centers, overwrite = TRUE)

# Datamap.io ----
# https://elections.datamap.io/us/2016/09/23/electoral_college_forecast
# http://bl.ocks.org/rogerfischer/15ef631812c56e3ef85af8191ef0de75

sf_Datamap.io.tilegram <- read_sf(
  './data-raw/datamap', 'us_ec2016_state_hexagon') %>%
  dplyr::mutate(FIPS=stringr::str_extract(id,'..$')) %>%
  dplyr::left_join(
    usgazetteer::state.areas.2010 %>%
      dplyr::select(State, FIPS, USPS),
    by=c('FIPS'='FIPS'))

devtools::use_data(sf_Datamap.io.tilegram, overwrite = TRUE)

sf_Datamap.io.tilegram.centers <- st_centroid(sf_Datamap.io.tilegram)
devtools::use_data(sf_Datamap.io.tilegram.centers, overwrite = TRUE)

# Germany Constituencies ----
# https://github.com/PitchInteractiveInc/tilegrams/blob/master/tilegrams/germany-constituencies.json

sf_germany_constituencies <- read_sf(
  './data-raw/Pitch_Germany/tiles.geojson', 'OGRGeoJSON') %>%
  st_set_crs(NA) %>%
  dplyr::mutate(name=stringr::str_conv(name,'UTF-8'))

devtools::use_data(sf_germany_constituencies, overwrite = TRUE)

sf_germany_constituencies.centers <- st_centroid(sf_germany_constituencies)
devtools::use_data(sf_germany_constituencies.centers, overwrite = TRUE)

# France Regions ----
# https://github.com/PitchInteractiveInc/tilegrams/blob/master/tilegrams/france-population.json

sf_france_regions_population <- read_sf(
  './data-raw/Pitch_France/Pitch_France_Regions_Population.geojson',
  'OGRGeoJSON') %>%
  st_set_crs(NA) %>%
  dplyr::mutate(name=stringr::str_conv(name,'UTF-8'))

devtools::use_data(sf_france_regions_population, overwrite = TRUE)

sf_france_regions_population.regions <- read_sf(
  './data-raw/Pitch_France/Pitch_France_Regions_Population-2.geojson',
  'OGRGeoJSON') %>%
  st_set_crs(NA) %>%
  dplyr::mutate(name=stringr::str_conv(name,'UTF-8'))

devtools::use_data(sf_france_regions_population.regions, overwrite = TRUE)

sf_france_regions_population.centers <- st_centroid(
  sf_france_regions_population.regions)
devtools::use_data(sf_france_regions_population.centers, overwrite = TRUE)

# France Regions w/ Overseas ----
# https://github.com/PitchInteractiveInc/tilegrams/blob/master/tilegrams/france-population-with-overseas.json

sf_france_all_regions_population <- read_sf(
  './data-raw/Pitch_France/Pitch_France_All_Regions_Population.geojson',
  'OGRGeoJSON') %>%
  st_set_crs(NA) %>%
  dplyr::mutate(name=stringr::str_conv(name,'UTF-8'))

devtools::use_data(sf_france_all_regions_population, overwrite = TRUE)

sf_france_all_regions_population.regions <- read_sf(
  './data-raw/Pitch_France/Pitch_France_All_Regions_Population-2.geojson',
  'OGRGeoJSON') %>%
  st_set_crs(NA) %>%
  dplyr::mutate(name=stringr::str_conv(name,'UTF-8'))

devtools::use_data(sf_france_all_regions_population.regions, overwrite = TRUE)

sf_france_all_regions_population.centers <- st_centroid(
  sf_france_all_regions_population.regions)
devtools::use_data(sf_france_all_regions_population.centers, overwrite = TRUE)

# France Departments ----
# https://github.com/PitchInteractiveInc/tilegrams/blob/master/tilegrams/france-departments-one-to-one.json

sf_france_departments <- read_sf(
  './data-raw/Pitch_France/Pitch_France_Departments.geojson',
  'OGRGeoJSON') %>%
  st_set_crs(NA) %>%
  dplyr::mutate(name=stringr::str_conv(name,'UTF-8'))

devtools::use_data(sf_france_departments, overwrite = TRUE)

sf_france_departments.centers <- st_centroid(
  sf_france_departments)
devtools::use_data(sf_france_departments.centers, overwrite = TRUE)
