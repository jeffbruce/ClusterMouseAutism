# define data here so it can be used in ui.R

require(gplots)
require(ggplot2)
require(data.table)
# should load plyr before dplyr apparently
require(plyr)
#require(dplyr)
require(reshape2)
require(shiny)
require(stats)

# Real data:
source('helpers.R')
source('loaddata.R')
mousedata = alleffects(datadefs)
mousedata[mousedata < -3] = -3
mousedata[mousedata > 3] = 3
individualData = IndividualData(datadefs)
summaryData = SummaryData(individualData)