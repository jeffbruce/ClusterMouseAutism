# ui.R
# this file is run once, and it generates HTML which is cached
# and sent to each browser that connects

#use navbarPage instead for a multi-page app

shinyUI(fluidPage(
  
  titlePanel('Clustering Autism in the Mouse'),
  
  p('This web app presents results from the research paper by Ellegood et al. (2014), entitled: ', em("Clustering autism: 
     using neuroanatomical differences in 26 mouse models to gain insight into the heterogeneity."), '  With this tool,
     you can interactively explore mouse models of autism.  Select a subset of mouse strains and brain regions that 
     you are interested in investigating, then click Recalculate to see which mouse strains and brain regions cluster together.'),
  
  hr(),
  
  fluidRow(column(12, plotOutput(outputId = 'heatmap', height = "650px"))),
  
  hr(),
  
  fluidRow(
    
    column(4, checkboxInput(inputId = 'selectAllStrains', label = 'Select/Deselect all strains', value = FALSE)),
    
    column(4, checkboxInput(inputId = 'selectAllRegions', label = 'Select/Deselect all regions', value = FALSE))
    
  ),
  
  hr(),
  
  fluidRow(
    
    column(4, checkboxGroupInput(inputId = 'strains', 
                                 label = h3('Mouse Strains'), 
                                 choices = rownames(mousedata),
                                 selected = rownames(mousedata))),
    
    column(4, checkboxGroupInput(inputId = 'regions', 
                                 label = h3('Brain Regions'), 
                                 choices = colnames(mousedata),
                                 selected = colnames(mousedata))),
    
    column(4, actionButton('recalculate', 'Recalculate'))
  )
))