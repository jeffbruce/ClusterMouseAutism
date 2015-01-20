# server.R

library(gplots)

shinyServer(
  function(input, output) {
    
    output$heatmap = renderPlot({
      # Take a dependency on input$recalculate
      input$recalculate
      
      # Add error checking for input$strains and input$regions >= 2.  At least one of them must be greater than 2
      # to perform clustering.
      
      # Use isolate() to avoid dependency on input$strains and input$regions
      mousedatamat = as.matrix(mousedata[isolate(input$strains), isolate(input$regions)])
      nr = dim(mousedatamat)[1]
      nc = dim(mousedatamat)[2]
      
      heatmap.2(mousedatamat, distfun=jdfs, col=bluered, margins=c(8,14), trace="none", cexRow = 0.2 + 2/log10(nr), cexCol = 0.2 + 2/log10(nc), density.info="histogram", keysize=0.8, symkey=TRUE, symbreaks=TRUE)     

    })
  }
)
