# run app locally in default browser

# PACKAGE DEPENDENCIES
# install.packages('shiny')
# install.packages('gplots')
# install.packages('ggplot2')
# install.packages('data.table')
# install.packages('Hmisc')

library(shiny)

# LINUX
setwd('//micehome//jbruce//Documents//Code//R//')
# MAC
setwd('/Users/jeffbruce/Projects/Development/')
#runApp(appDir='ClusterMouseAutism', launch.browser=TRUE, display.mode='showcase')
runApp(appDir='ClusterMouseAutism', launch.browser=TRUE, display.mode='normal')


# deploy app on shinyapps.io server
library(shinyapps)

# this command below needs to be run for each workstation you're running it on -- not sure if you need
# a different token or secret though.
# shinyapps::setAccountInfo(name='jeffmouseimaging', token='261FE9A47737054D41282DDD34C926E8', secret='Yh56qQxV2HE8PM2BM4DRRu2hZvimRCUJfAA5HX+f')

setwd('//micehome//jbruce//Documents//Code//R//')
shinyapps::deployApp('ClusterMouseAutism')

# Application successfully deployed to http://jeffmouseimaging.shinyapps.io/ClusterMouseAutism
# Application fails the same way that it does on the mousecluster vm shinyserver
# - it actually immediately fails instead of failing after 15ish seconds though


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
