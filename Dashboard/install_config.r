#devtools::install_github(repo = 'Davin-IBM/R4WML')
library(R4WML)
library(flexdashboard)
library(jsonlite)
library(shiny)
library(httr)
library(plotly)
library(ggplot2)

#credentials for Watson Machine Learning and soring endpoint
watson_ml_creds_url      <- 'https://ibm-watson-ml.mybluemix.net'

watson_ml_creds_username <- "YOUR WML USERNAME"
watson_ml_creds_password <- "YOUR WML PASSWORD"

scoring_url <- 'URL FOUND AFTER DEPLOYING YOUR MODEL'


data <- read.csv(file='https://dataplatform.ibm.com/exchange-api/v1/entries/5fcc01b02d8f0e50af8972dc8963f98e/data?accessKey=47b1456a2ed9761834492f1cf9e6cc0d', stringsAsFactors=F)
names(data)[names(data) == 'EDUCATION.NUM'] <- 'EDUCATION-NUM'
