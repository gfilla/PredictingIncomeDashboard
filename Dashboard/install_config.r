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
watson_ml_creds_username <- "bc5e19f8-338c-46d0-96dc-0bb9bede2bff"
watson_ml_creds_password <- "817de803-0682-4e30-894f-5d18fada9cc6"
scoring_url <- 'https://ibm-watson-ml.mybluemix.net/v3/wml_instances/b8bbab83-104b-4a7c-ad09-300ff9d2f1a1/published_models/7541a821-1c06-4feb-9eb4-9ebf70bb3ec8/deployments/0ea8d964-3a10-4522-b7d7-9df00b3885dd/online'


data <- read.csv(file='https://dataplatform.ibm.com/exchange-api/v1/entries/5fcc01b02d8f0e50af8972dc8963f98e/data?accessKey=47b1456a2ed9761834492f1cf9e6cc0d', stringsAsFactors=F)
names(data)[names(data) == 'EDUCATION.NUM'] <- 'EDUCATION-NUM'
