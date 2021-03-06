# server.R

# Shared data/libraries are declared in global.R instead of here because ui.R needs access to them.

# Utility Functions --------------------------------------------------------

#     cint <- function(x, alpha) {
#       sem(x) * qt(1-alpha/2, length(na.omit(x))-1)
#     }

# right now assumes alpha = 0.05!
# cint <- function(x) {
#   sem(x) * qt(1-0.05/2, length(na.omit(x))-1)
# }
# 
# low95cint <- function(x) {
#   mean(x) - cint(x)
# }
# 
# high95cint <- function(x) {
#   mean(x) + cint(x)
# }
# 
# sem <- function(x) {
#   sqrt( var(x,na.rm=TRUE) / length(na.omit(x)) )
# }
# 
# lowsd <- function(x) {
#   return( mean(x) - sem(x) )
# }
# 
# highsd <- function(x) {
#   return(mean(x) + sem(x))
# }

setEffectSizeLimits <- function(effectSizes, lowerLimit, upperLimit) {
  # Restricts range of a vector of effect sizes.   
  effectSizes[effectSizes > upperLimit] = upperLimit
  effectSizes[effectSizes < lowerLimit] = lowerLimit
  return(effectSizes)
}

# Dictionary lookups for clustering options to reduce number of if statements in the heatmap function.
distanceFunctionDictionary = list('1 - correlation'=Jdfs, 'euclidean'=EuclideanDist, 'manhattan'=ManhattanDist, '1 - abs(correlation)'=JdfsAbsolute)
clusteringMethodDictionary = list('complete'='complete', 'average'='average', 'ward\'s'='ward.D2')

