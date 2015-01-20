# define data here so it can be used in ui.R

# Real data:
source('helpers.R')
source('loaddata.R')
mousedata = alleffects(datadefs)
mousedata[mousedata < -3] = -3
mousedata[mousedata > 3] = 3

#Simulation data:
#mousedata = readRDS('data/simulated_mouse_data.rds')