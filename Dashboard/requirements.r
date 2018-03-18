### Run this first before Knitting the RMD ##############
if(!require(devtools)){
  install.packages("devtools")
  library(devtools)
}

library(devtools)
devtools::install_github(repo = 'Davin-IBM/R4WML')
devtools::install_github('IBMDataScience/objectStoreR') 

install.packages('rmarkdown')
install.packages('flexdashboard')
install.packages('dplyr')
install.packages('jsonlite')
install.packages('shiny')
install.packages('httr')
install.packages('plotly')
install.packages('ggplot2')