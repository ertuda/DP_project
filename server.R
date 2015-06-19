data(mtcars)
mtcars$wt <- mtcars$wt*1000
fit <- lm(mpg~wt,data=mtcars)

library(shiny)
shinyServer(
    function(input,output){
        output$olb <-renderPrint({input$lb})
        output$scatplot <- renderPlot({
            plot(mtcars$wt,mtcars$mpg,xlab = 'Weight of the car (lb)',
                 ylab='Miles per Gallon',xlim=c(0,6000))
            abline(fit)
        })
        output$pred <- renderPrint({predict(fit,data.frame('wt'=input$lb))})
    }
)