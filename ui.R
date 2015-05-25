# ui.R
# this file is run once, and it generates HTML which is cached
# and sent to each browser that connects

shinyUI(
  navbarPage('Menu',
                
    # PAGE 1 ------------------------------------------------------------------
    
    tabPanel('Overview',
      
      titlePanel('Clustering Autism in the Mouse'),
      
      hr(),
             
      p('This web app presents results from the research paper by Ellegood et al. (2014) published in Molecular Psychiatry, entitled: ', em('Clustering autism: 
        using neuroanatomical differences in 26 mouse models to gain insight into the heterogeneity.'), '  In the ', em('Overview '),
        'tab, the paper\'s key findings are summarized.  The other tabs give you a chance to play with and visualize 
        the data.'),
      
      p('By making the data open and public, our aim is to allow researchers and interested parties to help generate and test their own 
        hypotheses with our data to help tease apart the complex heterogeneity and etiology at play in autism spectrum disorder.'),
      
      p('Below, you will find the aforementioned paper\'s figures along with a brief description summarizing the message of each figure.
        There is also a brief methods section describing very generally the properties of the mice, how scans were performed, and additional
        details.'),
      
      hr(),
      
      img(src='/images/figure1.png', align = "center"),
      img(src='/images/figure2.png', align = "center"),
      img(src='/images/figure3.png', align = "center"),
      img(src='/images/figure4.png', align = "center"),
      img(src='/images/figure5.png', align = "center"),
      
      hr(),
      
      p('Research efforts are currently ongoing using additional mouse models of autism, adding to the long list of strains which were scanned 
        and analyzed in the original work.  This research could not have been done without the help from a long list of people, 
        who include:'),
      
      tags$ul(
        tags$li('E Anagnostou'), 
        tags$li('BA Babineau'), 
        tags$li('JN Crawley'),
        tags$li('L Lin'),
        tags$li('M Genestine'),
        tags$li('E DiCicco-Bloom'),
        tags$li('JKY Lai'),
        tags$li('JA Foster'),
        tags$li('O Peñagarikano'),
        tags$li('DH Geschwind'),
        tags$li('LK Pacey'),
        tags$li('DR Hampson'),
        tags$li('CL Laliberté'),
        tags$li('AA Mills'),
        tags$li('E Tam'),
        tags$li('LR Osborne'),
        tags$li('M Kouser'),
        tags$li('F Espinosa-Becerra'),
        tags$li('Z Xuan'),
        tags$li('CM Powell'),
        tags$li('A Raznahan'),
        tags$li('DM Robins'),
        tags$li('N Nakai'),
        tags$li('J Nakatani'),
        tags$li('T Takumi'),
        tags$li('MC van Eede'),
        tags$li('TM Kerr'),
        tags$li('C Muller'),
        tags$li('RD Blakely'),
        tags$li('J Veenstra-VanderWeele'),
        tags$li('RM Henkelman'),
        tags$li('JP Lerch')  
      ),
      
      p('In addition to the long list of people who contributed to this work, several institutions were involved in the study\'s funding:'),
      
      tags$ul(
        tags$li('Canadian Institute for Health Research (CIHR)'), 
        tags$li('Ontario Brain Institute (OBI)'), 
        tags$li('Ontario Mental Health Foundation (OHMF')
      )
      
    ),
    
    tabPanel('Filter and Recluster',
  
      titlePanel('Filter and Recluster'),
      
      p('Select a subset of mouse strains and brain regions that you are interested in investigating further, and then click Recalculate 
        to see which mouse strains and brain regions cluster together.'),
      
      p('Note that the heatmap displayed here will be slightly different than Figure 3 depicted in the original paper, because Figure 3 uses
        the median bootstrapped effect sizes whereas this figure uses the original data without any statistical bootstrapping.  Unfortunately,
        the bootstrapping procedure is too computationally intensive to present in the context of this web app.'),

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
      
      titlePanel('Plot Means and Effect Sizes'),
             
      p('Using the data you filtered and reclustered in the ', em('Filter and Recluster'), ' tab, here you can zone in on 
        particular mouse strains and brain regions of interest to plot means and effect sizes, using your preferred plot type.'),
      
      hr(),
             
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
          column(4, uiOutput('selectInputStrains')),
          column(4, uiOutput('selectInputRegions')),
          column(4, radioButtons(inputId = 'plotType',
                                 label = h4('Plot Type:'),
                                 choices = list('Bar' = 1, 
                                                'Box' = 2, 
                                                'Violin' = 3,
                                                'Dot' = 4),
                                 selected = 1))
        ),
        hr(),
        fluidRow(
          column(12, plotOutput(outputId = 'meansPlot',
                                height = '800px'))
        )
      )
    )
  )
)


