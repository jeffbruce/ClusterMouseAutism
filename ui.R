# ui.R
# this file is run once -- it generates HTML which 
# is cached and sent to each browser that connects

shinyUI(
  navbarPage('Menu',
                
    # PAGE 1 ------------------------------------------------------------------
    
    tabPanel('Overview',
      
      titlePanel('Clustering Autism in the Mouse'),
      
      hr(),
             
      p('This web app presents results from the research paper by Ellegood et al. (2014) published in Molecular Psychiatry, entitled: ', em('Clustering autism: using neuroanatomical differences in 26 mouse models to gain insight into the heterogeneity.'), '  In the ', em('Overview '), 'tab, the paper\'s key findings are summarized.  The other tabs give the user an opportunity to play with and visualize the data.'),
      
      p('By making the data open and public, our aim is to give researchers and interested parties the tools to help generate and test their own hypotheses using these data to help tease apart the complex heterogeneity and etiology at play in autism spectrum disorder.'),
      
      p('Below, you will find the aforementioned paper\'s figures along with a description summarizing the main message of each figure.  There is also a brief methods section giving more general information about the mice, the scanning sequence used, image registration details, and information about the statistical analyses that were performed.'),
      
      hr(),
      
      h3('Methods'),
      
      p('26 mouse models of autism were used for the study, and there were often 2 or 3 models per genotype depending on the heterozygosity of the mice.  To qualify as a mouse model of autism the model must have been genetically modified to resemble a genetic lesion found in human autism, or exhibit the core behavioural phenotypes of autism found in the mouse.  In total, 432 mice were scanned ex-vivo in a 7-Tesla MRI scanner using a T2-weighted fast spin echo sequence, each scan lasting approximately 12 hours long.  The mice were either scanned 3 at a time (before 2010) or 16 at a time.  The majority of the mice were sacrificed at p60 and thus were adults and fully developed.'),
      
      p('The MR images were linearly and non-linearly registered together for each individual model.  The registration uses deformation-based morphometry to calculate the absolute volumes of 62 segmented structures (cortical lobes, large white-matter structures, ventricles, cerebellum, brain stem, and olfactory bulbs).  The volumes were also calculated as percentages of total brain volume (relative volumes), and in addition, the brains could be compared using voxelwise data to look at more local regional differences in the brain.'),
      
      p('For each of the 26 models and 62 brain regions studied, effect sizes (Cohen\'s d) were calculated for the models by comparing controls (wildtype mice) to their heterozygous or homozygous genetic mutant counterparts.  Positive effect sizes are interpreted as the mutant mice having larger volume in the region of interest than their wildtype counterparts, and vice versa for negative effect sizes.  Effect sizes were compared across mouse models and brain regions using hierarchical clustering, grouping similar mouse models together and brain regions together, using correlation as the distance function.  Statistical bootstrapping was performed to determine the consistency of the clustering, or how often groups of mouse models or brain regions clustered together.'),
      
      p('The reader is encouraged to consult the original research paper and its Supplementary Methods and Tables for more information about the mice used in the study, the perfusion protocol, scanning parameters, image registration details, and the exact statistical analyses which were performed.'),
      
      hr(),
      
      h3('Results'),
      
      img(src='/images/figure1.png', align='center'),
      
      p('Head circumference or brain size is a somewhat controversial measure used in human autism, so the total brain size of the 26 mouse models were investigated in this study.  In the figure above, the left panel illustrates that there is no uniform trend between autism and total brain size.  Moreover, the variability in relative brain volume differences for select brain regions shows that total brain volume isn\'t the only factor driving the heterogeneity between models.'),
      
      img(src='/images/figure2.png', align='center'),
      
      p('The purpose of the above figure is to highlight which specific brain regions differ the most between wildtype mice and their autistic counterparts.  Median absolute effect sizes were taken across all mouse models for each brain region, and the top panel shows that the most affected regions were parieto-temporal lobe, cerebellar cortex, frontal lobe, hypothalamus, and striatum.  The largest absolute voxelwise differences included decreases in CA1, decreases in the dentate of the hippocampus, and increases in the dorsal raphe nuclei.'),
      
      img(src='/images/figure3.png', align='center'),
      
      p('The above figure presents a hierarchical clustering analysis of the mouse models and brain regions investigated in the study.  Median bootstrapped effect sizes of relative volume were calculated for every combination of mouse model and brain region.  Red represents an increase in volume relative to control and blue represents a decrease.  The closer together that models are found on the heatmap, the more similar autistic neuroanatomical phenotype they have, and likewise the closer together that regions are found on the heatmap, the more likely they are similarly affected by the genetic mutations investigated in the study.  More specifically, the length of the dendrograms on the axes beside the heatmap represent the correlation between regions (X axis) and models (Y axis).  A highly positive correlation corresponds to a short dendrogram branch, and a highly negative correlation corresponds to a very long dendrogram branch.'),
      
      img(src='/images/figure4.png', align='center'),
      
      p('From the dendrogram in Figure 3 from the paper, there appear to be 3 major clusters of implicated brain regions in the mouse models of autism selected for the study.  In the top panel above, you can see the 3 large clusters of regions that were identified in the paper using the bootstrapped samples.  Connected regions were taken to be those which were connected greater than 50% of the time in the bootstrap simulations, and included only regions which were greater than 0.7mm', tags$sup('3'),', or had relevance to another structure (such as anterior commissure—pars posterior).  The first cluster (pink) includes regions heavily involved in social perception and autonomic regulation and are some of the most sexually dimorphic regions in the brain, the second cluster (yellow) are mostly white-matter regions, and the third cluster (green) consisted of 6 cerebellar regions.'),
      
      img(src='/images/figure5.png', align='center'),
      
      p('The 26 mouse models were clustered and 3 large groups emerged, differing in direction of volume changes and localization of neuroanatomical phenotypes.  In the left panel above, it is plainly seen that some models were much more strongly connected than others, some of the strongest connections being between Nrxn1α, En2 and Fmr1 in group 1, Nlgn3 KI, BTBR and Slc6A4KI (129) in group 2, and Mecp2, XO and BALB/C, as well as Gtf2i (+/-) and 16p11 in group 3.  In the right panel, regions which were most affected for each group are highlighted.  In particular, group 1 had mainly increases in large white-matter regions, including corpus callosum, fimbria, fornix, increases in frontal and parieto-temporal lobes, and decreases in cerebellar cortex.  Group 2 had the opposite effect, with mostly decreases in white-matter structures such as cerebral peduncle, corpus callosum and internal capsule, as well as globus pallidus, hippocampus and striatum.  Group 3 had a mix of increases and decreases, where the frontal and parieto-temporal lobes were decreased in size and the cerebellum increased in size.  Voxelwise differences mostly followed the same trends as the regional differences.  Perhaps not surprisingly, all 3 groups had differences in the cerebellum, though the precise location and direction of these volume changes was inconsistent.'),
      
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
      
    ),
    
    tabPanel('Filter and Recluster',
  
      titlePanel('Filter and Recluster'),
      
      p('Select a subset of mouse strains and brain regions that you are interested in investigating further, and then click Recalculate to see which mouse strains and brain regions cluster together.'),
      
      p('Note that the heatmap displayed here will be slightly different than Figure 3 depicted in the original paper, because Figure 3 uses the median bootstrapped effect sizes whereas this figure uses the original data without any statistical bootstrapping.  Unfortunately, the bootstrapping procedure is too computationally intensive to present in the context of this web app.'),

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
             
      p('Using the data you filtered and reclustered in the ', em('Filter and Recluster'), ' tab, here you can zone in on particular mouse strains and brain regions of interest to plot means and effect sizes, using your preferred plot type.'),
      
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