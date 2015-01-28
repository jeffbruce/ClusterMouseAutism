# server.R

library(gplots)
library(ggplot2)

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
    
    # Page 2 control for specifying the plot type (box, violin, bar)
    #output$value <- renderPrint({ input$radio })
    
    # Page 2 control for effect size plots
    output$effectSizePlot = renderPlot({
      # Regenerate this plot when the value in selectBoxStrainRegion changes
      
      if (!is.null(input$selectBoxStrainRegion)) {
        if (input$plotBy == 1) {
          #effectSizePlot = ggplot(mousedata)
          effectSizeData = mousedata[input$selectBoxStrainRegion, isolate(input$regions)]
        } else if (input$plotBy == 2) {
          effectSizeData = mousedata[isolate(input$strains), input$selectBoxStrainRegion]
        }
        effectSizePlot = ggplot()
        qplot(x = names(effectSizeData), 
              y = effectSizeData, 
              fill = 'navajowhite4',
              geom = 'bar',
              stat = 'identity',
              xlab = '',
              ylab = 'Effect Sizes',
              main = input$selectBoxStrainRegion)
      }
    })
    
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
        #heatmap.2(mousedatamat, distfun=jdfs, col=bluered, margins=c(8,14), trace="none", cexRow = 0.2 + 2/log10(nr), cexCol = 0.2 + 2/log10(nc), density.info="histogram", keysize=0.8, symkey=TRUE, symbreaks=TRUE)
        heatmap.2(mousedatamat, distfun=jdfs, col=bluered, margins=c(20,14), trace="none", cexRow = 1.5, cexCol = 1.5, density.info="histogram", keysize=0.8, symkey=TRUE, symbreaks=TRUE)
      }
    }, height = 800)
    
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
        #heatmap.2(mousedatamat, distfun=jdfs, col=bluered, margins=c(8,14), trace="none", cexRow = 0.2 + 2/log10(nr), cexCol = 0.2 + 2/log10(nc), density.info="histogram", keysize=0.8, symkey=TRUE, symbreaks=TRUE)
        heatmap.2(mousedatamat, distfun=jdfs, col=bluered, margins=c(20,14), trace="none", cexRow = 1.5, cexCol = 1.5, density.info="histogram", keysize=0.8, symkey=TRUE, symbreaks=TRUE) 
      }
    }, height = 800)
  }
)