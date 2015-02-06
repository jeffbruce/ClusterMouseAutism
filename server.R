# server.R
# all shared stuff is declared in global.R instead of here
# because ui.R needs to access some libraries/data

shinyServer(
  function(input, output) {
    
    # Page 1 dynamic UI element for selecting all brain regions
    output$selectRegions = renderUI({
      if (input$selectAllRegions == TRUE) {
        checkboxGroupInput(inputId = 'regions', 
                           label = h3('Brain Regions'), 
                           choices = colnames(mousedata),
                           selected = colnames(mousedata))
      } else {
        checkboxGroupInput(inputId = 'regions', 
                           label = h3('Brain Regions'), 
                           choices = colnames(mousedata),
                           selected = vector(mode="character", length=0))
      }    
    })
    
    # Page 1 dynamic UI element for selecting all mouse strains
    output$selectStrains = renderUI({
      if (input$selectAllStrains == TRUE) {
        checkboxGroupInput(inputId = 'strains', 
                           label = h3('Mouse Strains'), 
                           choices = rownames(mousedata),
                           selected = rownames(mousedata))
      } else {
        checkboxGroupInput(inputId = 'strains', 
                           label = h3('Mouse Strains'), 
                           choices = rownames(mousedata),
                           selected = vector(mode="character", length=0))
      }    
    })
    
    # Page 2 control for selecting a single strain/region to plot effect sizes
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
    
    # Page 2 control for selecting brain regions to plot
    output$selectInputRegions = renderUI({
      selectInput(inputId = 'selectInputRegions', 
                  label = h4('Regions to Plot:'), 
                  choices = input$regions,
                  selected = 1,
                  multiple = TRUE)
    })
    
    # Page 2 control for selecting mouse strains to plot
    output$selectInputStrains = renderUI({
      selectInput(inputId = 'selectInputStrains', 
                  label = h4('Strains to Plot:'), 
                  choices = input$strains,
                  selected = 1,
                  multiple = TRUE)
    })
    
    # Page 2 control for box/violin/bar plot
    # output$value <- renderPrint({ input$radio })
    output$meansPlot = renderPlot({

      if (!is.null(input$selectInputStrains) & !is.null(input$selectInputRegions)) {
        
        meansData = with(individualData, subset(x=individualData, subset=(name==input$selectInputStrains)))
        meansData = meansData[meansData$region %in% input$selectInputRegions,]
        
        if (input$plotType == 1) {
          dodge = position_dodge(width=0.9)
          meansPlot = ggplot(data=meansData,
                             aes(x=name, y=volume, fill=genotype, colour=genotype))
          meansPlot = meansPlot +
            stat_summary(fun.y=mean, position=position_dodge(), geom='bar') +
            facet_wrap( ~ region, scales='free')
          # add error bars in as well
        } else if (input$plotType == 2) {
          meansPlot = ggplot(data=meansData,
                             aes(x=name, y=volume, fill=genotype, colour=genotype))
          meansPlot = meansPlot +
            geom_point(position=position_jitterdodge(dodge.width=0.9)) +
            geom_boxplot(fill='white', position=position_dodge(width=0.9), alpha=0.5) +
            facet_wrap( ~ region, scales='free')
        } else if (input$plotType == 3) {
          meansPlot = ggplot(data=meansData,
                             aes(x=name, y=volume, fill=genotype, colour=genotype))
          meansPlot = meansPlot +
            geom_violin(fill='white', position=position_dodge(width=0.9), alpha=0.5) +
            facet_wrap( ~ region, scales='free')
        }
        
        # Customize theme aspects of the plot
        meansPlot = meansPlot +
          labs(x='strain', y='Volume (mm^3)') +
          theme(plot.title = element_text(color='#000000', face='bold', family='Trebuchet MS', size=32)) +
          theme(axis.title = element_text(color='#000000', face='bold', family='Trebuchet MS', size=24)) +
          theme(axis.title.y = element_text(angle=90)) + 
          theme(axis.text.x = element_text(color='#000000', face='bold', family='Trebuchet MS', size=14)) +
          theme(axis.text.y = element_text(color='#000000', face='bold', family='Trebuchet MS', size=14)) +
          theme(strip.text = element_text(size=24)) + 
          theme(legend.text = element_text(size=14))
        
        # Return the plot
        return(meansPlot)
      }
    }, height=800)
    
    # Page 2 control for effect size plots
    output$effectSizePlot = renderPlot({
      
      # Select region/strain data/labels depending on which option is picked
      if (!is.null(input$selectBoxStrainRegion)) {
        if (input$plotBy == 1) {
          effectSizeData = data.frame(region = isolate(input$regions), 
                                     effectSize = mousedata[input$selectBoxStrainRegion, isolate(input$regions)],
                                     row.names = NULL)
          effectSizePlot = ggplot(data = effectSizeData, 
                                  aes(x = stats:::reorder.default(region, effectSize), y = effectSize))
          effectSizePlot = effectSizePlot + labs(x = '', y = 'Effect Size')
        } else if (input$plotBy == 2) {
          effectSizeData = data.frame(strain = isolate(input$strains), 
                                      effectSize = mousedata[isolate(input$strains), input$selectBoxStrainRegion],
                                      row.names = NULL)
          effectSizePlot = ggplot(data = effectSizeData, 
                                  aes(x = stats:::reorder.default(strain, effectSize), y = effectSize))
          effectSizePlot = effectSizePlot + labs(x = '', y = 'Effect Size')
        }
        
        # Customize theme aspects of the plot
        effectSizePlot = effectSizePlot +
          geom_bar(stat = 'identity', fill = 'thistle1', colour='black') +
          ggtitle(input$selectBoxStrainRegion) +
          theme(plot.title = element_text(color='#000000', face='bold', family='Trebuchet MS', size=32)) +
          theme(axis.title = element_text(color='#000000', face='bold', family='Trebuchet MS', size=24)) +
          theme(axis.title.y = element_text(angle=90)) + 
          theme(axis.text.x = element_text(angle=90, color='#000000', face='bold', family='Trebuchet MS', hjust=0, size=14)) +
          theme(axis.text.y = element_text(color='#000000', face='bold', family='Trebuchet MS', size=14)) +
          ylim(-2.5, 2.5)
        
        # Return the plot
        return(effectSizePlot)
      }
    }, height=800)
    
    # Page 1 heatmap for reclustering
    output$heatmap1 = renderPlot({
      # Regenerate this plot when recalculate is clicked
      input$recalculate
      
      # Add error checking for input$strains and input$regions >= 2.  At least one of them must be greater than 2
      # to perform clustering.
      
      # Use isolate() to prevent heatmap from generating every time a new strain/region is selected
      mousedatamat = as.matrix(mousedata[isolate(input$strains), isolate(input$regions)])
      nr = dim(mousedatamat)[1]
      nc = dim(mousedatamat)[2]
     
      if (min(dim(mousedatamat)) != 0) {
        heatmap.2(x=mousedatamat, 
                  distfun=jdfs, 
                  col=bluered, 
                  margins=c(20,14), 
                  trace="none", 
                  cexRow=1.5, 
                  cexCol=1.5, 
                  density.info='histogram', 
                  keysize=0.8, 
                  symkey=TRUE, 
                  symbreaks=TRUE)
      }
    }, height=800)
    
    # Page 2 heatmap for generating individual or group plots
    output$heatmap2 = renderPlot({
      # Regenerate this plot when recalculate is clicked
      input$recalculate
      
      # Add error checking for input$strains and input$regions >= 2.  At least one of them must be greater than 2
      # to perform clustering.
      
      # Use isolate() to prevent heatmap from generating every time a new strain/region is selected
      mousedatamat = as.matrix(mousedata[isolate(input$strains), isolate(input$regions)])
      nr = dim(mousedatamat)[1]
      nc = dim(mousedatamat)[2]
      
      if (min(dim(mousedatamat)) != 0) {
        heatmap.2(x=mousedatamat, 
                  distfun=jdfs, 
                  col=bluered, 
                  margins=c(20,14),
                  trace='none', 
                  cexRow=1.5, 
                  cexCol=1.5, 
                  density.info='histogram', 
                  keysize=0.8, 
                  symkey=TRUE, 
                  symbreaks=TRUE) 
      }
    }, height=800)
  }
)