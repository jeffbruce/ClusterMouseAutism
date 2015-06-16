# ui.R

# This file is run once.  It generates HTML whichis cached and sent to each browser that connects.

shinyUI(
  navbarPage('Clustering Autism in the Mouse',
    
             
# TAB PANEL ---------------------------------------------------------------
             
    tabPanel('Overview',
      
      a(name='Overview'),
      titlePanel('Overview'),
      
      hr(),
      
      p('This web app presents results from the research paper by ',em('Ellegood et al.'), ' (2014) published in ', a(href='http://www.nature.com/mp/index.html', 'Molecular Psychiatry'), ' entitled: ', a(href='http://www.ncbi.nlm.nih.gov/pubmed/25199916', 'Clustering autism: using neuroanatomical differences in 26 mouse models to gain insight into the heterogeneity'), a(href='#Ellegood2015', '[1].')),
      
      p('By making the data open and public, our aim is to give researchers and interested parties the tools to help generate and test their own hypotheses using these data to help tease apart the complex heterogeneity and etiology at play in autism spectrum disorder.'),
      
      p('Shown below is a heatmap displaying results from the hierarchical clustering analysis performed in the original research paper, which clustered 26 mouse models of autism along with 62 different brain regions using the median bootstrapped effect size differences in relative volume for each combination of mouse model and brain region.  In the other tabs, you can perform your own clustering analyses and plot mean and effect size differences for the 62 different regions, allowing you to visualize the data in finer detail right down to the individual data points.  For more information about the methods and the main takeaways from the research paper, check out the ', tags$mark('Research Paper'), 'tab.'),
      
      hr(),

#       imageOutput('Figure3')
      img(src='/images/Figure3_MolPsych33.png', align='center'), 

      h3('References'),

      a(href='#Overview', 'Back to top'),
      p(),

      a(name='Ellegood2015'),
      HTML('<p><strong>[1]: </strong>Ellegood, J., Anagnostou, E., Babineau, B. A., Crawley, J. N., Lin, L., Genestine, M., ... &amp; Lerch, J. P. (2015). Clustering autism: using neuroanatomical differences in 26 mouse models to gain insight into the heterogeneity. <em>Molecular psychiatry</em>, <em>20</em>(1), 118-125. </p>')
      
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
        column(4, radioButtons(inputId = 'distanceFunction',
                               label = h4('Clustering Distance Function:'),
                               choices = list('1 - correlation', 
                                              'euclidean',
                                              'manhattan'),
                               selected = '1 - correlation')),
        column(4, radioButtons(inputId = 'clusteringMethod',
                               label = h4('Clustering Method:'),
                               choices = list('complete',
                                              'average',
                                              'ward.D2')))
      ),
      
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
             
             a(name='Research Paper'),
             titlePanel('Research Paper'),
             
             hr(),
             
             h3('Methods'),

             p('Mice were acquired from collaborators (cited in the original paper) in addition to', a(href='http://www.jax.org/', 'The Jackson Laboratory.'), ' To qualify as an animal model of autism for the study, the mouse model had to either be genetically modified to resemble or be related to a genetic lesion found in human autism (such as Neuroligin3 R451C) and listed on the SFARI gene database', a(href='#Banerjee-Basu2010', '[1],'), 'or be behaviourally tested to have all core behavioural phenotypes that describe autism in the mouse (such as the BTBR mouse)', a(href='#Brodkin2007', '[2]'), a(href='#McFarlane2008', '[3].')),

             p('A 7-Tesla MRI scanner was used to acquire the magnetic resonance images.  A custom solenoid array allowed for the acquisition of MRI images for up to 16 samples in a single 12 hour overnight session (MRI images acquired before 2010 were scanned 3 at a time before the hardware was upgraded).  The sequence used for the imaging was a T2-weighted fast spin echo sequence optimized for contrast between the grey and white matter.'),
                          
             p('The MR images were linearly and non-linearly registered together for each individual model.  The registration used deformation-based morphometry to calculate the absolute volumes of 62 segmented structures (cortical lobes, large white-matter structures, ventricles, cerebellum, brain stem, and olfactory bulbs)', a(href='#Dorr2008', '[4].'),  'The volumes were calculated as percentages of total brain volume (relative volumes), and in addition, the brains were compared voxelwise to look at localized regional differences in the brain.'),
             
             p('For each of the 26 models and 62 brain regions studied, effect sizes (Cohen\'s d) were calculated for the models by comparing controls (wildtype mice) to their heterozygous or homozygous genetic mutant counterparts.  Positive effect sizes indicate that the mutant mice have a larger volume in the region of interest compared to their wildtype counterparts, and vice versa for negative effect sizes.  Effect sizes were compared across mouse models and brain regions using hierarchical clustering, grouping similar mouse models together and brain regions together, using correlation as the distance function.  Statistical bootstrapping was performed to determine the consistency of the clustering, or how often groups of mouse models or brain regions clustered together.'),
             
             p('The reader is encouraged to consult the original research paper and its Supplementary Methods and Tables for more information about the mice used in the study, the perfusion protocol, scanning parameters, image registration details, and the exact statistical analyses which were performed.'),
             
             hr(),
             
             h3('Results'),
             
             br(),
             
#              imageOutput('Figure1'),
             img(src='/images/figure1original.png', align='center'),
             
             br(),
             br(),
             br(),

             p(strong('Figure 1:'), ' Heterogeneity of Volume Measurements Across Models – Head circumference or brain size is a somewhat controversial measure used in human autism', a(href='#Amaral2011', '[5]'), a(href='#Courchesne2011', '[6]'), a(href='#Raznahan2013', '[7],'), 'so to address this the total brain size of the 26 mouse models were investigated in this study.  In the figure above, ', strong('(A)'), 'the left panel ', ' illustrates that there is no uniform trend between autism and total brain size.  Moreover, ', strong('(B)'), ' the variability in relative brain volume differences for select brain regions shows that total brain volume isn\'t the only factor driving the heterogeneity between models.'),
             
             br(),

#              imageOutput('Figure2'),
             img(src='/images/figure2original.png', align='center'),
             
             br(),
             br(),
             br(),

             p(strong('Figure 2:'), ' Median Absolute Effects Across all Models – The above coronal slices indicate regions that were affected with a median absolute effect size greater than 0.5 for regional comparison and 0.6 for voxelwise comparisons. ', strong('(A)'), ' The most affected regions across all models were the parieto-temporal lobe, cerebellar cortex, frontal lobe, hypothalamus, and the striatum. ', strong('(B)'), ' Voxelwise differences highlighted additional areas affected across all models.  Decreases were seen in CA1 and the dentate of the hippocampus as well as increases in the dorsal raphe nuclei.'),
             
             br(),

#              imageOutput('Figure3'),
             img(src='/images/figure3original.png', align='center'),
            
             br(),
             br(),
             br(),

             p(strong('Figure 3:'), ' Volume Differences and Clustering of the Regions Examined – The above heatmap displays the median effect size differences in relative volume between the 26 different mouse models and their specific controls for each of the 62 different regions across 1000 bootstrapped samples.  Red represents an increase in volume compared to control and blue represents a decrease.  The dendrograms on the x and y-axes represent the correlation between regions (x-axis) and models (y-axis).  For regions that are closely correlated, such as the stratum granulosum and dentate gyrus, the dendrogram joins close to the data, whereas regions such as the periaqueductal grey and corpus callosum are not as closely correlated so they join higher.'),
             
             br(),

#              imageOutput('Figure4'),
             img(src='/images/figure4original.png', align='center'),
             
             br(),
             br(),
             br(),

             p(strong('Figure 4:'), ' Clustering of the Brain Regions – Bootstrapping the regions from Figure 3 revealed 3 large clusters.  The clusters are connected based on the proportion of time within the same group over the 1000 bootstrapped samples. Connected regions were taken to be those which were connected greater than 50% of the time, and included only regions which were greater than 0.7mm', tags$sup('3'),', or those which had relevance to another structure (such as anterior commissure—pars posterior).  The first (pink) cluster includes regions heavily involved in social perception and autonomic regulation as well as some of the most sexually dimorphic regions in the brain, the second (yellow) cluster contains the majority of white-matter regions, which could be representative of connectivity, and the third (green) cluster represents the cerebellar regions, commonly implicated in autism', a(href='#Fatemi2012', '[8].')),
             
             br(),

#              imageOutput('Figure5'),
             img(src='/images/figure5original.png', align='center'),
             
             br(),
             br(),
             br(),

             p(strong('Figure 5:'), ' Clustering of the Autism Models – ', strong('(A)'), ' Clustering of the models, based on the bootstrapping within models shown in Figure 3, was created in a similar fashion to the regions shown in Figure 4.  The hierarchical clustering segregated the models into three specific groups. These groups are connected based on the proportion of time within the same group over 1000 bootstrapped samples.  Anything above 30% was considered connected as random connections were only found below 25%. ', strong('(B)'), ' Regional Differences within Groups - The most affected regions in each of the three groups are highlighted.  Group 1 is characterized by increases in many of the white matter structures, specifically the corpus callosum and fimbria, and the cortex, and decreases in the cerebellar cortex.  Group 2 is characterized by decreases in many white matter structures, and again the corpus callosum is implicated, as well as the striatum and hippocampus.  Group 3 is characterized by increases in the cerebellum and decreases in the thalamus and lateral septum.  For a full listing of the differences in these groups see Supplementary Table 4. ', strong('(C)'), ' Voxelwise Differences within Groups - Similar to the regions Group 1 is characterized by increases in many of the white matter structures, specifically the corpus callosum and external capsule are outlined here.  Group 2 is characterized by decreases in many white matter structures, and again the corpus callosum is drastically decreased in size.  Group 3 is characterized by bilateral decreases in the striatum as well as an increase in the dorsal raphe nuclei.'),
             
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

             a(href='#Research Paper', 'Back to top'),
             p(),

             a(name='Banerjee-Basu2010'),
             HTML('<p><strong>[1]: </strong>Banerjee-Basu S, Packer A. SFARI Gene: an evolving database for the autism research community. <em>Dis Model Mech</em>. 2010; <strong>3</strong>: 133–135.</p>'),

             a(name='Brodkin2007'),
             HTML('<p><strong>[2]: </strong>Brodkin ES. BALB/c mice: low sociability and other phenotypes that may be relevant to autism. <em>Behavioural Brain Research</em> 2007; <strong>176</strong>: 53–65.</p>'),
             
             a(name='McFarlane2008'),
             HTML('<p><strong>[3]: </strong>McFarlane HG, Kusek GK, Yang M, Phoenix JL, Bolivar VJ, Crawley JN. Autism-like behavioral phenotypes in BTBR T+tf/J mice. <em>Genes, Brain and Behavior</em> 2008; <strong>7</strong>: 152–163.</p>'),

             a(name='Dorr2008'),
             HTML('<p><strong>[4]: </strong>
                 Dorr AE, Lerch JP, Spring S, Kabani N, Henkelman RM. High resolution three-dimensional brain atlas using an average magnetic resonance image of 40 adult
                 C57Bl/6J mice. <em>Neuroimage</em> 2008; <strong>42</strong>: 60–69.
             </p>'),

             a(name='Amaral2011'),
             HTML('<p><strong>[5]: </strong>
                 Amaral DG. The promise and the pitfalls of autism research: an introductory note for new autism researchers. <em>Brain Res</em> 2011; <strong>1380</strong>
                 : 3–9.
             </p>'),

             a(name='Courchesne2011'),
             HTML('<p><strong>[6]: </strong>
             Courchesne E, Campbell K, Solso S. Brain growth across the life span in autism: age-specific changes in anatomical pathology. <em>Brain Res</em> 2011; <strong>1380</strong>: 138–145.
             </p>'),

             a(name='Raznahan2013'),
             HTML('<p><strong>[7]: </strong>
                 Raznahan A, Wallace GL, Antezana L, Greenstein D, Lenroot R, Thurm A <em>et al.</em> Compared to what? Early brain overgrowth in autism and the perils of
                 population norms. <em>Biological Psychiatry</em> 2013; <strong>74</strong>: 563–575.
             </p>'),

             a(name='Fatemi2012'),
             HTML('<p><strong>[8]: </strong>Fatemi SH, Aldinger KA, Ashwood P, Bauman ML, Blaha CD, Blatt GJ <em>et al.</em> Consensus paper: pathological role of the cerebellum in autism. <em>Cerebellum</em> 2012; <strong>11</strong>: 777–807.</p>')
    )
  )
)