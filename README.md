
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fasti

<!-- badges: start -->

[![r-universe](https://tesselle.r-universe.dev/badges/fasti)](https://tesselle.r-universe.dev)

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
<!-- badges: end -->

## Overview

Datasets for Chronological Modelling with
[**ArchaeoPhases**](https://github.com/ArchaeoStat/ArchaeoPhases). This
package provides models and data to reproduce results from
**ArchaeoPhases** examples and vignettes.

## Installation

You can install the latest version of **fasti** from [our
repository](https://tesselle.r-universe.dev) with:

``` r
install.packages("fasti", repos = "https://tesselle.r-universe.dev")
```

## Usage

The `inst/` directory contains:

-   [ChronoModel](http://www.chronomodel.fr) v2.0.18 project[1] and
    output files (in the `chronomodel/` subdirectory).
-   [OxCal](https://c14.arch.ox.ac.uk/oxcal.html) v4.4.4 script and
    output files (in the `oxcal/` subdirectory).
-   [BCal](https://bcal.shef.ac.uk) output files (in the `bcal/`
    subdirectory).

This package allows to replicate Bosch *et al.* (2015) results with
OxCal and ChronoModel.

``` r
## Install and load oxcAAR
# install.packages("oxcAAR")
library(oxcAAR)

## Download and setup OxCal
quickSetupOxcal()

## Import the OxCal script
path_script <- system.file("oxcal/ksarakil.oxcal", package = "fasti")
ksarakil_script <- paste0(readLines(path_script), collapse = "\n")

## Execute OxCal
ksarakil_file <- executeOxcalScript(ksarakil_script)
ksarakil_text <- readOxcalOutput(ksarakil_file)
ksarakil_data <- parseFullOxcalOutput(ksarakil_text)

## Get the MCMC samples
path_mcmc <- paste0(dirname(ksarakil_file), "/MCMC_Sample.csv")
mcmc <- read.csv(path_mcmc, header = TRUE, sep = ",", dec = ".")
```

## References

Bosch, M. D., Mannino, M. A., Prendergast, A. L., O’Connell, T. C.,
Demarchi, B., Taylor, S. M., Niven, L., van der Plicht, J. and Hublin,
J.-J. (2015). New Chronology for Ksâr ’Akil (Lebanon) Supports Levantine
Route of Modern Human Dispersal into Europe. *Proceedings of the
National Academy of Sciences*, 112(25): 7683-8. DOI:
[10.1073/pnas.1501529112](https://doi.org/10.1073/pnas.1501529112).

## Contributing

Please note that the **fasti** project is released with a [Contributor
Code of Conduct](https://www.tesselle.org/conduct.html). By contributing
to this project, you agree to abide by its terms.

[1] To keep the package to a reasonable size, the ChronoModel files
(`.chr`) are ignored when the package is built (only the output files
are bundled). If you want to run the model on your machine, you must
download the source package.
