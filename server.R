library(shiny)
library(ggplot2)

load("for_data_products.RData", envir=environment())
dt1 = aggregate(dt$userLabel, by = list(dt$date), FUN = length)
names(dt1) = c("date", "visits")
dt1$date = as.numeric(dt1$date) + 3
fit = lm(dt1$visits ~ sin(2*pi/7*dt1$date) + cos(2*pi/7*dt1$date))
a = fit$coefficients[1]
b = fit$coefficients[2]
c = fit$coefficients[3]

shinyServer(function(input, output) {
  output$log <- renderPlot({
    d = dt[as.Date(dt$date)>=input$start_date,]
    
    plot1 = ggplot(d,
                   aes(date, fill=userLabel)) +
      geom_bar(width=0.1) +
      theme(plot.title = element_text(size = rel(2), vjust=1),
            axis.title.y = element_text(vjust=1),
            legend.position="top",
            axis.text.x=element_text(angle=90)) +
      labs(title="Logging history") +
      xlab("Date") +
      ylab("Number of logged users") +
      guides(fill = guide_legend(title.position="top",
                                 title="Users",
                                 ncol = 50,
                                 byrow = TRUE,
                                 label.position = "bottom"))
    
  return(plot1)
  })
  output$predict <- renderText({
    date = as.numeric(input$predict_date)
    paste("The predicted number of visits for the specified date is: ",
          round(a+b*sin(date)+c*cos(date)), ".", sep = "")
  })
}
)
