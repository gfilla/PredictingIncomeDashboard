output$hist <- renderPlotly({
  v <- input$selectedVar
  
  p <- plot_ly(x = data[v][data$PREDICTION == " >50K" ,]
               , type = "histogram", name = "Over 50K") %>%
    add_trace(x = data[v][data$PREDICTION == " <=50K",]
              , type = "histogram",   name = "Under 50K")
  
  p
})

plotlyOutput('hist')