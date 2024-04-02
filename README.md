
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Welcome

<!-- badges: start -->
<!-- badges: end -->

The `envx` package aims to be a one-stop package for ENVX1002 and
ENVX2001 students at the University of Sydney. It installs all the
packages you need for the course, and provides a set of functions to
help you with your assignments and tutorials.

**As of this writing, the package is still under development and
contains only a few tutorials in development.**

[Contributing notes for the development team.](CONTRIBUTING.md)

## Installation

You can install the development version of envx from
[GitHub](https://github.com/) with:

``` r
install.packages("remotes")
remotes::install_github("ENVX-resources/envx")
```

## Tutorials

The `envx` package includes a set of tutorials which accompany your
labs. You can list the available tutorials with the `list_tutorials()`
function:

``` r
library(envx)
list_tutorials()
#> 1: ENVX1002 Wk 5 Tutorial - Hypothesis testing and 1-sample t-tests 
#> 2: ENVX1002 Wk 6 Tutorial - Two-sample t-tests 
#> 
#> Do you want to open a tutorial? (y/n):
```

You can open a tutorial by typing the number of the tutorial you want to
open.
