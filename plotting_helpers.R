maxMetadataLevels = 6

GenerateColors <- function(dataFrame, column, color1, color2) {
  # Summary:
  #   Given a data frame, a column in that data frame, and two colors, generate a color map with number of colors equal to the number of levels for the column, then map the colors to the different levels for that column for each row in the dataset.
  # Args:
  #   dataFrame: A data frame containing containing columns to generate colors for.
  #   column: A string representing a column name.
  #   color1: A string representing a color in R.
  #   color2: A string representing a color in R.
  # Returns:
  #   columnColors: A vector containing color names.  Always returns 6 colors.
  
  if (column %in% names(dataFrame)) {
    columnData <- dataFrame[, column] 
    columnLevels <- unique(columnData)
    numColors <- length(columnLevels)
  } else {
    return(NA)
  }
  
  col=colorRampPalette(c(color1, color2))(n=numColors)
  columnColors <- vector(mode='character', length=length(columnData))
  
  i <- 1
  for (level in columnLevels) {
    indices  <-  which(columnData == level)
    columnColors[indices] = col[i]
    i <- i + 1
  }
  
  columnColors
}

ExtendLegendColors <- function(clab, rlab) {
  # Summary:
  #   Creates a vector of colors to use to draw a legend for a heatmap with several metadata annotation sidebars.
  # Args:
  #   clab: A matrix of colors denoting metadata for the columns of a heatmap.
  #   rlab: A matrix of colors denoting metadata for the rows of a heatmap.
  # Returns:
  #   colors: A vector of colors containing colors to use for a heatmap legend.
  
  numMetadataColumns = dim(clab)[2]
  numMetadataRows = dim(rlab)[1]
  
  colors = vector(mode='character')
  
  for (j in 1:numMetadataColumns) {
    tempColors = unique(clab[, j])
    while (length(tempColors) < maxMetadataLevels) {
      tempColors = c('white', tempColors)
    }
    colors = c(colors, tempColors)
  }
  
  for (i in 1:numMetadataRows) {
    tempColors = unique(rlab[i, ])
    while (length(tempColors) < maxMetadataLevels) {
      tempColors = c('white', tempColors)
    }
    colors = c(colors, tempColors)
  }
  
  colors
}

ExtendLegendLabels <- function(limitedRegionMetadata, limitedStrainMetadata) {
  # Summary:
  #   Creates a vector of labels to use to draw a legend for a heatmap with several metadata annotation sidebars.
  # Args:
  #   limitedRegionMetadata: A data.frame containing metadata for the brain regions.
  #   limitedStrainMetadata: A data.frame containing metadata for the mouse strains.
  # Returns:
  #   labels: A vector of strings containing labels to use for a heatmap legend.
  
  numMetadataColumns = dim(limitedRegionMetadata)[2]
  numMetadataRows = dim(limitedStrainMetadata)[2]
  
  labels = vector(mode='character')
  
  columnNames = colnames(limitedRegionMetadata)
  for (j in 1:numMetadataColumns) {
    tempLabels = unique(limitedRegionMetadata[, j])
    while (length(tempLabels) < 6) {
      tempLabels = c('', tempLabels)
    }
    labels = c(labels, tempLabels)
  }
  
  columnNames = colnames(limitedStrainMetadata)
  for (j in 1:numMetadataRows) {
    tempLabels = unique(limitedStrainMetadata[, j])
    while (length(tempLabels) < 6) {
      tempLabels = c('', tempLabels)
    }
    labels = c(labels, tempLabels)
  }
  
  labels
}