
### Run this first before Knitting the RMD ##############
if(!require(devtools)){
  install.packages("devtools")
  library(devtools)
}

library(devtools)
devtools::install_github(repo = 'Davin-IBM/R4WML')
devtools::install_github('IBMDataScience/objectStoreR') 

library('objectStoreR') 
library(flexdashboard)
library(dplyr)
library(jsonlite)
library(shiny)
library(httr)
library(R4WML)
library(plotly)
library(ggplot2)


#########################
## Configure WML       ##
#########################

## WML Credentials ##
token_url <- "https://ibm-watson-ml.mybluemix.net/v3/identity/token"
username <- '4fae7652-8cf5-4fc5-a90b-6a80e8120cd0'
password <- 'e183a9fc-a67b-4aea-b787-59527a2da805'

## Get WML token
auth_token <- get_wml_auth_token(token_url, username, password)

## Get authentication headers
wml_url <- "https://ibm-watson-ml.mybluemix.net"
auth_headers <- get_wml_auth_headers(wml_url, username, password)

## Define scoring endpoint
scoring_url <- "https://ibm-watson-ml.mybluemix.net/v3/wml_instances/8a2b9093-833c-469c-b648-192bedbbbd4a/published_models/a80515c8-1f8a-412f-8a1f-98126f64c15f/deployments/041a650f-a1c3-4f89-a6bc-43ddd57fe138/online "

##################################
##   Configure Object Storage   ##
##################################

## Reading Object Storage
creds <-list(auth_url = "https://identity.open.softlayer.com",project = "object_storage_92c67982_0c6e_49a7_8bfd_c51c91ebdd53",project_id = "7babac2c6d62406abd107c4512e6ede0",region = "dallas",user_id = "e3a895ede0924c0abda1cdb7304b994c",domain_id = "2c66d8b212cb45ac95ec36fda57b9d26",domain_name = "1026855",username = "member_495df5f127778f229b9ccb86b13b4aa8b817ac81",password = "Vwx8y0n[,5LbsNEv",container = "AnalyticsUniversityBankMarketingModeling",tenantId = "undefined",filename = "Test_Scored.csv")

#this data comes from our object storage container - used for distribution plots
testScores <- objectStore.get(creds)
