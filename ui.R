library(shiny)
shinyUI(pageWithSidebar(
    headerPanel('Broad Prediction of MPG by Weight'),
    sidebarPanel(
        numericInput('lb','Please input the weight of the car (lb)',1000,min=0,max=5000,step=100),
        submitButton('Submit')
    ),
    mainPanel(
        h3('Objective'),
        p('1000 lb is an important concept for auto design. 
          It is given as an expected weight of a car in future 
          car design competitions. This application aims to 
          use a dataset in R base, to come up with a simple 
          linear regression analysis of the relationship of 
          miles per gallon (mpg) to weight of a car. This way, 
          we can have a broad idea of mpg of the future cars.
          The user can input the lb and get the predicted the 
          mpg of car with that weight.'),
        h3('Data'),
        p('In this project we are using the mtcars dataset which 
          is present in the R base. This dataset give fuel consumption
          (as mpg) of 32 cars along with their weights, cylinders, gears,
          etc.'),
        h3('Model'),
        p('We load the dataset and perform a linear regressio analysis
          of mpg versus weight (wt).'),
        code('data(mtcars)'),
        p('Next, we fit a simple linear regression model of mpg vs wt'),
        code('fit <- lm(mpg~wt,data=mtcars'),
        p('We can plot to see the relationship of mpg on weight'),
        code('plot(mpg,wt)'),
        p('Now we can predict with the weight that you entered, which is;'),
        verbatimTextOutput('olb'),
        p('We make a very general assumption that the mpg of car depends on 
          the weight of it and build a linear regression model. Here is how
          the relationship betwen the mpg and weight looks like in this
          dataset;'),
        plotOutput('scatplot'),
        p('Based on the given weight, the predicted mpg is;'),
        verbatimTextOutput('pred'),
        p('As a result, we come up with a predicted mpg value for the given
          weight of the car, enabling us to have an idea of a possible
          fuel consumption of a car of our interest with the given weight')
    )
))

