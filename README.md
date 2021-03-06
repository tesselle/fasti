
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fasti

<!-- badges: start -->

[![R-CMD-check](https://github.com/tesselle/fasti/workflows/R-CMD-check/badge.svg)](https://github.com/tesselle/fasti/actions)

<a href="https://tesselle.r-universe.dev" class="pkgdown-devel"><img
src="https://tesselle.r-universe.dev/badges/fasti"
alt="r-universe" /></a>

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
<!-- badges: end -->

## Overview

Datasets for chronological modelling with
[**chronos**](https://packages.tesselle.org/chronos/). This package
provides models and data to reproduce results from **chronos** examples
and vignettes.

## Installation

You can install the latest version of **fasti** from [our
repository](https://tesselle.r-universe.dev) with:

``` r
install.packages("fasti", repos = "https://tesselle.r-universe.dev")
```

## Usage

``` r
library(fasti)
```

The `inst/` directory contains:

-   [ChronoModel](http://www.chronomodel.fr) v2.0.18 project files and
    output files (in the `chronomodel/` subdirectory).
-   [OxCal](https://c14.arch.ox.ac.uk/oxcal.html) v4.4.4 script and
    output files (in the `oxcal/` subdirectory).
-   [BCal](https://bcal.shef.ac.uk) output files (in the `bcal/`
    subdirectory).

### ChronoModel

This package allows to replicate the following results:

-   `ksarakil`: chronology of Ksâr’Akil (Lebanon) – Bosch *et al.*
    (2015)
-   `lezoux`: chronology of a potter’s kiln from Lezoux (France) –
    Menessier-Jouannet *et al.* (1995)

``` r
## Install chronos
# install.packages("chronos")
library(chronos)

## Import ChronoModel output
lezoux_path <- system.file("chronomodel/lezoux/Chain_all_Events.csv", 
                           package = "fasti")
lezoux_event <- read_chronomodel_events(lezoux_path, sep = ";", dec = ",")

## Plot MCMC sample
plot(lezoux_event, interval = "hpdi")
```

<img src="man/figures/README-chronomodel-1.png" style="display: block; margin: auto;" />

### OxCal

This package allows to replicate Bosch *et al.* (2015) results with
OxCal (and ChronoModel).

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
J.-J. (2015). New Chronology for Ksâr’Akil (Lebanon) Supports Levantine
Route of Modern Human Dispersal into Europe. *Proceedings of the
National Academy of Sciences*, 112(25): 7683-8. DOI:
[10.1073/pnas.1501529112](https://doi.org/10.1073/pnas.1501529112).

Menessier-Jouannet, C., Bucur IIiana, E. J., Lanos P., Miallier D.
(1995). Convergence de la typologie de céramiques et de trois méthodes
chronométriques pour la datation d’un four de potier à Lezoux
(Puy-de-Dôme). *Revue d’Archéométrie*, 19: 37-47. DOI:
[10.3406/arsci.1995.926](https://doi.org/10.3406/arsci.1995.926).

## Contributing

Please note that the **fasti** project is released with a [Contributor
Code of Conduct](https://www.tesselle.org/conduct.html). By contributing
to this project, you agree to abide by its terms.
