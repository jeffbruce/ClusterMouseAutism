# ui.R

# This file is run once.  It generates HTML whichis cached and sent to each browser that connects.

shinyUI(
  navbarPage('Clustering Autism in the Mouse',
    
             
# TAB PANEL ---------------------------------------------------------------
             
    tabPanel('Overview',
      
      titlePanel('Overview'),
      
      hr(),
      
      p('This web app presents results from the research paper by ',em('Ellegood et al.'), ' (2014) published in ', a(href='http://www.nature.com/mp/index.html', 'Molecular Psychiatry'), ' entitled: ', a(href='http://www.ncbi.nlm.nih.gov/pubmed/25199916', 'Clustering autism: using neuroanatomical differences in 26 mouse models to gain insight into the heterogeneity.')),
      
      p('By making the data open and public, our aim is to give researchers and interested parties the tools to help generate and test their own hypotheses using these data to help tease apart the complex heterogeneity and etiology at play in autism spectrum disorder.'),
      
      p('Shown below is a heatmap displaying results from the hierarchical clustering analysis performed in the original research paper, which clustered 26 mouse models of autism along with 62 different brain regions using the median bootstrapped effect sizes of relative volume for each combination of mouse model and brain region.  In the other tabs, you can perform your own clustering and plot means and effect sizes, allowing you to visualize the data in finer detail right down to the individual data points.  For more information about the methods and the main takeaways from the research paper, check out the ', tags$mark('Research Paper'), 'tab.'),
      
      hr(),

#       imageOutput('Figure3')
      img(src='/images/Figure3_MolPsych33.png', align='center')
      
    ),


# TAB PANEL ---------------------------------------------------------------

    tabPanel('Filter and Recluster',
  
      titlePanel('Filter and Recluster'),
      
      hr(),
      
      p('Select a subset of mouse strains and brain regions that you are interested in investigating further, and then click the ',  tags$mark('Recalculate'), ' button to see which mouse strains and brain regions cluster together.'),
      
      p('Note that the heatmap displayed here will be slightly different than Figure 3 depicted in the original paper, because Figure 3 uses the median bootstrapped effect sizes of relative volume whereas this figure uses the original data without any statistical bootstrapping.  Unfortunately, the bootstrapping procedure is too computationally intensive to present in the context of this web app.'),

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
    

# TAB PANEL ---------------------------------------------------------------

    tabPanel('Plot Means and Effect Sizes',
      
      titlePanel('Plot Means and Effect Sizes'),
             
      hr(),
      
      p('Using the data you filtered and reclustered in the ', tags$mark('Filter and Recluster'), ' tab, here you can zone in on particular mouse strains and brain regions of interest to plot means and effect sizes, using your preferred plot type.'),
      
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
        p(strong(em('Effect sizes have been capped at -3.0 and +3.0 for increased readability.'))),
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
                                 choices = list('Box' = 2,
                                                'Bar' = 1,
                                                'Dot' = 4,
                                                'Violin' = 3),
                                 selected = 2))
        ),
        hr(),
        p(strong(em('Error bars are 95% confidence intervals centred about the mean.'))),
        fluidRow(
          column(12, plotOutput(outputId = 'meansPlot',
                                height = '800px'))
        )
      ),
      
      hr(),
      
      fluidRow(
        column(12, plotOutput(outputId = 'heatmap2', 
                              height = '800px'))
      )
    ),
    

