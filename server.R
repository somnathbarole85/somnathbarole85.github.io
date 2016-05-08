library(shiny)

Rel <- function(strength_mean, stress_mean, strength_sd, stress_sd) {
    
    Z <- (strength_mean - stress_mean) / sqrt((strength_sd^2 + stress_sd^2))
    round(pnorm(Z), digits = 4)
    
}


shinyServer(function(input, output){
    
    output$strengthmean <- renderPrint({input$strength_mean})
    output$strengthsd <- renderPrint({input$strength_sd})
    output$stressmean <- renderPrint({input$stress_mean})
    output$stresssd <- renderPrint({input$stress_sd})
    
    output$Reliability <- renderPrint({Rel(input$strength_mean, input$stress_mean, input$strength_sd, input$stress_sd)})
    output$Proboffail <- renderPrint({1-Rel(input$strength_mean, input$stress_mean, input$strength_sd, input$stress_sd)})
    
    output$Densplot <- renderPlot({
        
        c1 <- curve(dnorm(x, mean = input$strength_mean, sd = input$strength_sd), 
                    input$strength_mean-10*input$strength_sd, input$strength_mean+10*input$strength_sd, col="green", lwd=3,
              xlab="", ylab="", main="Stress-Strength overlap", ylim = c(0, 1))
        
        plot(c1, col="green", lwd=3, type = "l", main = "Stress-Strength overlap", 
             xlab = "", ylab = "",
             xlim = c(min(input$strength_mean-10*input$strength_sd, input$stress_mean-10*input$stress_sd), 
                      max(input$strength_mean+10*input$strength_sd, input$stress_mean+10*input$stress_sd)))
        
        c2 <- curve(dnorm(x, mean = input$stress_mean, sd = input$stress_sd), 
              input$stress_mean-10*input$stress_sd, input$stress_mean+10*input$stress_sd, col="red", lwd=3, add=TRUE)
    
        lines(c2, col="red", lwd=3, type = "l", main = "Stress-Strength overlap", xlab = "", ylab = "")
        legend(max(input$strength_mean+10*input$strength_sd-200, input$stress_mean+10*input$stress_sd-200), 
               0.008, c("Strength", "Stress"), col=c("green", "red"), lwd=c(3,3))
        
        
        })
    
})