# The maximum amount of metadata sidebars (could have 5 row sidebars AND 5 column sidebars).
maxMetadataSidebars = 5

# assign(x='rowSidebarColorScheme', c('pink4', 'deeppink4', 'plum4', 'mediumpurple4', 'purple4'), envir=parent.frame())
# assign(x='columnSidebarColorScheme', c('darkseagreen4', 'springgreen4', 'olivedrab4', 'green4', 'yellow4'), envir=parent.frame())

GenerateColors <- function(dataFrame, column, color1, color2) {
  # Summary:
  #   Given a data frame, a column in that data frame, and two colors, generate a color map with number of colors equal to the number of _filtered_ levels for the column, then map the colors to the different levels for that column for each row in the dataset.
  # Args:
  #   dataFrame: A data frame containing containing columns to generate colors for.
  #   column: A string representing a column name.
  #   color1: A string representing a color in R.
  #   color2: A string representing a color in R.
  # Returns:
  #   columnColors: A vector containing color names.
    
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
    indices <- which(columnData == level)
    columnColors[indices] = col[i]
    i <- i + 1
  }
  
  columnColors
}


MaxMetadataLevels <- function(selectedStrainMetadata, selectedRegionMetadata) {
  # Summary:
  #   Returns the maximum metadata levels out of all metadata columns selected for the plot.
  
  numMetadataRows = dim(selectedStrainMetadata)[2]
  numMetadataColumns = dim(selectedRegionMetadata)[2]
  
  # Determine the height of the legend (maximum levels for a single metadata column).
  maxMetadataLevels = 0
  if (!is.null(numMetadataRows)) {
    for (j in 1:numMetadataRows) {
      maxMetadataLevels = max(maxMetadataLevels, length(unique(selectedStrainMetadata[, j])))
    }
  }
  if (!is.null(numMetadataColumns)) {
    for (j in 1:numMetadataColumns) {
      maxMetadataLevels = max(maxMetadataLevels, length(unique(selectedRegionMetadata[, j])))
    }
  }
  
  maxMetadataLevels
}

ExtendLegendColors <- function(clab, rlab, selectedStrainMetadata, selectedRegionMetadata) {
  # Summary:
  #   Creates a vector of colors to use to draw a legend for a heatmap with several metadata annotation sidebars.
  # Args:
  #   clab: A matrix of colors denoting metadata for the columns of a heatmap.
  #   rlab: A matrix of colors denoting metadata for the rows of a heatmap.
  # Returns:
  #   colors: A vector of colors containing colors to use for a heatmap legend.
  
  numMetadataRows = dim(rlab)[1]
  numMetadataColumns = dim(clab)[2]
  maxMetadataLevels = MaxMetadataLevels(selectedStrainMetadata, selectedRegionMetadata)
  
  colors = vector(mode='character')
  
  if (!is.null(numMetadataRows)) {
    for (i in 1:numMetadataRows) {
      tempColors = unique(rlab[i, ])
      while (length(tempColors) < maxMetadataLevels) {
        tempColors = c('white', tempColors)
      }
      colors = c(colors, tempColors)
    }
  }
  
  if (!is.null(numMetadataColumns)) {
    for (j in 1:numMetadataColumns) {
      tempColors = unique(clab[, j])
      while (length(tempColors) < maxMetadataLevels) {
        tempColors = c('white', tempColors)
      }
      colors = c(colors, tempColors)
    }
  }
  
  colors
}

ExtendLegendLabels <- function(selectedStrainMetadata, selectedRegionMetadata) {
  # Summary:
  #   Creates a vector of labels to use to draw a legend for a heatmap with several metadata annotation sidebars.
  # Args:
  #   selectedRegionMetadata: A data.frame containing metadata for the brain regions.
  #   selectedStrainMetadata: A data.frame containing metadata for the mouse strains.
  # Returns:
  #   labels: A vector of strings containing labels to use for a heatmap legend.
    
  numMetadataRows = dim(selectedStrainMetadata)[2]
  numMetadataColumns = dim(selectedRegionMetadata)[2]
  maxMetadataLevels = MaxMetadataLevels(selectedStrainMetadata, selectedRegionMetadata)
  
  labels = vector(mode='character')
  
  if (!is.null(numMetadataRows)) {
    for (j in 1:numMetadataRows) {
      tempLabels = unique(selectedStrainMetadata[, j])
      while (length(tempLabels) < maxMetadataLevels) {
        tempLabels = c('', tempLabels)
      }
      labels = c(labels, tempLabels)
    }
  }
  
  if (!is.null(numMetadataColumns)) {
    for (j in 1:numMetadataColumns) {
      tempLabels = unique(selectedRegionMetadata[, j])
      while (length(tempLabels) < maxMetadataLevels) {
        tempLabels = c('', tempLabels)
      }
      labels = c(labels, tempLabels)
    }
  }

  labels
}