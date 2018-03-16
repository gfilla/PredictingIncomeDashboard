
renderValueBox({
  probs <- toPredict()[[1]]
  prob_no <- paste0(round(as.numeric(probs$probability_no), 4)*100)
  prob_yes <- paste0(round(as.numeric(probs$probability_yes), 4)*100)
  
  valueBox(value =  prob_yes,
           color = ifelse(prob_no > prob_yes, "grey", "success"),
           icon = icon('balance-scale')
  )
  
}) 