# TAB PANEL ---------------------------------------------------------------

    tabPanel('Research Paper',
             
             titlePanel('Research Paper'),
             
             hr(),
             
             h3('Methods'),
                          
             p('The MR images were linearly and non-linearly registered together for each individual model.  The registration uses deformation-based morphometry to calculate the absolute volumes of 62 segmented structures (cortical lobes, large white-matter structures, ventricles, cerebellum, brain stem, and olfactory bulbs).  The volumes were also calculated as percentages of total brain volume (relative volumes), and in addition, the brains could be compared using voxelwise data to look at more local regional differences in the brain.'),
             
             p('For each of the 26 models and 62 brain regions studied, effect sizes (Cohen\'s d) were calculated for the models by comparing controls (wildtype mice) to their heterozygous or homozygous genetic mutant counterparts.  Positive effect sizes are interpreted as the mutant mice having larger volume in the region of interest than their wildtype counterparts, and vice versa for negative effect sizes.  Effect sizes were compared across mouse models and brain regions using hierarchical clustering, grouping similar mouse models together and brain regions together, using correlation as the distance function.  Statistical bootstrapping was performed to determine the consistency of the clustering, or how often groups of mouse models or brain regions clustered together.'),
             
             p('The reader is encouraged to consult the original research paper and its Supplementary Methods and Tables for more information about the mice used in the study, the perfusion protocol, scanning parameters, image registration details, and the exact statistical analyses which were performed.'),
             
             hr(),
             
             h3('Results'),
             
             br(),
             
#              imageOutput('Figure1'),
             img(src='/images/figure1original.png', align='center'),
             
             br(),
             br(),
             br(),

             p('Head circumference or brain size is a somewhat controversial measure used in human autism, so to address this the total brain size of the 26 mouse models were investigated in this study.  In the figure above, ', strong('(A)'), 'the left panel ', ' illustrates that there is no uniform trend between autism and total brain size.  Moreover, ', strong('(B)'), ' the variability in relative brain volume differences for select brain regions shows that total brain volume isn\'t the only factor driving the heterogeneity between models.'),
             
             br(),

#              imageOutput('Figure2'),
             img(src='/images/figure2original.png', align='center'),
             
             br(),
             br(),
             br(),

             p('The purpose of the above figure is to highlight which specific brain regions differed the most between wildtype mice and their autistic counterparts.  Median absolute effect sizes were taken across all mouse models for each brain region, and ', strong('(A)'), ' the top panel shows that the most affected regions were parieto-temporal lobe, cerebellar cortex, frontal lobe, hypothalamus, and striatum. ', strong('(B)'), 'The largest absolute voxelwise differences included decreases in CA1, decreases in the dentate of the hippocampus, and increases in the dorsal raphe nuclei.'),
             
             br(),

#              imageOutput('Figure3'),
             img(src='/images/figure3original.png', align='center'),
            
             br(),
             br(),
             br(),

             p('The above figure presents a hierarchical clustering analysis of the mouse models and brain regions investigated in the study.  Median bootstrapped effect sizes of relative volume were calculated for every combination of mouse model and brain region.  Red represents an increase in volume relative to control and blue represents a decrease.  The closer together that models are found on the heatmap, the more similar the autistic neuroanatomical phenotype they have.  Likewise, the closer together that regions are found on the heatmap, the more likely they are similarly affected by the genetic mutations investigated in the study.  More specifically, the length of the dendrograms on the axes to the left and the top of the heatmap represent the correlation between regions (X axis) and models (Y axis).  More positive correlations correspond to shorter dendrogram branches, and more negative correlations correspond to longer dendrogram branches.'),
             
             br(),

#              imageOutput('Figure4'),
             img(src='/images/figure4original.png', align='center'),
             
             br(),
             br(),
             br(),

             p('From the dendrogram in Figure 3 from the paper, 3 major clusters of implicated brain regions emerged in the mouse models of autism selected for the study.  In the top panel above, you can see the 3 large clusters of regions that were identified in the paper using the bootstrapped samples.  Connected regions were taken to be those which were connected greater than 50% of the time in the bootstrap simulations, and included only regions which were greater than 0.7mm', tags$sup('3'),', or had relevance to another structure (such as anterior commissure—pars posterior).  The first cluster (pink) includes regions heavily involved in social perception and autonomic regulation and are some of the most sexually dimorphic regions in the brain, the second cluster (yellow) are mostly white-matter regions, and the third cluster (green) consisted of 6 cerebellar regions.'),
             
             br(),

#              imageOutput('Figure5'),
             img(src='/images/figure5original.png', align='center'),
             
             br(),
             br(),
             br(),

             p('The 26 mouse models were clustered and again 3 large groups emerged, differing in direction of volume changes and localization of neuroanatomical phenotypes. ', strong('(A)'), ' In the left panel above it is plainly seen that some models were much more strongly connected than others, some of the strongest connections being between Nrxn1α, En2 and Fmr1 in group 1, Nlgn3 KI, BTBR and Slc6A4KI (129) in group 2, and Mecp2, XO and BALB/C, as well as Gtf2i (+/-) and 16p11 in group 3. ',  strong('(B)'), ' In the right panel, regions which were most affected for each group are highlighted.  In particular, group 1 had mainly increases in large white-matter regions, including corpus callosum, fimbria, fornix, increases in frontal and parieto-temporal lobes, and decreases in cerebellar cortex.  Group 2 had the opposite effect, with mostly decreases in white-matter structures such as cerebral peduncle, corpus callosum and internal capsule, as well as globus pallidus, hippocampus and striatum.  Group 3 had a mix of increases and decreases, where the frontal and parieto-temporal lobes were decreased in size and the cerebellum increased in size. ', strong('(C)'), ' Voxelwise differences mostly followed the same trends as the regional differences.  Perhaps not surprisingly, all 3 groups had differences in the cerebellum (a characteristic commonly reported in autism), though the precise location and direction of these volume changes was inconsistent.'),
             
             hr(),
             
             h3('Acknowledgements'),
             
             p('Research efforts are currently ongoing using additional mouse models of autism, adding to the long list of mouse models which were scanned and analyzed in the original work.  This research could not have been done without great work from a long list of contributors, who include:'),
             
             tags$ul(
               tags$li('J Ellegood'),
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
             
             p('In addition to the long list of people who contributed to this work, several institutions were involved in the study\'s funding, including:'),
             
             tags$ul(
               tags$li('Canadian Institute for Health Research (CIHR)'), 
               tags$li('Ontario Brain Institute (OBI)'), 
               tags$li('Ontario Mental Health Foundation (OHMF)')
             ),
             
             h3('References'),
             
             p('Insert properly formatted citation to the Ellegood paper.'),
             
             p('Add potentially other references in the Methods section or the overview.')
             
    )
  )
)