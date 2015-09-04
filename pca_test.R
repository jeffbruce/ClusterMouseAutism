# REFERENCE ARTICLES:
# https://tgmstat.wordpress.com/2013/11/28/computing-and-visualizing-pca-in-r/#ref1
# https://tgmstat.wordpress.com/2013/11/21/introduction-to-principal-component-analysis-pca/

library(data.table)
library(dplyr)
library(reshape2)
library(ggplot2)
library(ggbiplot)  # used to visualize pcr
library(caret)  # apply Box-Box transformation to correct for skewness, center and scale then apply PCA in one call to preProcess

setwd('//micehome//jbruce//Documents//Code//R//ClusterMouseAutism')
source('helpers.R')

# Visualizing the distributions of the different features (regions)
id_long = IndividualData(datadefs, 'absolute')
testplot = ggplot(data=id_long, aes(x=volume))
testplot + geom_histogram() + facet_wrap(~region, scales='free')

# Execute IndividualData2 function listed below
LoadData() 
id = IndividualData2(datadefs, 'absolute')
id

# Recommended practice for running pca -- first log transform 
log_id = log(select(id, -genotype, -name))
id_genotype = id$genotype
id_name = id$name

# prcomp is in the stats package
id_pca = prcomp(log_id, center=TRUE, scale=TRUE)

# can use preProcess function in the caret package to do the necessary transformations before applying PCA
trans = preProcess(select(id, -name, -genotype), method=c('BoxCox', 'center', 'scale', 'pca'))
PC = predict(trans, select(id, -name, -genotype))

print(id_pca)
plot(id_pca, type='l')
summary(id_pca)
predict(id_pca, newdata=tail(log_id, 2))

# omitted groups in the data
g <- ggbiplot(id_pca, obs.scale = 1, var.scale = 1, groups = id_name, ellipse = TRUE, circle = TRUE)
g <- ggbiplot(id_pca, obs.scale=1, var.scale=1, ellipse=TRUE, circle=TRUE)
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal', 
               legend.position = 'top')

# Get volumes for each individual mouse
IndividualData2 <- function(datadefs, volumeType) {
  individualData = data.table(matrix(ncol = 2 + length(GetColNames())))
  individualData = individualData[-1, ]
  setnames(individualData, c('name', 'genotype', GetColNames()))
  for (i in 1:nrow(datadefs)) {
    row = datadefs[i, ]
    if (volumeType == 'absolute') {
      tempData = get(gsub(pattern='relative', replace='absolute', row$data))
    } else {
      tempData = get(row$data)
    }
    tempData = as.data.table(tempData)
    setnames(tempData, GetColNames())
    tempData$name = row$name
    tempData$genotype = NA
    genotypeTerms = get(row$term, get(row$gf))
    wtIndices = grep(row$G1, genotypeTerms)
    koIndices = grep(row$G2, genotypeTerms)
    tempData$genotype[wtIndices] = row$G1
    tempData$genotype[koIndices] = row$G2
    tempData = subset(tempData, (genotype == row$G1 | genotype == row$G2))
    individualData = rbind(individualData, tempData)
  }
  return(individualData)
}