library(shiny)
library(httr)
library(stringr)
library(DT)
library(dplyr)
library(fresh)
library(shinyWidgets)
library(tools)
library(shinycssloaders)
library(shinyjs)
library(shinyCopy2clipboard)
library(datasets)


#------------Fake Data--------------------#
names <- c("Table 1","Table 2","Table 3","Table 4","Table 5","Table 6","Table 7")
desc <- rep("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",7)
tables <- data.frame(names, desc)
