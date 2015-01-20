# server.R

library(gplots)

shinyServer(
  function(input, output) {
    
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
                           vector(mode="character", length=0))
      }    
    })
    
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
                           vector(mode="character", length=0))
      }    
    })
    
    output$heatmap = renderPlot({
      # Take a dependency on input$recalculate
      input$recalculate
      
      # Add error checking for input$strains and input$regions >= 2.  At least one of them must be greater than 2
      # to perform clustering.
      
      # Use isolate() to avoid dependency on input$strains and input$regions
      mousedatamat = as.matrix(mousedata[isolate(input$strains), isolate(input$regions)])
      nr = dim(mousedatamat)[1]
      nc = dim(mousedatamat)[2]
      
#       # Prevent error when rendering the first time, since uiOutputs are not rendered yet
#       if ((nr >= 2) && (nc >= 2)) {
#         heatmap.2(mousedatamat, distfun=jdfs, col=bluered, margins=c(8,14), trace="none", cexRow = 0.2 + 2/log10(nr), cexCol = 0.2 + 2/log10(nc), density.info="histogram", keysize=0.8, symkey=TRUE, symbreaks=TRUE)     
#       }
      
      if (min(dim(mousedatamat)) != 0) {
        heatmap.2(mousedatamat, distfun=jdfs, col=bluered, margins=c(8,14), trace="none", cexRow = 0.2 + 2/log10(nr), cexCol = 0.2 + 2/log10(nc), density.info="histogram", keysize=0.8, symkey=TRUE, symbreaks=TRUE)     
      }
    })
  }
)