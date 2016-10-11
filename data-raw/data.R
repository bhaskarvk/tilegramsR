library(sp)
library(rgdal)

# Read The shapefile for US Population Tilegram
Pitch_US_Population_2016_v1 <- readOGR('./data-raw/',
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

# Read the shapefile for the 538 Electoral College Tilegram
# So that we have one polygon per state
FiveThirtyEightElectoralCollege <- readOGR('./data-raw/',
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

# Read the shapefile for the NPR 1 to 1 Tilegram
NPR1to1 <- readOGR('./data-raw/', 'NPR1to1')

devtools::use_data(NPR1to1, overwrite = TRUE)

# No need to dissolve polygons as we already have one polygon per state

# Centers for each state of the NPR 1 to 1 Tilegram
NPR1to1.centers = SpatialPointsDataFrame(
  rgeos::gCentroid(NPR1to1,
                   byid = TRUE, id=levels(NPR1to1@data$state)),
  NPR1to1@data, match.ID = F)

devtools::use_data(NPR1to1.centers, overwrite = TRUE)

