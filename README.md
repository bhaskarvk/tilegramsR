# tilegramsR

The goal of tilegramsR is to provide R spatial objects representing Tilegrams.
To know more about Tilegrams see [this post](https://github.com/PitchInteractiveInc/tilegrams/blob/master/MANUAL.md) and a [this web app](https://pitchinteractiveinc.github.io/tilegrams/).

## Data

You get the following data with this package

- **Pitch_US_Population_2016_v1**: A `SpatialPolygonsDataFrame` where each polygon = 500K people
- **Pitch_US_Population_2016_v1.states**: A `SpatialPolygonsDataFrame` where each polygon = 1 state 
- **Pitch_US_Population_2016_v1.centers**: A `SpatialPointsDataFrame` of centroids of each state

- **FiveThirtyEightElectoralCollege**: A `SpatialPolygonsDataFrame` where each polygon = 1 electoral college
- **FiveThirtyEightElectoralCollege.states**: A `SpatialPolygonsDataFrame` where each polygon = 1 state 
- **FiveThirtyEightElectoralCollege.centers**: A `SpatialPointsDataFrame` of centroids of each state

- **NPR1to1**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **NPR1to1.centers**: A `SpatialPointsDataFrame` of centroids of each state

As and when newer Tilegrams are made available they will be added to this package.

## Example Code

Check out [Rpubs: tilegramsR](http://rpubs.com/bhaskarvk/tilegramsR)
