
<!-- README.md is generated from README.Rmd. Please edit that file -->
tilegramsR
----------

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active) [![Last-changedate](https://img.shields.io/badge/last%20change-2017--03--29-green.svg)](/commits/master) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![keybase verified](https://img.shields.io/badge/keybase-verified-brightgreen.svg)](https://gist.github.com/bhaskarvk/46fbf2ba7b5713151d7e)

[![Travis-CI Build Status](https://travis-ci.org/bhaskarvk/tilegramsR.svg?branch=master)](https://travis-ci.org/bhaskarvk/tilegramsR) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/bhaskarvk/tilegramsR?branch=master&svg=true)](https://ci.appveyor.com/project/bhaskarvk/tilegramsR)

[![minimal R version](https://img.shields.io/badge/R%3E%3D-3.1.0-6666ff.svg)](https://cran.r-project.org/) [![packageversion](https://img.shields.io/badge/Package%20version-0.2.0-orange.svg?style=flat-square)](commits/master) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/tilegramsR)](https://cran.r-project.org/package=tilegramsR) [![](http://cranlogs.r-pkg.org/badges/grand-total/tilegramsR)](http://cran.rstudio.com/web/packages/tilegramsR/index.html)

------------------------------------------------------------------------

The goal of tilegramsR is to provide R spatial objects representing Tilegrams. The primary purpose of this data is for plotting either using base plotting, ggplot2 or leaflet. To know more about Tilegrams see [this post](https://github.com/PitchInteractiveInc/tilegrams/blob/master/MANUAL.md) and a [this web app](https://pitchinteractiveinc.github.io/tilegrams/).

### Usage

#### Installation

``` r
install.packages('tilegramsR')

#OR Latest Development version

devtools::install_github('bhaskarvk/tilegramsR')
```

#### Example Code

Check out `inst\examples` folder, or see it in action at [Rpubs: tilegramsR](http://rpubs.com/bhaskarvk/tilegramsR) and [Rpubs: Election Map](http://rpubs.com/bhaskarvk/electoral-Map-2016).

### Data

The package provides spatial objects in [sf](https://github.com/edzer/sfr) format.

#### Pitch Interactive Tilegrams

##### U.S.A

-   **sf\_Pitch\_US\_Population\_2016\_v1**: A `sf` object where each feature = 500K people
-   **sf\_Pitch\_US\_Population\_2016\_v1.states**: A `sf` object where each feature = 1 state of the U.S.A
-   **sf\_Pitch\_US\_Population\_2016\_v1.centers**: A `sf` object of centroids of each state of the U.S.A.

##### Germany

-   **sf\_germany\_constituencies**: A `sf` object where each feature is a German Constituency
-   **sf\_germany\_constituencies.centers**: A `sf` object of centroids of each German Constituency

##### France

-   **sf\_france\_regions\_population**: A `sf` object of French regions
-   **sf\_france\_regions\_population.regions**: A `sf` object of boundaries of French regions
-   **sf\_france\_regions\_population.centers**: A `sf` object of centroids of each French region
-   **sf\_france\_all\_regions\_population**: A `sf` object of French Regions including overseas regions
-   **sf\_france\_all\_regions\_population.regions**: A `sf` object of boundaries of all French regions
-   **sf\_france\_all\_regions\_population.centers**: A `sf` object of centroids of each French Region including overseas regions
-   **sf\_france\_departments**: A `sf` object of French departments
-   **sf\_france\_departments.centers**: A `sf` object of centroids of each French department

#### fivethirtyeight's Electoral College Tilegram

-   **sf\_FiveThirtyEightElectoralCollege**: A `sf` object where each feature = 1 electoral college
-   **sf\_FiveThirtyEightElectoralCollege.states**: A `sf` object where each feature = 1 state of the U.S.A
-   **sf\_FiveThirtyEightElectoralCollege.centers**: A `sf` object of centroids of each state of the U.S.A.

#### NPR

##### Hexagon Tilegram

-   **sf\_NPR1to1**: A `sf` object where each feature = 1 state of the U.S.A
-   **sf\_NPR1to1.centers**: A `sf` object of centroids of each state of the U.S.A.

##### NPR.DemersCartogram

-   **sf\_NPR.DemersCartogram**: A `sf` object where each feature = 1 state of the U.S.A
-   **sf\_NPR.DemersCartogram.centers**: A `sf` object of centroids of each state of the U.S.A.

#### Daily KOS

##### Dual Hexagon Tilegram

-   **sf\_DKOS\_50\_State\_OuterHex\_Tilemap\_v1**: A `sf` object where each feature = 1 state of the U.S.A
-   **sf\_DKOS\_50\_State\_InnerHex\_Tilemap\_v1**: A `sf` object where each feature = 1 state of the U.S.A
-   **sf\_DKOS\_50\_State\_Hex\_Tilemap\_v1.centers**: A `sf` object of centroids of each state of the U.S.A.

##### Congressional Districts Tilegram

-   **sf\_DKOS\_CD\_Hexmap\_v1.1**: A `sf` object where each feature = 1 congressional District
-   **sf\_DKOS\_CD\_Hexmap\_v1.1.states**: A `sf` object where each feature = 1 state of the U.S.A
-   **sf\_DKOS\_CD\_Hexmap\_v1.1.centers**: A `sf` object of centroids of each state of the U.S.A.

##### Electoral College Tilegram

-   **sf\_DKOS\_Electoral\_College\_Map\_v1**: A `sf` object where each feature = 1 electoral college
-   **sf\_DKOS\_Electoral\_College\_Map\_v1.states**: A `sf` object where each feature = 1 state of the U.S.A
-   **sf\_DKOS\_Electoral\_College\_Map\_v1.centers**: A `sf` object of centroids of each state of the U.S.A.

##### Distorted Electoral College Tilegram

-   **sf\_DKOS\_Distorted\_Electoral\_College\_Map\_v1**: A `sf` object where each feature = 1 state of the U.S.A
-   **sf\_DKOS\_Distorted\_Electoral\_College\_Map\_v1.centers**: A `sf` object of centroids of each state of the U.S.A.

#### Washington Post Tilegram

-   **sf\_WP**: A `sf` object where each feature = 1 state of the U.S.A
-   **sf\_WP.centers**: A `sf` object of centroids of each state of the U.S.A.

#### Wall Street Journal Tilegram

-   **sf\_WSJ**: A `sf` object where each feature = 1 state of the U.S.A
-   **sf\_WSJ.centers**: A `sf` object of centroids of each state of the U.S.A.

#### Datamap.io.tilegram

-   **sf\_Datamap.io.tilegram**: A `sf` object where each feature = 1 state of the U.S.A
-   **sf\_Datamap.io.tilegram.centers**: A `sf` object of centroids of each state of the U.S.A.

As and when newer Tilegrams are made available they will be added to this package.

### Credits

-   [Pitch Interactive](https://twitter.com/pitchinc) for the excellent [Tilegrams](https://pitchinteractiveinc.github.io/tilegrams/) webapp and population tilegram.
-   [Daniel Donner](https://twitter.com/donnermaps) of [Daily KOS](https://refinery.dailykosbeta.com/elections-maps) for Tilegrams.
-   [Ella Koeze](https://twitter.com/ellawinthrop) for [fivethirtyeight\[.\]com](https://projects.fivethirtyeight.com/2016-election-forecast/) Tilegrams.
-   [Danny DeBelius](https://twitter.com/dannydb) & [Brian Boyer](https://twitter.com/brianboyer) for [NPR](http://blog.apps.npr.org/2015/05/11/hex-tile-maps.html)'s Hexagon Tilegrams.
-   [NPR Demers Cartogram](http://www.npr.org/2016/10/18/498406765/npr-battleground-map-hillary-clinton-is-winning-and-its-not-close)
-   [Washington Post Tilegram](https://www.washingtonpost.com/graphics/politics/2016-election/50-state-poll/)
-   [Wall Street Journal Tilegram](http://graphics.wsj.com/elections/2016/2016-electoral-college-map-predictions/)
-   [Datamap.io Tilegram](https://elections.datamap.io/us/2016/09/23/electoral_college_forecast)
