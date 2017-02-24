## tilegramsR

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active) [![Last-changedate](https://img.shields.io/badge/last%20change-2016--11--15-yellowgreen.svg)](/commits/master)

[![Travis-CI Build Status](https://travis-ci.org/bhaskarvk/tilegramsR.svg?branch=master)](https://travis-ci.org/bhaskarvk/tilegramsR) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/bhaskarvk/tilegramsR?branch=master&svg=true)](https://ci.appveyor.com/project/bhaskarvk/tilegramsR)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[![minimal R version](https://img.shields.io/badge/R%3E%3D-3.1.0-6666ff.svg)](https://cran.r-project.org/) [![](http://cranlogs.r-pkg.org/badges/grand-total/tilegramsR)](http://cran.rstudio.com/web/packages/tilegramsR/index.html) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/tilegramsR)](https://cran.r-project.org/package=tilegramsR) [![packageversion](https://img.shields.io/badge/Package%20version-0.1.4-orange.svg?style=flat-square)](commits/master)

----

The goal of tilegramsR is to provide R spatial objects representing Tilegrams. The primary purpose of this data is for plotting either using base plotting, ggplot2 or leaflet.
To know more about Tilegrams see [this post](https://github.com/PitchInteractiveInc/tilegrams/blob/master/MANUAL.md) and a [this web app](https://pitchinteractiveinc.github.io/tilegrams/).


### Data

The package provides the following spatial objects

#### Pitch Interactive Population based Tilegram

- **Pitch_US_Population_2016_v1**: A `SpatialPolygonsDataFrame` where each polygon = 500K people
- **Pitch_US_Population_2016_v1.states**: A `SpatialPolygonsDataFrame` where each polygon = 1 state 
- **Pitch_US_Population_2016_v1.centers**: A `SpatialPointsDataFrame` of centroids of each state

#### fivethirtyeight's Electoral College Tilegram

- **FiveThirtyEightElectoralCollege**: A `SpatialPolygonsDataFrame` where each polygon = 1 electoral college
- **FiveThirtyEightElectoralCollege.states**: A `SpatialPolygonsDataFrame` where each polygon = 1 state 
- **FiveThirtyEightElectoralCollege.centers**: A `SpatialPointsDataFrame` of centroids of each state

#### NPR 1 State = 1 Hexagon Tilegram

- **NPR1to1**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **NPR1to1.centers**: A `SpatialPointsDataFrame` of centroids of each state

#### Daily KOS Dual Hexagon Tilegram

- **DKOS_50_State_OuterHex_Tilemap_v1**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **DKOS_50_State_InnerHex_Tilemap_v1**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **DKOS_50_State_Hex_Tilemap_v1.centers**: A `SpatialPointsDataFrame` of centroids of each state

#### Daily KOS Congressional Districts Tilegram

- **DKOS_CD_Hexmap_v1.1**: A `SpatialPolygonsDataFrame` where each polygon = 1 congressional District
- **DKOS_CD_Hexmap_v1.1.states**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **DKOS_CD_Hexmap_v1.1.centers**: A `SpatialPointsDataFrame` of centroids of each state

#### Daily KOS Electoral College Tilegram

- **DKOS_Electoral_College_Map_v1**: A `SpatialPolygonsDataFrame` where each polygon = 1 electoral college
- **DKOS_Electoral_College_Map_v1.states**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **DKOS_Electoral_College_Map_v1.centers**: A `SpatialPointsDataFrame` of centroids of each state

#### Daily KOS Distorted Electoral College Tilegram

- **DKOS_Distorted_Electoral_College_Map_v1**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **DKOS_Distorted_Electoral_College_Map_v1.centers**: A `SpatialPointsDataFrame` of centroids of each state

#### NPR.DemersCartogram

- **NPR.DemersCartogram**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **NPR.DemersCartogram.centers**: A `SpatialPointsDataFrame` of centroids of each state

#### Washington Post Tilegram

- **WP**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **WP.centers**: A `SpatialPointsDataFrame` of centroids of each state

#### Wall Street Journal Tilegram

- **WSJ**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **WSJ.centers**: A `SpatialPointsDataFrame` of centroids of each state

#### Datamap.io.tilegram

- **Datamap.io.tilegram**: A `SpatialPolygonsDataFrame` where each polygon = 1 state
- **Datamap.io.tilegram.centers**: A `SpatialPointsDataFrame` of centroids of each state

As and when newer Tilegrams are made available they will be added to this package.

### Example Code

Check out `inst\examples` folder, or see it in action at [Rpubs: tilegramsR](http://rpubs.com/bhaskarvk/tilegramsR) and [Rpubs: Election Map](http://rpubs.com/bhaskarvk/electoral-Map-2016).

### Credits

- [Pitch Interactive](https://twitter.com/pitchinc) for the excellent [Tilegrams](https://pitchinteractiveinc.github.io/tilegrams/) webapp and population tilegram.
- [Daniel Donner](https://twitter.com/donnermaps) of [Daily KOS](https://refinery.dailykosbeta.com/elections-maps) for Tilegrams.
- [Ella Koeze](https://twitter.com/ellawinthrop) for [fivethirtyeight[.]com](https://projects.fivethirtyeight.com/2016-election-forecast/) Tilegrams.
- [Danny DeBelius](https://twitter.com/dannydb) & [Brian Boyer](https://twitter.com/brianboyer) for [NPR](http://blog.apps.npr.org/2015/05/11/hex-tile-maps.html)'s Hexagon Tilegrams.
- [NPR Demers Cartogram](http://www.npr.org/2016/10/18/498406765/npr-battleground-map-hillary-clinton-is-winning-and-its-not-close)
- [Washington Post Tilegram](https://www.washingtonpost.com/graphics/politics/2016-election/50-state-poll/)
- [Wall Street Journal Tilegram](http://graphics.wsj.com/elections/2016/2016-electoral-college-map-predictions/)
- [Datamap.io Tilegram](https://elections.datamap.io/us/2016/09/23/electoral_college_forecast)
