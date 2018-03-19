
#coefficient 1 - Age
sliderInput("AGE", "Enter age:",
            min = 17, max = 90, value = 30, step = 1
)

#coefficient 2 - Hours worked per week
sliderInput("HOURS_PER_WEEK", "How many hours worked per week:",
            min = 1, max = 99, value = 40, step = 1
)

#coefficient 3 - Education Category
education_list <- list(" Preschool"," 1st-4th"," 5th-6th", " 7th-8th"," 9th", " 10th"," 11th", " 12th" ," HS-grad"," Some-college", " Assoc-voc"," Assoc-acdm"," Bachelors"," Masters"," Prof-school" , " Doctorate"  )
selectInput("EDUCATION", "Enter education level:",
            education_list, selected = " Some-college"
)


#coefficient 4 - Marital Status
marital_list <- list(" Never-married"," Married-civ-spouse"," Divorced", " Married-spouse-absent"," Separated"," Married-AF-spouse", " Widowed" )
selectInput("MARITAL", "Enter marital status:",
            marital_list, selected = " Separated"
)

#coefficient 5 - Job Category 
occupation_list = list(" Adm-clerical"," Exec-managerial"," Handlers-cleaners"," Prof-specialty", " Other-service", " Sales", " Craft-repair"," Transport-moving"," Farming-fishing",  " Machine-op-inspct",
                       " Tech-support", " ?", " Protective-serv"," Armed-Forces"," Priv-house-serv" )
selectInput("JOB", "Select occupation:",
            occupation_list, selected =" Sales"
)


actionButton("getPrediction", "Submit Record to Watson Machine Learning", color="orange")

toPredict <- eventReactive(input$getPrediction, {
  
  watson_ml_creds_auth_headers <- get_wml_auth_headers(watson_ml_creds_url, watson_ml_creds_username,watson_ml_creds_password)
  case = head(data,n=1)# dummy data for all fields - then replace fields with user input data
  case$AGE =  input$AGE
  case$OCCUPATION = input$JOB
  case$MARITAL_STATUS = input$MARITAL
  case$EDUCATION = input$EDUCATION
  case$`EDUCATION-NUM`= match(input$EDUCATION,education_list)
  case$HOURS_PER_WEEK= input$HOURS_PER_WEEK
  
  scoringSample <- to_wml_payload(case)
  
  ## Send payload to WML
  results <- wml_score(scoring_url, watson_ml_creds_auth_headers, payload = scoringSample)
  cat(toString(scoringSample))
  ## Convert API response to DataFrame
  df <- do.call(rbind, list(results$values))
  colnames(df) <- results$fields
  resultsDF = as.data.frame(df)
  
  resultsList <- list(resultsDF, results) #returning inputs as well to populate table
  cat(toString(resultsList))
  resultsList
  
})
