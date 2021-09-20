## code to prepare `DATASET` dataset goes here
ksarakil <- read.table(file = "data-raw/ksarakil.csv", header = TRUE,
                       sep = ",", dec = ".")
usethis::use_data(ksarakil, overwrite = TRUE)