shinyServer(
  function(input, output, session) {
    
# Code in shinyServer runs for each user, every time they refresh their browser.

    # Allows user to select all regions/strains at once while also permitting user selection of subgroups of regions/strains.
    selectAllStrainsOld = TRUE
    selectAllRegionsOld = TRUE
    
# Render Images ------------------------------------------------------

#     output$Figure3 <- renderImage({
#       
#       # Use session information to dynamically resize the images.
#       # This is a reactive expression.
#       width = session$clientData$output_Figure3_width
#       height = session$clientData$output_Figure3_height
# 
#       filename = normalizePath(file.path('./www/images/Figure3_MolPsych.png'))
#       
#       list(src=filename,
#            width=width,
#            height=height,
#            alt='Image not found.')
#       
#     }, deleteFile=FALSE)
    

# Shared Widget Code ------------------------------------------------------

    makePlot = function() {
      renderPlot({
        input$recalculate
        
        # ensure plot renders when the app is initially loaded
        if (is.null(isolate(input$strains))) {
          validate(need(input$strains, FALSE))
        }
        if (is.null(isolate(input$regions))) {
          validate(need(input$regions, FALSE))
        }
        
        mousedata = get(paste(tolower(input$volumeType), 'Mousedata', sep=''))
        mousedatamat = as.matrix(mousedata[isolate(input$strains), isolate(input$regions)])
        nr = dim(mousedatamat)[1]
        nc = dim(mousedatamat)[2]
        
        if (dim(mousedatamat)[1] > 1 & dim(mousedatamat)[2] > 1) {
          
          # Create colors to annotate mouse strain metadata.
          strainMetadataColumns = input$strainMetadata
          rlab=list()
          if (!is.null(strainMetadataColumns)) {
            strainMetadataSubset = strainMetadata[strainMetadata$Strain %in% isolate(input$strains), ]
            for (i in 1:length(strainMetadataColumns)) {
              rlab[[i]] = GenerateColors(strainMetadataSubset, strainMetadataColumns[i], 'snow', columnSidebarColorScheme[i])
            }
          }
          rlab = setNames(rlab, strainMetadataColumns) 
                    
          # Create colors to annotate brain region metadata.
          regionMetadataColumns = input$regionMetadata
          clab=list()
          if (!is.null(regionMetadataColumns)) {
            regionMetadataSubset = regionMetadata[regionMetadata$Region %in% isolate(input$regions), ]
            for (i in 1:length(regionMetadataColumns)) {
              clab[[i]] = GenerateColors(regionMetadataSubset, regionMetadataColumns[i], 'snow', rowSidebarColorScheme[i])
            }
          }
          clab = setNames(clab, regionMetadataColumns) 

          # choose appropriate distance function to plot with, call a wrapper function to create the heatmap
          heatmap = Heatmap3Wrapper(x=mousedatamat,
                                    distfun=distanceFunctionDictionary[[tolower(input$distanceFunction)]],
                                    hclustfun=function(x) hclust(x, method=clusteringMethodDictionary[[tolower(input$clusteringMethod)]]),
                                    rlab,
                                    clab)
          
          ## END STATIC HEATMAP 3 
          
          heatmap
        }
      }, height=1000)
    } 

# Tab 1 Widgets ----------------------------------------------------------

    
    
# Tab 2 Widgets ---------------------------------------------------------

    # dynamic control - select levels of mouse strain metadata to plot
    output$strainMetadataLevels = renderUI({
      activeStrainMetadataColumns = input$strainMetadata
      numActiveStrainMetadataColumns = length(activeStrainMetadataColumns)
      
      if (numActiveStrainMetadataColumns != 0) {
        lapply(1:numActiveStrainMetadataColumns, function(i) {
          column(12/numActiveStrainMetadataColumns, checkboxGroupInput(inputId = paste0('strain', activeStrainMetadataColumns[i]),
                                                                       label = h4(activeStrainMetadataColumns[i]),
                                                                       choices = unique(limitedStrainMetadata[, activeStrainMetadataColumns[i]]),
                                                                       selected = unique(limitedStrainMetadata[, activeStrainMetadataColumns[i]])))
        })
      }
    })

    # dynamic control - select levels of brain region metadata to plot
    output$regionMetadataLevels = renderUI({
      activeRegionMetadataColumns = input$regionMetadata
      numActiveRegionMetadataColumns = length(activeRegionMetadataColumns)
      
      if (numActiveRegionMetadataColumns != 0) {
        lapply(1:numActiveRegionMetadataColumns, function(i) {
          column(12/numActiveRegionMetadataColumns, checkboxGroupInput(inputId = paste0('region', activeRegionMetadataColumns[i]),
                                                                       label = h4(activeRegionMetadataColumns[i]),
                                                                       choices = unique(limitedRegionMetadata[, activeRegionMetadataColumns[i]]),
                                                                       selected = unique(limitedRegionMetadata[, activeRegionMetadataColumns[i]])))
        })
      }
    })

    # dynamic control - select mouse strains to show on heatmap
    output$selectStrains = renderUI({
      
      # enable quick selection of all or no strains
#       if (selectAllStrainsOld != input$selectAllStrains) {
#         selectAllStrainsOld <<- input$selectAllStrains
#         if (input$selectAllStrains == TRUE) {
#           checkboxGroupInput(inputId = 'strains', 
#                              label = h3('Mouse Strains'), 
#                              choices = sort(rownames(relativeMousedata)),
#                              selected = rownames(relativeMousedata))
#         } else {
#           checkboxGroupInput(inputId = 'strains', 
#                              label = h3('Mouse Strains'), 
#                              choices = sort(rownames(relativeMousedata)),
#                              selected = vector(mode="character", length=0))
#         }
#       } else {
        
        strainMetadataColumns = names(limitedStrainMetadata)
        
        strainSubset = strainMetadata
        for (column in strainMetadataColumns) {
          levels = eval(expr=parse(text=paste0('input$strain', column)), envir=environment())
          strainSubset = subset(strainSubset, eval(expr=parse(text=paste0('strainSubset$', column)), envir=environment()) %in% levels)
        }
        
        checkboxGroupInput(inputId = 'strains', 
                           label = h3('Mouse Strains'), 
                           choices = sort(rownames(relativeMousedata)),
                           selected = strainSubset$Strain)
#       }
    })

    # dynamic control - select brain regions to show on heatmap
    output$selectRegions = renderUI({
      
      # enable quick selection of all or no regions
#       if (selectAllRegionsOld != input$selectAllRegions) {
#         selectAllRegionsOld <<- input$selectAllRegions
#         if (input$selectAllRegions == TRUE) {
#           checkboxGroupInput(inputId = 'regions', 
#                              label = h3('Brain Regions'), 
#                              choices = sort(colnames(relativeMousedata)),
#                              selected = colnames(relativeMousedata))
#         } else {
#           checkboxGroupInput(inputId = 'regions', 
#                              label = h3('Brain Regions'), 
#                              choices = sort(colnames(relativeMousedata)),
#                              selected = vector(mode="character", length=0))
#         }
#       } else {
        regionMetadataColumns = names(limitedRegionMetadata)
        
        regionSubset = regionMetadata
        for (column in regionMetadataColumns) {
          levels = eval(expr=parse(text=paste0('input$region', column)), envir=environment())
          regionSubset = subset(regionSubset, eval(expr=parse(text=paste0('regionSubset$', column)), envir=environment()) %in% levels)
        }
        
        checkboxGroupInput(inputId = 'regions', 
                           label = h3('Brain Regions'), 
                           choices = sort(colnames(relativeMousedata)),
                           selected = regionSubset$Region)
#       }
    })
    
    output$heatmap1 = makePlot()
    

# Tab 3 Widgets ---------------------------------------------------------

    # dynamic control - select single strain/region for which to plot effect sizes
    output$selectBoxStrainRegion = renderUI({
      if (input$plotBy == 1) {
        selectInput(inputId = 'selectBoxStrainRegion',
                    label = h4('Select Strain(s) to Plot By:'),
                    choices = isolate(input$strains),
                    selected = 1,
                    multiple = TRUE)
      } else if (input$plotBy == 2) {
        selectInput(inputId = 'selectBoxStrainRegion',
                    label = h4('Select Region(s) to Plot By:'),
                    choices = isolate(input$regions),
                    selected = 1,
                    multiple = TRUE)
      }
    })
    
    # dynamic control - type in several brain regions to plot
    output$selectInputRegions = renderUI({
      selectInput(inputId = 'selectInputRegions', 
                  label = h4('Regions to Plot:'), 
                  choices = input$regions,
                  selected = 1,
                  multiple = TRUE)
    })
    
    # dynamic control - type in several mouse strains to plot
    output$selectInputStrains = renderUI({
      selectInput(inputId = 'selectInputStrains', 
                  label = h4('Strains to Plot:'), 
                  choices = input$strains,
                  selected = 1,
                  multiple = TRUE)
    })
    
    # box/violin/bar/dot means plot
    output$meansPlot = renderPlot({
      
      if (!is.null(input$selectInputStrains) & !is.null(input$selectInputRegions)) {
        
        meansData = get(paste(tolower(input$volumeType), 'IndividualData', sep=''))
        meansData = meansData[meansData$name %in% input$selectInputStrains,]
        meansData = meansData[meansData$region %in% input$selectInputRegions,]
        
        meansPlot = ggplot(data=meansData, aes(x=name, y=volume, fill=genotype, colour=genotype))
        
        if (input$plotType == 1) {
          dodge = position_dodge(width=0.9)
          meansPlot = (meansPlot
                       + stat_summary(fun.y=mean, position=position_dodge(width=1), geom='bar')
                       + stat_summary(fun.data=mean_cl_normal, position=position_dodge(width=1), geom='errorbar', color='black', size=0.5, width=0.5))
#                        + scale_y_continuous(limits=c(min(meansData$volume), max(meansData$volume)))
        } else if (input$plotType == 2) {
          meansPlot = (meansPlot
                       + geom_point(position=position_jitterdodge(dodge.width=0.9))
                       + geom_boxplot(fill='white', position=position_dodge(width=0.9), alpha=0.5, outlier.size=0)
                       + stat_summary(fun.y=mean, position=position_dodge(width=0.9), shape=3, col='red', geom='point'))
        } else if (input$plotType == 3) {
          meansPlot = (meansPlot
                       + geom_point(position=position_jitterdodge(dodge.width=0.9))
                       + geom_violin(fill='white', position=position_dodge(width=0.9), alpha=0.5))
        } else if (input$plotType == 4) {
          means = tapply(meansData$volume, meansData$genotype, mean)
          sds = tapply(meansData$volume, meansData$genotype, sd)
          meansPlot = (meansPlot
                       + geom_point(position=position_jitterdodge(dodge=1.0))
                       + stat_summary(fun.data=mean_cl_normal, position=position_dodge(width=1.0), geom='errorbar', color='black', size=0.5, width=0.5))
#                        + stat_summary(fun.y=mean, position=position_dodge(width=1.0), shape=1, col='red', geom='point'))
        }
        
        if (tolower(input$volumeType) == 'absolute') {  # absolute volumes
          meansPlot = meansPlot + labs(x='strain', y=bquote(Volume~(mm^{3})))
        } else {  # relative volumes
          meansPlot = meansPlot + labs(x='strain', y='Relative Volume (%)')
        }

        # customize theme aspects of the plot
        meansPlot = (meansPlot
                     + facet_wrap( ~ region, scales='free')
                     + theme(plot.title = element_text(color='#000000', face='bold', family='Trebuchet MS', size=32))
                     + theme(axis.title = element_text(color='#000000', face='bold', family='Trebuchet MS', size=24))
                     + theme(axis.title.y = element_text(angle=90))
                     + theme(axis.text.x = element_text(color='#000000', face='bold', family='Trebuchet MS', size=14))
                     + theme(axis.text.y = element_text(color='#000000', face='bold', family='Trebuchet MS', size=14))
                     + theme(strip.text = element_text(size=24))
                     + theme(legend.text = element_text(size=14)))
        
        return(meansPlot)
      }
    }, height=800)

    # effect size plot
    output$effectSizePlot = renderPlot({

      mousedata = get(paste(tolower(input$volumeType), 'Mousedata', sep=''))
      
      # handle option for plotting by region or strain
      if (!is.null(input$selectBoxStrainRegion)) {
        if (input$plotBy == 1) {
          # validate call prevents red text from showing up when switching between plotting strain or region
          validate(need(input$selectBoxStrainRegion %in% input$strains, FALSE))
          effectSizeData = melt(mousedata[input$selectBoxStrainRegion, isolate(input$regions)])

          # data that are one dimension must be handled differently from multidimensional data
          if (min(dim(effectSizeData)) == 1) {
            one_dimension = TRUE
          } else {
            one_dimension = FALSE
          }

          # set appropriate colnames
          if (one_dimension) {
            colnames(effectSizeData) = 'effectSize'
            effectSizeData$region = isolate(input$regions)
          } else {
            colnames(effectSizeData) = c('strain', 'region', 'effectSize')  
          }

          # limit the effect size data to a custom max and min
          effectSizeData$effectSize = setEffectSizeLimits(effectSizeData$effectSize, lowerLimit=-3, upperLimit=3)
          
          if (one_dimension) {
            effectSizePlot = (ggplot(data = effectSizeData, 
                                     aes(x = stats:::reorder.default(region, effectSize), 
                                         y = effectSize))
                              + labs(x = '', y = 'Effect Size'))
          } else {      
            # create separate factor to enable plotting by sorted region
            singleStrainData = subset(effectSizeData, strain==isolate(input$selectBoxStrainRegion)[1])
            newRegionOrder = order(singleStrainData$effectSize)
            effectSizeData$region = factor(effectSizeData$region, levels=singleStrainData$region[newRegionOrder])


            effectSizePlot = (ggplot(data = effectSizeData, 
                                     aes(x = region, 
                                         y = effectSize,
                                         fill = strain,
                                         colour = strain
                                         ))
                              + labs(x = '', y = 'Effect Size'))
          }
        } else if (input$plotBy == 2) {
          # validate call prevents red text from showing up when switching between plotting strain or region
          validate(need(input$selectBoxStrainRegion %in% input$regions, FALSE))
          effectSizeData = melt(mousedata[isolate(input$strains), input$selectBoxStrainRegion])
          
          # data that are one dimension must be handled differently from multidimensional data
          if (min(dim(effectSizeData)) == 1) {
            one_dimension = TRUE
          } else {
            one_dimension = FALSE
          }
          
          # set appropriate colnames
          if (one_dimension) {
            colnames(effectSizeData) = 'effectSize'
            effectSizeData$strain = isolate(input$strains)
          } else {
            colnames(effectSizeData) = c('strain', 'region', 'effectSize')  
          }
          
          # limit the effect size data to a custom max and min
          effectSizeData$effectSize = setEffectSizeLimits(effectSizeData$effectSize, lowerLimit=-3, upperLimit=3)
          
          if (one_dimension) {
            effectSizePlot = (ggplot(data = effectSizeData, 
                                     aes(x = stats:::reorder.default(strain, effectSize), 
                                         y = effectSize))
                              + labs(x = '', y = 'Effect Size'))
          } else {      
            # create separate factor to enable plotting by sorted region
            singleRegionData = subset(effectSizeData, region==isolate(input$selectBoxStrainRegion)[1])
            newStrainOrder = order(singleRegionData$effectSize)
            effectSizeData$strain = factor(effectSizeData$strain, levels=singleRegionData$strain[newStrainOrder])
            
            effectSizePlot = (ggplot(data = effectSizeData, 
                                     aes(x = strain, 
                                         y = effectSize,
                                         fill = region,
                                         colour = region
                                     ))
                              + labs(x = '', y = 'Effect Size'))
          }
        }
        
        # plot different thing if it's a 1D plot vs. multidimensional plot
        # customize theme aspects of the plot
        if (one_dimension) {
          effectSizePlot = (effectSizePlot
                            # + geom_point() -- use for dotplot
                            + geom_bar(stat = 'identity', fill = 'thistle1', colour='black')
                            + geom_hline(yintercept=c(-3,3))
                            + geom_hline(yintercept=0, linetype='dotted')
                            + ggtitle(input$selectBoxStrainRegion)
                            + theme(plot.title = element_text(color='#000000', face='bold', family='Trebuchet MS', size=32))
                            + theme(axis.title = element_text(color='#000000', face='bold', family='Trebuchet MS', size=24))
                            + theme(axis.title.y = element_text(angle=90))
                            + theme(axis.text.x = element_text(color='#000000', family='Trebuchet MS', hjust=1, vjust=0.5, size=14))
                            + theme(axis.text.y = element_text(color='#000000', family='Trebuchet MS', size=14))
                            + scale_y_continuous(breaks=seq(-3.5, 3.5, 0.5))
                            + coord_flip())
        } else {
          effectSizePlot = (effectSizePlot
                            # + geom_bar(stat='identity', position='dodge', colour='black')
                            + geom_point(position='dodge')
                            + geom_hline(yintercept=c(-3,3))
                            + geom_hline(yintercept=0, linetype='dotted')
                            + theme(axis.title = element_text(color='#000000', face='bold', family='Trebuchet MS', size=24))
                            + theme(axis.title.y = element_text(angle=90))
                            + theme(axis.text.x = element_text(color='#000000', family='Trebuchet MS', hjust=1, vjust=0.5, size=14))
                            + theme(axis.text.y = element_text(color='#000000', family='Trebuchet MS', size=14))
                            + scale_y_continuous(breaks=seq(-3.5, 3.5, 0.5))
                            + coord_flip())
        }
        
        # return the plot
        return(effectSizePlot)
      }
    }, height=800)

    output$heatmap2 = makePlot()
  }
)