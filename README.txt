The application at https://ircus.shinyapps.io/loggingStats/ shows another application's logging statistics.

In the first block "Logging history" you may select a date that will be the starting date of the logging statistics displayed on the plot. The end date will always be April 10, 2016, as the data is only available till this date.

On the plot you will see the dates on the x axis and the number of visits on the y axis, each visit corresponds to a login action of a unique user that happened during the corresponding date. Different colors denote different users, and the numbers in the legend are just global user labels.

In the second block "Predict visits" you may select a date to see the expected number of visits after April 10, 2016 below the date input field.
The data is modeled as a periodic function with a 7-day period, as it becomes clear from the plot that visits on the weekends are always lower than the ones on the weekdays.