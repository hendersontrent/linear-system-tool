#-------------------------------------
# This script sets out to load all
# things required to build the app
#-------------------------------------

#--------------------------------------
# Author: Trent Henderson, 30 June 2022
#--------------------------------------

library(shiny)
library(dplyr)
library(ggplot2)
library(scales)
library(scatterplot3d)
library(plotly)
library(shinyWidgets)
library(shinycssloaders)

# Turn off scientific notation

options(scipen = 999)
