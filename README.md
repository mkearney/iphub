
<!-- README.md is generated from README.Rmd. Please edit that file -->

# iphub

<!--[![Build status](https://travis-ci.org/mkearney/iphub.svg?branch=master)](https://travis-ci.org/mkearney/iphub)
[![CRAN status](https://www.r-pkg.org/badges/version/iphub)](https://cran.r-project.org/package=iphub)
[![Coverage Status](https://codecov.io/gh/mkearney/iphub/branch/master/graph/badge.svg)](https://codecov.io/gh/mkearney/iphub?branch=master)

#![Downloads](https://cranlogs.r-pkg.org/badges/iphub)
#![Downloads](https://cranlogs.r-pkg.org/badges/grand-total/iphub)-->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

An interfact to iphub’s API <https://iphub.info>, which looks up IP
address and returns basic information along with blocking
recommendations.

## Installation

Install the development version from Github with:

``` r
## install remotes pkg if not already
if (!requireNamespace("remotes")) {
  install.packages("remotes")
}

## install from github
remotes::install_github("mkearney/iphub")
```

## Use

Example

``` r
## vector of IP addresses
ips <- c("192.0.2.1", "255.255.255.0")

## lookup info
iphub(ips)
#> # A tibble: 2 x 8
#>   ip      countryCode countryName   asn isp   block hostname block_text    
#>   <chr>   <chr>       <chr>       <int> <chr> <int> <chr>    <chr>         
#> 1 192.0.… ZZ          Unknown         0 ""        0 192.0.2… Residential/U…
#> 2 255.25… ZZ          Unknown         0 ""        0 255.255… Residential/U…
```
