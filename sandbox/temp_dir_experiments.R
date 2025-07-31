# https://rstats.wtf/installing-packages.html#fnref2

library(devtools)

tmp_lib <- "~/tmp_library"
dir.create(tmp_lib)

library(tidyverse)
df <- read_csv("~/Downloads/packages.csv")

test3 <- df$urls[1:3]

map(test3, install_github, lib = tmp_lib)

## restart R

## explicitly load the affected packages from the temporary library
tmp_lib <- "~/tmp_library"

df <- read_csv("~/Downloads/packages.csv")

test3 <- df$package[1:3]

getNamespaceExports(get(test3))

## your experimentation goes here

## done? clean up!
unlink(tmp_lib, recursive = TRUE)