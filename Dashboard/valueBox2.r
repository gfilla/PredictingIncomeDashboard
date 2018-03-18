renderValueBox({
  results <- toPredict()[[1]]
  
  valueBox(value =  strtrim(results$`$NC-PREDICTION`, 4))
  
})