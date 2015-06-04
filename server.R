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

shinyServer(
  function(input, output, session) {
    
# Code in shinyServer runs for each user, every time they refresh their browser.

# Render Images ------------------------------------------------------

    output$Figure3 <- renderImage({
      
      # Use session information to dynamically resize the images.
      # This is a reactive expression.
      width = session$clientData$output_Figure3_width
      
      filename = normalizePath(file.path('./www/images/Figure3_MolPsych.png'))
      
      list(src=filename,
           width=width,
           alt='Image not found.')
      
    }, deleteFile=FALSE)
    

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
        
        # isolate() prevents heatmap from regenerating every time a new strain/region is selected
        mousedatamat = as.matrix(mousedata[isolate(input$strains), isolate(input$regions)])
        nr = dim(mousedatamat)[1]
        nc = dim(mousedatamat)[2]
        
        if (dim(mousedatamat)[1] > 1 & dim(mousedatamat)[2] > 1) {
      
            # failed efforts at trying to replace the dendrogram
            #         hr <- hclust(as.dist(1-cor(t(mousedatamat), method='pearson')), method='complete')
            #         hc <- hclust(as.dist(1-cor(mousedatamat, method='pearson')), method='complete')
            #         testheatmap <- heatmap.2(mousedatamat, distfun=jdfs)
            #         rowInd = testheatmap$rowInd
            #         colInd = testheatmap$colInd
            #         mousedatamat = mousedatamat[rev(testheatmap$rowInd), testheatmap$colInd]        
            #         mousedatamat[mousedatamat < -3] = -3
            #         mousedatamat[mousedatamat > 3] = 3
            
            heatmap = heatmap.2(x=mousedatamat,
                                # Rowv and Colv attempts at replacing dendrogram                             
                                # Rowv=as.dendrogram(hr),
                                # Colv=as.dendrogram(hc),
                                # Rowv=rowInd,
                                # Colv=colInd,
                                distfun=jdfs,
                                # hclustfun=hclust.avg,
                                breaks=seq(-3, 3, by=0.4),
                                col=bluered,
                                margins=c(20,14),
                                trace='none', 
                                cexRow=1.5, 
                                cexCol=1.5, 
                                density.info='histogram', 
                                keysize=0.8,
                                key.title='Effect Size',
                                key.xlab='Relative to Wildtype',
                                symkey=TRUE, 
                                symbreaks=TRUE)
        }
      }, height=800)
    }


# Tab 1 Widgets ----------------------------------------------------------

    
    
# Tab 2 Widgets ---------------------------------------------------------

    # dynamic control - select all brain regions
    output$selectRegions = renderUI({
      if (input$selectAllRegions == TRUE) {
        checkboxGroupInput(inputId = 'regions', 
                           label = h3('Brain Regions'), 
                           choices = sort(colnames(mousedata)),
                           selected = colnames(mousedata))
      } else {
        checkboxGroupInput(inputId = 'regions', 
                           label = h3('Brain Regions'), 
                           choices = sort(colnames(mousedata)),
                           selected = vector(mode="character", length=0))
      }    
    })
    
    # dynamic control - select all mouse strains
    output$selectStrains = renderUI({
      if (input$selectAllStrains == TRUE) {
        checkboxGroupInput(inputId = 'strains', 
                           label = h3('Mouse Strains'), 
                           choices = sort(rownames(mousedata)),
                           selected = rownames(mousedata))
      } else {
        checkboxGroupInput(inputId = 'strains', 
                           label = h3('Mouse Strains'), 
                           choices = sort(rownames(mousedata)),
                           selected = vector(mode="character", length=0))
      }    
    })
    
    output$heatmap1 = makePlot()
    # heatmap for reclustering
