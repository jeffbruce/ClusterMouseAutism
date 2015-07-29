# run app locally in default browser

# PACKAGE DEPENDENCIES
install.packages('shiny')
install.packages('gplots')
install.packages('ggplot2')
install.packages('data.table')
install.packages('Hmisc')

library(shiny)

# LINUX
setwd('//micehome//jbruce//Documents//Code//R//')
# MAC
setwd('/Users/jeffbruce/Projects/Development/')
# WINDOWS
setwd('C:/Users/STORMTROOPER/Projects/')
#runApp(appDir='ClusterMouseAutism', launch.browser=TRUE, display.mode='showcase')
runApp(appDir='ClusterMouseAutism', launch.browser=TRUE, display.mode='normal')


deploy app on shinyapps.io server
library(shinyapps)

setwd('//micehome//jbruce//Documents//Code//R//')
shinyapps::deployApp('ClusterMouseAutism')


# USE A DIFFERENT THEME

install.packages('shinythemes')


# DEBUGGING TIPS

# Can use this somehow to automatically spit out shiny app errors to the browser
# when it crashes
options(shiny.error=browser)

# Immediately enter the browser when an error occurs
options(error = browser)

# Call the recover function when an error occurs
# allows you to browser at any point in the call stack
options(error = recover)
