#-------------------------------------
# This script sets out to load all
# things required to build the app
#-------------------------------------

#--------------------------------------
# Author: Trent Henderson, 30 June 2022
#--------------------------------------

library(shiny)
library(matlib)
library(dplyr)
library(ggplot2)
library(scales)
library(scatterplot3d)
library(plotly)
library(shinyWidgets)
library(shinycssloaders)

# Load in any HTML imports

import_files <- list.files("imports", full.names = TRUE, pattern = "\\.html")
for(f in import_files){
  object_name <- gsub("imports/", "", f)
  object_name <- gsub("\\.html", "", object_name)
  assign(object_name, readLines(f, warn = FALSE))
}

# Load in any R functions

r_files <- list.files("R", full.names = TRUE, pattern = "\\.[Rr]")
for(f in r_files){
  source(f)
}

# Turn off scientific notation

options(scipen = 999)
