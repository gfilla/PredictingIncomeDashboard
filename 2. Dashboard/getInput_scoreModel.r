#coefficient 1 - Age
sliderInput("AGE", "Enter age of customer:",
            min = 17, max = 98, value = 30, step = 1
)

#coefficient 2 - Job Category
job_list <- list('Administrative','Blue Collar', 'Entrepreneur', 'Housemaid', 'Management', 'Retired', 'Self-employed', 'Services','Student','Technician','Unemployed','Unknown')
selectInput("JOB", "Enter customer's job category:",
            job_list, selected = 'University Degree'
)

#coefficient 3 - Marital Status
marital_list <- list('Divorced','Married','Single','Unknown')
selectInput("MARITAL", "Enter customer's marital status:",
            marital_list, selected = 'single'
)

#coefficient 4 - Education Level 
education_list = list('Basic - 4 Years','Basic - 6 Years', 'Basic - 9 Years', 'High School', 'Illiterate', 'Professional Courses', 'University Degree','Unknown')
selectInput("EDU", "Select customer education level:",
            education_list, selected = 'University Degree'
)

#coefficient 5 - Housing Loan? 
radioButtons("HOUSING", "Does customer have housing loan?",
             list("No",  "Unknown", "Yes"),inline=T )

#coefficient 6 - Personal loan
radioButtons("LOAN", "Does customer have personal loan?",
             list("No",  "Unknown", "Yes"),inline=T )


#coefficient 7 - Contacts this campaign
sliderInput("CAMP", "Number of contacts this campaign:",
            min = 1, max = 56, value = 10, step = 1
)


actionButton("getPrediction", "Submit Record to Watson Machine Learning", color="green")
#cat(toString(score[1]))


toPredict <- eventReactive(input$getPrediction, {
  
  ## Create dataframe to send to WML
  toPredictDF <- data.frame(AGE =  input$AGE,
                            JOB = match(input$JOB,job_list),
                            MARITAL = match(input$MARITAL, marital_list),
                            EDU = match(input$EDU,education_list),
                            HOUSING = match(input$HOUSING,  list("No",  "Unknown", "Yes")),
                            LOAN = match(input$LOAN,  list("No",  "Unknown", "Yes"))  ,
                            CAMP = input$CAMP
  )
  
  ## Convert Dataframe to WML payload
  scoringSample <- to_wml_payload(toPredictDF)
  
  ## Send payload to WML
  results <- wml_score(scoring_url, auth_headers, payload = scoringSample)
  
  ## Convert API response to DataFrame
  resultsDF <- from_wml_payload(results)
  
  cbind(toPredictDF, resultsDF[1])
  
  ## Split probability column into 2
  resultsDF$probability_no <- stringr::str_split_fixed(resultsDF$probability, ",", 2)[, 1]
  resultsDF$probability_yes <- stringr::str_split_fixed(resultsDF$probability, ",", 2)[, 2]
  
  ## Clean up split
  resultsDF$probability_no <- gsub("c\\(", "", resultsDF$probability_no)
  resultsDF$probability_yes <- gsub("\\)", "", resultsDF$probability_yes)
  
  resultsList <- list(resultsDF, results, toPredictDF) #returning inputs as well to populate table
  resultsList
  
})
