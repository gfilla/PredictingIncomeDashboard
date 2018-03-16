output$hist <- renderPlotly({
  v <- input$selectedVar
  
  p <- plot_ly(x = testScores[v][testScores$actual_class == 1,]
               , type = "histogram", name = "Positive") %>% 
    add_trace(x = testScores[v][testScores$actual_class == 0,]
              , type = "histogram",   name = "Negative") 
  
  p
})

plotlyOutput('hist')