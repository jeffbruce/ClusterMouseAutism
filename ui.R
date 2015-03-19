# ui.R
# this file is run once, and it generates HTML which is cached
# and sent to each browser that connects

shinyUI(navbarPage('Menu',
                
    # PAGE 1 ------------------------------------------------------------------
                   
    tabPanel('Filter and Recluster',
  
      titlePanel('Clustering Autism in the Mouse'),
      
      p('This web app presents results from the research paper by Ellegood et al. (2014), entitled: ', em('Clustering autism: 
         using neuroanatomical differences in 26 mouse models to gain insight into the heterogeneity.'), '  With this tool,
         you can interactively explore mouse models of autism.  Select a subset of mouse strains and brain regions that 
         you are interested in investigating, then click Recalculate to see which mouse strains and brain regions cluster together.'),
      
      hr(),
      
      fluidRow(column(12, plotOutput(outputId = 'heatmap1', height = "800px"))),
      
      hr(),
      
      fluidRow(
        column(4, checkboxInput(inputId = 'selectAllStrains', 
                                label = 'Select/Deselect All Strains', 
                                value = TRUE)),
        column(4, checkboxInput(inputId = 'selectAllRegions', 
                                label = 'Select/Deselect All Regions', 
                                value = TRUE))
      ),
      
      hr(),
      
      fluidRow(
        column(4, uiOutput('selectStrains')),
        column(4, uiOutput('selectRegions')),
        column(4, actionButton('recalculate', 'Recalculate'))
      )
    ),
    
    # PAGE 2 ------------------------------------------------------------------
    
    tabPanel('Plot Means and Effect Sizes',
      
      fluidRow(
        column(12, plotOutput(outputId = 'heatmap2', 
                              height = '800px'))
      ),
      
      hr(),
      
      fluidRow(
        column(4, radioButtons(inputId = 'statisticType',
                               label = h4('Statistic to Plot:'),
                               choices = list('Effect Sizes' = 1, 
                                              'Means' = 2),
                               selected = 1))
      ),
      
      hr(),
      
      conditionalPanel(
        condition = "input.statisticType == '1'",
        fluidRow(
          column(4, radioButtons(inputId = 'plotBy',
                                 label = h4('Plot By:'),
                                 choices = list('Strain' = 1, 
                                                'Region' = 2),
                                 selected = 1)),
          column(4, uiOutput('selectBoxStrainRegion'))
        ),
        hr(),
        fluidRow(
          column(12, plotOutput(outputId = 'effectSizePlot',
                                height = '800px'))
        )
      ),
      
      conditionalPanel(
        condition = "input.statisticType == '2'",
        fluidRow(
          column(3, uiOutput('selectInputStrains')),
          column(3, uiOutput('selectInputRegions')),
          column(3, radioButtons(inputId = 'plotType',
                                 label = h4('Plot Type:'),
                                 choices = list('Bar' = 1, 
                                                'Box' = 2, 
                                                'Violin' = 3),
                                 selected = 1)),
          column(3, radioButtons(inputId = 'flipAxes',
                                 label = h4('Flip Axes?'),
                                 choices = list('Yes' = 1, 
                                                'No' = 2),
                                 selected = 2))
        ),
        hr(),
        fluidRow(
          column(12, plotOutput(outputId = 'meansPlot',
                                height = '800px'))
        )
      )
    )
))