#     output$heatmap1 = renderPlot({
#       input$recalculate
# 
#       # ensure plot renders when the app is initially loaded
#       if (is.null(isolate(input$strains))) {
#         validate(need(input$strains, FALSE))
#       }
#       if (is.null(isolate(input$regions))) {
#         validate(need(input$regions, FALSE))
#       }
#       
#       # isolate() prevents heatmap from regenerating every time a new strain/region is selected
#       mousedatamat = as.matrix(mousedata[isolate(input$strains), isolate(input$regions)])
#       nr = dim(mousedatamat)[1]
#       nc = dim(mousedatamat)[2]
#       
#       if (dim(mousedatamat)[1] > 1 & dim(mousedatamat)[2] > 1) {
# 
#         
#         heatmap = heatmap.2(x=mousedatamat,
#                             distfun=jdfs,
#                             breaks=seq(-3, 3, by=0.4),
#                             col=bluered, 
#                             margins=c(20,14),
#                             trace='none', 
#                             cexRow=1.5, 
#                             cexCol=1.5, 
#                             density.info='histogram', 
#                             keysize=0.8,
#                             key.title='Effect Size',
#                             key.xlab='Relative to Wildtype',
#                             symkey=TRUE, 
#                             symbreaks=TRUE)
#       }
#       heatmap
#     }, height=800)
    

# Tab 3 Widgets ---------------------------------------------------------

    # dynamic control - select single strain/region for which to plot effect sizes
    output$selectBoxStrainRegion = renderUI({
      if (input$plotBy == 1) {
        selectInput(inputId = 'selectBoxStrainRegion',
                    label = h4('Select Strain to Plot By:'),
                    choices = isolate(input$strains),
                    selected = 1,
                    multiple = FALSE)
      } else if (input$plotBy == 2) {
        selectInput(inputId = 'selectBoxStrainRegion',
                    label = h4('Select Region to Plot By:'),
                    choices = isolate(input$regions),
                    selected = 1,
                    multiple = FALSE)
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
        
        meansData = individualData
        meansData = meansData[meansData$name %in% input$selectInputStrains,]
        meansData = meansData[meansData$region %in% input$selectInputRegions,]
        
        meansPlot = ggplot(data=meansData, aes(x=name, y=volume, fill=genotype, colour=genotype))
        
        browser()
        
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

browser()
        
        # customize theme aspects of the plot
        meansPlot = (meansPlot
                     + facet_wrap( ~ region, scales='free')
                     + labs(x='strain', y=bquote(Volume~(mm^{3})))
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
      
      # handle option for plotting by region or strain
      if (!is.null(input$selectBoxStrainRegion)) {
        if (input$plotBy == 1) {
          effectSizeData = data.frame(region = isolate(input$regions), 
                                      effectSize = mousedata[input$selectBoxStrainRegion, isolate(input$regions)],
                                      row.names = NULL)
          effectSizeData$effectSize = setEffectSizeLimits(effectSizeData$effectSize, lowerLimit=-3, upperLimit=3)
          effectSizePlot = (ggplot(data = effectSizeData, 
                                   aes(x = stats:::reorder.default(region, effectSize), 
                                       y = effectSize))
                            + labs(x = '', y = 'Effect Size'))
        } else if (input$plotBy == 2) {
          effectSizeData = data.frame(strain = isolate(input$strains), 
                                      effectSize = mousedata[isolate(input$strains), input$selectBoxStrainRegion],
                                      row.names = NULL)
          effectSizeData$effectSize = setEffectSizeLimits(effectSizeData$effectSize, lowerLimit=-3, upperLimit=3)
          effectSizePlot = (ggplot(data = effectSizeData, 
                                   aes(x = stats:::reorder.default(strain, effectSize), 
                                       y = effectSize))
                            + labs(x = '', y = 'Effect Size'))
        }
        
        # customize theme aspects of the plot
        effectSizePlot = (effectSizePlot
                          + geom_bar(stat = 'identity', fill = 'thistle1', colour='black')
                          + geom_hline(yintercept=3)
                          + geom_hline(yintercept=-3)
                          + ggtitle(input$selectBoxStrainRegion)
                          + theme(plot.title = element_text(color='#000000', face='bold', family='Trebuchet MS', size=32))
                          + theme(axis.title = element_text(color='#000000', face='bold', family='Trebuchet MS', size=24))
                          + theme(axis.title.y = element_text(angle=90))
                          + theme(axis.text.x = element_text(angle=90, color='#000000', face='bold', family='Trebuchet MS', hjust=1, vjust=0.5, size=14))
                          + theme(axis.text.y = element_text(color='#000000', face='bold', family='Trebuchet MS', size=14))
                          + scale_y_continuous(breaks=seq(-3.5, 3.5, 0.5)))
        
        # return the plot
        return(effectSizePlot)
      }
    }, height=800)


    output$heatmap2 = makePlot()
  }
)