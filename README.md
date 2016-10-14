# tilegramsR

The goal of tilegramsR is to provide R spatial objects representing Tilegrams. The primary purpose of this data is for plotting either using base plotting, ggplot2 or leaflet.
To know more about Tilegrams see [this post](https://github.com/PitchInteractiveInc/tilegrams/blob/master/MANUAL.md) and a [this web app](https://pitchinteractiveinc.github.io/tilegrams/).

## Data

The package provides the following spatial objects

### Pitch Interactive Population based Tilegram

- **Pitch_US_Population_2016_v1**: A `SpatialPolygonsDataFrame` where each polygon = 500K people
- **Pitch_US_Population_2016_v1.states**: A `SpatialPolygonsDataFrame` where each polygon = 1 state 
- **Pitch_US_Population_2016_v1.centers**: A `SpatialPointsDataFrame` of centroids of each state

### fivethirtyeight's Electoral College Tilegram

- **FiveThirtyEightElectoralCollege**: A `SpatialPolygonsDataFrame` where each polygon = 1 electoral college
- **FiveThirtyEightElectoralCollege.states**: A `SpatialPolygonsDataFrame` where each polygon = 1 state 
- **FiveThirtyEightElectoralCollege.centers**: A `SpatialPointsDataFrame` of centroids of each state

### NPR 1 State = 1 Hexagon Tilegram

- **NPR1to1**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **NPR1to1.centers**: A `SpatialPointsDataFrame` of centroids of each state

### Daily KOS Dual Hexagon Tilegram

- **DKOS_50_State_OuterHex_Tilemap_v1**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **DKOS_50_State_InnerHex_Tilemap_v1**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **DKOS_50_State_Hex_Tilemap_v1.centers**: A `SpatialPointsDataFrame` of centroids of each state

### Daily KOS Congressional Districts Tilegram

- **DKOS_CD_Hexmap_v1.1**: A `SpatialPolygonsDataFrame` where each polygon = 1 congressional District
- **DKOS_CD_Hexmap_v1.1.states**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **DKOS_CD_Hexmap_v1.1.centers**: A `SpatialPointsDataFrame` of centroids of each state

### Daily KOS Electoral College Tilegram

- **DKOS_Electoral_College_Map_v1**: A `SpatialPolygonsDataFrame` where each polygon = 1 electoral college
- **DKOS_Electoral_College_Map_v1.states**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **DKOS_Electoral_College_Map_v1.centers**: A `SpatialPointsDataFrame` of centroids of each state

### Daily KOS Distorted Electoral College Tilegram

- **DKOS_Distorted_Electoral_College_Map_v1**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **DKOS_Distorted_Electoral_College_Map_v1.centers**: A `SpatialPointsDataFrame` of centroids of each state

As and when newer Tilegrams are made available they will be added to this package.

## Example Code

Check out `inst\examples` folder, or see it in action at [Rpubs: tilegramsR](http://rpubs.com/bhaskarvk/tilegramsR) and [Rpubs: Election Map](http://rpubs.com/bhaskarvk/electoral-Map-2016).

## Credits

- [Pitch Interactive](https://twitter.com/pitchinc) for the excellent [Tilegrams](https://pitchinteractiveinc.github.io/tilegrams/) webapp and population tilegram.
- [Daniel Donner](https://twitter.com/donnermaps) of [Daily KOS](https://refinery.dailykosbeta.com/elections-maps) for Tilegrams.
- [Ella Koeze](https://twitter.com/ellawinthrop) for [fivethirtyeight[.]com](https://projects.fivethirtyeight.com/2016-election-forecast/) Tilegrams.
- [Danny DeBelius](https://twitter.com/dannydb) & [Brian Boyer](https://twitter.com/brianboyer) for [NPR](http://blog.apps.npr.org/2015/05/11/hex-tile-maps.html)'s Hexagon Tilegrams.
