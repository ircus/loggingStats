library(shiny)

shinyUI(fluidPage(
  h3("Logging history"),
  h4("The logging history data is avalable only till April 10, 2016."),
  dateInput("start_date", 
            label = "Start Date", 
            value = as.Date("2016-03-26")), 
  plotOutput("log"),
  br(),
  h3("Predict visits"),
  h4("Specify a date to predict the number of visits after April 10, 2016."),
  dateInput("predict_date", 
            label = "Predict Date", 
            value = as.Date("2016-04-11")), 
  textOutput("predict")
  )
)