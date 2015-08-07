# Data Specification ---------------------------------------

# Only defined for relative volumes but "relative" is replaced with "absolute" when actually loading the data, but only for the combined_vols files, not the gf files.
datadefs <- rbind(c(name="FMR1 (-/Y) (B6)", 
                    gf="gf_FMR1_relative", 
                    data="combined_vols_FMR1_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="FXS"),
                  c(name="FMR1 (-/y) (FVB)", 
                    gf="gf_FMR1_FVB_relative", 
                    data="combined_vols_FMR1_FVB_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="FXS"),
                  c(name="Mecp2 (-/y)", 
                    gf="gf_Mecp2_p60_relative", 
                    data="combined_vols_Mecp2_p60_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="Rett"),
                  c(name="NL3 R451C", 
                    gf="gf_NL3_relative", 
                    data="combined_vols_NL3_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="NLGN"),
                  c(name="En2 (-/-)", 
                    gf="gf_En2_relative", 
                    data="combined_vols_En2_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="En2"),
                  c(name="16p11.2 (dp/+)", 
                    gf="gf_16p11_relative", 
                    data="combined_vols_16p11_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="dp", 
                    group="16p11"),
                  c(name="16p11.2 (df/dp)", 
                    gf="gf_16p11_relative", 
                    data="combined_vols_16p11_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="dfdp", 
                    group="16p11"),
                  c(name="16p11.2 (df/+)", 
                    gf="gf_16p11_relative", 
                    data="combined_vols_16p11_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="df", 
                    group="16p11"),
                  c(name="15q11-13 (patDp/+)", 
                    gf="gf_15q_relative", 
                    data="combined_vols_15q_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="DEL", 
                    group="15q"),
                  c(name="CNTNAP2 (-/-)", 
                    gf="gf_CNTNAP2_relative", 
                    data="combined_vols_CNTNAP2_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="22q11"),
                  c(name="BTBR (B6)", 
                    gf="gf_BTBR_relative", 
                    data="combined_vols_BTBR_relative",
                    term="Genotype", 
                    G1="B6", 
                    G2="BTBR", 
                    group="BTBR"),
                  c(name="BTBR (FVB)", 
                    gf="gf_BTBR_relative", 
                    data="combined_vols_BTBR_relative",
                    term="Genotype", 
                    G1="FVB", 
                    G2="BTBR", 
                    group="BTBR"),
                  c(name="NRXN1a (-/-)", 
                    gf="gf_NRXN1a_relative", 
                    data="combined_vols_NRXN1a_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="NRXN"),
                  c(name="NRXN1a (-/+)", 
                    gf="gf_NRXN1a_relative", 
                    data="combined_vols_NRXN1a_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="Het", 
                    group="NRXN"),
  #                   c(name="SLC6A4 Ala56 (B6)", 
  #                     gf="gf_SERT_KI_Male_relative", 
  #                     data="combined_vols_SERT_KI_Male_relative",
  #                     term="Genotype", 
  #                     G1="WT", 
  #                     G2="KI", 
  #                     group="SERT"),
                  c(name="SLC6A4 Ala56 (B6)", 
                    gf="gf_SERT_KI_relative", 
                    data="combined_vols_SERT_KI_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KI", 
                    group="SERT"),
  #                   c(name="SLC6A4 Ala56 (129)", 
  #                     gf="gf_SERT_KI_129_relative_Male", 
  #                     data="combined_vols_SERT_KI_129_Male_relative",
  #                     term="Genotype", 
  #                     G1="WT", 
  #                     G2="KI", 
  #                     group="SERT"),
                  c(name="SLC6A4 Ala56 (129)", 
                    gf="gf_SERT_KI_129_relative", 
                    data="combined_vols_SERT_KI_129_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KI", 
                    group="SERT"),
  #                   c(name="SLC6A4 KO (-/-)", 
  #                     gf="gf_SERT_KO_Male_relative", 
  #                     data="combined_vols_SERT_KO_Male_relative",
  #                     term="Genotype", 
  #                     G1="WT", 
  #                     G2="KO", 
  #                     group="SERT"),
                  c(name="SLC6A4 KO (-/-)", 
                    gf="gf_SERT_KO_relative", 
                    data="combined_vols_SERT_KO_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="SERT"),
                  c(name="SHANK3 (-/-)", 
                    gf="gf_SHANK3_relative", 
                    data="combined_vols_SHANK3_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="SHANK3"),
                  c(name="SHANK3 (-/+)", 
                    gf="gf_SHANK3_relative", 
                    data="combined_vols_SHANK3_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="Het", 
                    group="SHANK3"),
                  c(name="AndR (12Q)", 
                    gf="gf_AndR_relative", 
                    data="combined_vols_AndR_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="12Q", 
                    group="AndR"),
                  c(name="AndR (48Q)", 
                    gf="gf_AndR_relative", 
                    data="combined_vols_AndR_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="48Q", 
                    group="AndR"),
                  c(name="BALB/CJ (B6)", 
                    gf="gf_BALBC_relative", 
                    data="combined_vols_BALBC_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="BALBC", 
                    group="BALBC"),
                  c(name="XO", 
                    gf="gf_Turner_relative", 
                    data="combined_vols_Turner_relative",
                    term="Genotype", 
                    G1="XX", 
                    G2="XO", 
                    group="Turner"),
                  c(name="GTF2i (dp/dp)", 
                    gf="gf_Gtf2i_relative", 
                    data="combined_vols_Gtf2i_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="XS", 
                    group="Gtf2i"),
                  c(name="GTF2i (+/-)", 
                    gf="gf_Gtf2i_relative", 
                    data="combined_vols_Gtf2i_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="YT", 
                    group="Gtf2i"),
                  c(name="ITGB3 (-/-)", 
                    gf="gf_ITGB3_relative", 
                    data="combined_vols_ITGB3_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="ITGB3"))

datadefs <- as.data.frame(datadefs, stringsAsFactors=FALSE)


# Loading Data ------------------------------------------------------------

LoadData = function() {
  # Summary:
  #   Loads the gf files, and both the relative and absolute combined vols data files.
  
  dataFiles = datadefs$data
  gfFiles = datadefs$gf
  
  # load gf files
  for (file in gfFiles) {
    gfFile = paste(getwd(), "/data/", file, ".txt", sep="")
    assign(x=file, value=read.table(file=gfFile, header=TRUE, sep=" "), envir=parent.frame())
  }
  
  # load relative volume files
  for (file in dataFiles) {
    dataFile = paste(getwd(), "/data/", file, ".txt", sep="")
    assign(x=file, value=read.table(file=dataFile, header=TRUE, sep=" "), envir=parent.frame())
  }
  
  # load absolute volume files
  for (file in dataFiles) {
    absoluteFile = gsub('relative', 'absolute', file)
    dataFile = paste(getwd(), "/data/", absoluteFile, ".txt", sep="")
    assign(x=absoluteFile, value=read.table(file=dataFile, header=TRUE, sep=" "), envir=parent.frame())
  }
    
  # load metadata
  # first row of these .csv files contains a header, the second row contains 0 if the column should not be used as metadata in the Shiny app, and 1 if the column should be used as metadata
  assign(x='regionMetadata', value=read.csv(file.path(getwd(), 'data/region_metadata.csv'), stringsAsFactors=FALSE), envir=parent.frame())
  assign(x='limitedRegionMetadata', value=regionMetadata[, -1], envir=parent.frame())
  assign(x='strainMetadata', value=read.csv(file.path(getwd(), 'data/strain_metadata.csv'), stringsAsFactors=FALSE), envir=parent.frame())
  assign(x='limitedStrainMetadata', value=strainMetadata[, -1], envir=parent.frame())
  
  # TODO - needs to be moved to plotting_helpers.R 
  assign(x='rowSidebarColorScheme', c('pink4', 'deeppink4', 'plum4', 'mediumpurple4', 'purple4'), envir=parent.frame())
  assign(x='columnSidebarColorScheme', c('darkseagreen4', 'springgreen4', 'olivedrab4', 'green4', 'yellow4'), envir=parent.frame())
}

# Heatmap Wrapper Function ---------------------------------------------------------

Heatmap2Wrapper = function(x, distfun, hclustfun) {
  # Summary:
  #   This method is used to reduce code duplication in server.R.
  # Args: 
  #   x: A matrix of effect sizes with mouse model rows and brain region columns.
  #   distfun: A function used to compute distance, also defined in helpers.R.
  #   hclustfun: A function used to cluster the data (e.g. average, complete).
  # Returns:
  #   A heatmap.2 object of mouse model rows and brain region columns.
  
  # failed efforts at trying to replace the dendrogram
  # hr <- hclust(as.dist(1-cor(t(mousedatamat), method='pearson')), method='complete')
  # hc <- hclust(as.dist(1-cor(mousedatamat, method='pearson')), method='complete')
  # testheatmap <- heatmap.2(mousedatamat, distfun=jdfs)
  # rowInd = testheatmap$rowInd
  # colInd = testheatmap$colInd
  # mousedatamat = mousedatamat[rev(testheatmap$rowInd), testheatmap$colInd]        
  # mousedatamat[mousedatamat < -3] = -3
  # mousedatamat[mousedatamat > 3] = 3
  
  heatmap = heatmap.2(x=x,
                      # Rowv and Colv attempts at replacing dendrogram                             
                      # Rowv=as.dendrogram(hr),
                      # Colv=as.dendrogram(hc),
                      # Rowv=rowInd,
                      # Colv=colInd,
                      distfun=distfun,
                      hclustfun=hclustfun,
                      breaks=seq(-3, 3, by=0.4),
                      symbreaks=TRUE,
                      col=bluered,
                      # col=colorRampPalette(c("blue", "white", "red"))(n = 15),
                      margins=c(20,14),
                      trace='none', 
                      cexRow=1.5, 
                      cexCol=1.5, 
                      density.info='histogram', 
                      keysize=0.8,
                      key.title='Effect Size',
                      key.xlab='Relative to Wildtype',
                      symkey=TRUE)
}

Heatmap3Wrapper = function(x, distfun, hclustfun, rlab, clab) {
  # Summary:
  #   Used to reduce code duplication in server.R.
  # Args: 
  #   x: A matrix of effect sizes with mouse model rows and brain region columns.
  #   distfun: A function used to compute distance, also defined in helpers.R.
  #   hclustfun: A function used to cluster the data (e.g. average, complete).
  #   rlab: A matrix of color labels for each strain metadata column.
  #   clab: A matrix of color labels for each region metadata row.
  # Returns:
  #   A heatmap.3 object of mouse model rows and brain region columns.
      
  strainMetadataSubset = subset(strainMetadata, strainMetadata$Strain %in% rownames(x))
  if (!is.null(rlab)) {
    selectedStrainMetadata = as.data.frame(strainMetadataSubset[, rownames(rlab)], stringsAsFactors=FALSE)
  } else {
    selectedStrainMetadata = NULL
  }
  
  regionMetadataSubset = subset(regionMetadata, regionMetadata$Region %in% colnames(x))
  if (!is.null(clab)) {
    selectedRegionMetadata = as.data.frame(regionMetadataSubset[, colnames(clab)], stringsAsFactors=FALSE)
  } else {
    selectedRegionMetadata = NULL
  }
    
  legendColors = ExtendLegendColors(clab, rlab, selectedStrainMetadata, selectedRegionMetadata)
  legendLabels = ExtendLegendLabels(selectedStrainMetadata, selectedRegionMetadata)
  
  numLegendColumns = length(names(selectedStrainMetadata)) + length(names(selectedRegionMetadata)) 
  
  heatmap.3(x=x, 
            hclustfun=hclustfun, 
            distfun=distfun, 
            dendrogram='both', 
            margins=c(30,14), 
            ColSideColors=clab, 
            RowSideColors=rlab,
            col=bluered,
            breaks=seq(-3, 3, by=0.4),
            symbreaks=FALSE,
            key=TRUE,
            keysize=0.7,
            symkey=FALSE, 
            density.info='histogram', 
            trace='none', 
            cexRow=1.5, 
            cexCol=1.5,
            #           cex.key.xlab=0.5,
            #           cex.key.ylab=0.5,
            #           cex.key.main=0.5,
            ColSideColorsSize=2, 
            RowSideColorsSize=2,
            KeyValueName='Smaller        Larger',
            KeyTitle='Effect Size'
            )
  if (numLegendColumns != 0) {
    legend(
      x=0, 
      y=0,
      #          'bottomleft',
      legend=legendLabels, 
      fill=legendColors, 
      border=FALSE, 
      bty='n', 
      y.intersp=1, 
      cex=1,
      ncol=numLegendColumns,
      xpd=TRUE  # enables legend outside plot area
    )
  }
}


# Distance Functions --------------------------------------------------------------------
# Sort of suspicious that t() is always needed despite whether rows or columns are supplied.

Jdfs = function(x) {
  as.dist(1-cor(t(x)))  
}

JdfsAbsolute = function(x) {
  1 - as.dist(abs(cor(t(x))))
}

ManhattanDist = function(x) {
  dist(x, method='manhattan')
}

EuclideanDist = function(x) {
  dist(x, method='euclidean')
}


# Effect Size Functions ---------------------------------------------------

CohensD <- function(g1, g2) {
  ans = (mean(g2) - mean(g1)) / sd(g1)
  return(ans)
}

CalculateSingleStrainEffectSizes <- function(datadefs, volumeType, i, boot=F) {
  # Summary:
  #   Calculates effect sizes for a single strain between wildtype group and knockout group for each brain region.
  # Args:
  #   datadefs: A specification of the data files and the labels used to represent different strains.
  #   volumeType: One of 'relative' or 'absolute'.
  #   i: The i-th mouse strain to calculate effect sizes for.
  # Returns:
  #   A vector of effect sizes for a single mouse strain.
  
  # Get data from combined_vols data file for a single strain.
  if (volumeType == 'absolute') {
    combinedVolsData <- get(gsub(pattern='relative', replacement='absolute', datadefs$data[i]))
  } else {  # relative
    combinedVolsData <- get(datadefs$data[i])
  }
  
  # Gets wildtype and knockout indices to use to index the combined vols files. 
  gfData <- get(datadefs$gf[i])
  
  # Returns a factor (vector) of genotype labels for that strain.
  gterm <- get('Genotype', gfData)
  
  # Extract indices corresponding to wildtype and knockout.
  wtIndices <- grep(datadefs$G1[i], gterm)
  koIndices <- grep(datadefs$G2[i], gterm)
  
  # Create repeated samples.
  if (boot == T) {
    wtIndices <- sample(ind1, replace=T)
    koIndices <- sample(ind2, replace=T)
  }
  
  effectSizes <- vector(length=ncol(combinedVolsData))
  for (i in 1:ncol(combinedVolsData)) {
    effectSizes[i] <- CohensD(combinedVolsData[wtIndices, i],
                              combinedVolsData[koIndices, i])
  }
  names(effectSizes) <- colnames(combinedVolsData)
  
  return(effectSizes)
}


CalculateEffectSizes <- function(datadefs, volumeType, boot=F) {
  # Summary:
  #   Calculates effect size for every combination of mouse strain and brain region.
  # Args:
  #   datadefs: A specification of the data files and the labels used to represent different strains.
  #   volumeType: One of 'relative' or 'absolute'.
  # Returns:
  #   A matrix of effect sizes for every combination of mouse strain and brain region.
  
  neffects <- nrow(datadefs)
  
  effectSizeMatrix <- CalculateSingleStrainEffectSizes(datadefs, volumeType, 1, boot)
  for (i in 2:neffects) {
    effectSizeMatrix <- rbind(effectSizeMatrix, CalculateSingleStrainEffectSizes(datadefs, volumeType, i, boot))
  }
  
  rownames(effectSizeMatrix) <- datadefs$name
  colnames(effectSizeMatrix) <- GetColNames()  # could potentially return incorrect names if data files aren't labelled appropriately
  
  return(effectSizeMatrix)
}


IndividualData <- function(datadefs, volumeType) {
  # Summary:
  #   Creates a data table containing volume data for every brain region, for every individual mouse, in long format.
  # Args:
  #   datadefs: A specification of the data files and the labels used to represent different strains.
  #   volumeType: One of 'relative' or 'absolute'.
  # Returns:
  #   A data table containing volume data for every brain region, for every individual mouse, in long format.
  
  individualData = data.table(matrix(ncol = 2 + length(GetColNames())))
  individualData = individualData[-1, ]  # remove NAs from initialization
  setnames(individualData, c('name', 'genotype', GetColNames()))
  
  for (i in 1:nrow(datadefs)) {
    
    # Get data for a single strain as a data.table.
    row = datadefs[i, ]
    if (volumeType == 'absolute') {
      tempData = get(gsub(pattern='relative', replace='absolute', row$data))
    } else {  # volumeType == 'relative'
      tempData = get(row$data)
    }
    tempData = as.data.table(tempData)
     
    # Set proper column names.
    setnames(tempData, GetColNames())
    tempData$name = row$name
    tempData$genotype = NA
    
    # Set proper genotype labels for WT and KO.
    genotypeTerms = get(row$term, get(row$gf))
    wtIndices = grep(row$G1, genotypeTerms)
    koIndices = grep(row$G2, genotypeTerms)
    
#     tempData$genotype[wtIndices] = 'WT'
#     tempData$genotype[koIndices] = 'KO'
#     tempData = subset(tempData, (genotype == 'WT' | genotype == 'KO'))
    tempData$genotype[wtIndices] = row$G1
    tempData$genotype[koIndices] = row$G2
    tempData = subset(tempData, (genotype == row$G1 | genotype == row$G2))
    
    # Append data to total dataset.
    individualData = rbind(individualData, tempData)
  }
  
  # Make long format and set appropriate column names.
  individualData = reshape2:::melt(individualData, id=c('name','genotype'))
  setnames(individualData, c('name','genotype','region','volume'))
  individualData$genotype = as.factor(individualData$genotype)
  individualData$region = as.factor(individualData$region)
  individualData$name = as.factor(individualData$name)
  
  return(individualData)
}


# SummaryData = function(individualData) {
#   # Computes means and standard deviations for each strain * genotype * region
#   
#   summaryData = aggregate( .~name:genotype:region, individualData, FUN = function(x) c(mn=mean(x), stdev=sd(x)))
#   
#   # 'volume' is a matrix inside of a data frame.
#   # Need to extract the mean and sd data inside of the 'volume' matrix.
#   summaryData$mean = summaryData$volume[,1]
#   summaryData$sd = summaryData$volume[,2]
#   summaryData$volume = NULL
#   
#   return(summaryData)
# }


# Bootstrapping and Clustering Functions ----------------------------------


bootalleffects <- function(datadefs, n=1000) {
  # Get effect sizes for each genotype and structure with repeated sampling with
  # replacement.  This function takes > 1 minute to run in its current implementation.
  
  a = array(0, dim=c(n, nrow(datadefs), 62))
  
  for (i in 1:n) {
    a[i,,] <- alleffects(datadefs, T)
  }
  
  return(a)
}


bootallconfints <-function(bootarray, datadefs, hierarchy=FALSE) {
  # Takes the output of bootalleffects and returns an array of confidence
  # intervals and medians.
  
  # compute the confidence intervals by combining apply with the quantile func
  s <- apply(bootarray, c(2,3), quantile, c(0.025, 0.5, 0.975))
  # get all the effects - but just for column and row names purposes
  e <- alleffects(datadefs)
  # melt the data
  m1 <- melt(s[1,,])
  m2 <- melt(s[2,,])
  m3 <- melt(s[3,,])
  m1$c05 <- m1$value
  m1$c95 <- m3$value
  m1$median <- m2$value
  # assign proper names
  m1$X1 <- factor(m1$X1, labels=rownames(e))
  m1$X2 <- factor(m1$X2, labels=colnames(e))

  m1$group <- datadefs$group[as.integer(m1$X1)]
  
  if (hierarchy != FALSE) {
    m1$hierarchy <- hierarchy$hierarchy[as.integer(m1$X2)]
    m1$X2 <- factor(m1$X2, levels=hierarchy$structures[order(hierarchy$hierarchy)])
  }
  
  return(m1)
}


bootalldist <- function(bootarray, distfun) {
  # Compute the distance function on bootstrapped effects.
  
  ngroups <- dim(bootarray)[2]
  nboot <- dim(bootarray)[1]
  out <- array(0, dim=c(nboot, ngroups, ngroups))
  
  for (i in 1:nboot) {
    out[i,,] <- as.matrix(distfun(bootarray[i,,]))
  }
  
  return(out)
}


bootalldistregion <- function(bootarray, distfun) {
  ngroups <- dim(bootarray)[3]
  nboot <- dim(bootarray)[1]
  out <- array(0, dim=c(nboot, ngroups, ngroups))
  for (i in 1:nboot) {
    out[i,,] <- as.matrix(distfun(bootarray[i,,]))
  }
  return(out)
}


bootdistcint <- function(bootdistarray, datadefs) {
  s <- apply(bootdistarray, c(2,3), quantile, c(0.05, 0.5, 0.9))
  m1 <- melt(s[1,,])
  m2 <- melt(s[2,,])
  m3 <- melt(s[3,,])
  m1$c05 <- m1$value
  m1$c95 <- m3$value
  m1$median <- m2$value
  m1$X1 <- factor(m1$X1, labels=datadefs$name)
  m1$X2 <- factor(m1$X2, labels=datadefs$name)
  return(m1)
}


clustmember <- function(bootdistarray, cutsize=2, datadefs=datadefs) {
  # How often are cluster memberships shared?
  
  out <- array(0, dim=dim(bootdistarray))
  
  for (i in 1:dim(bootdistarray)[1]) {
    
    hc <- hclust(as.dist(bootdistarray[i,,]))
    cl <- cutree(hc, cutsize)
    clm <- matrix(nrow=length(cl), ncol=length(cl))
    
    for (j in 1:length(cl)) {
      clm[j,] <- as.integer(cl == cl[j])
    }
    
    out[i,,] <- clm
  }
  
  return(out)
}


plotconfints <- function(cints, ymin=-4, ymax=4) {
  # Plot the confidence intervals.
  
  p1 <- ggplot(data=cints, mapping=aes(x=X2, y=median, ymin=c05, ymax=c95,
                          colour=abs(median)))
  p1 <- p1 + geom_pointrange()
  p1 <- p1 + geom_hline(y=0)
  p1 <- p1 + scale_colour_continuous(breaks=c(0,0.5,1,3), low="dark grey",
                                     high="red")
  p1 <- p1 + coord_cartesian(ylim=c(ymin,ymax))
  p1 <- p1 + scale_y_continuous(breaks=seq(ymin,ymax, diff(c(ymin,ymax))/4))
  if (cints$hierarchy) {
    p1 <- p1 + facet_grid(X1 ~ hierarchy, space="free", scales="free_x")
  }
  else {
    p1 <- p1 + facet_grid(X1~.)
  }
  p1 <- p1 + theme_bw(8)
  p1 <- p1 + opts(axis.text.x = theme_text(angle=45, size=8, hjust=1),
                  legend.position="none")
  p1 <- p1 + ylab("Effect size") + xlab("Structure")
  return(p1)
}


# Proper Column Names ----------------------------------------------------------


GetColNames <- function() {
  # Summary:
  #   Returns properly formatted region names in the same order as those found in the combined_vols data files.
  #   *IMPORTANT* All columns for the combined_vols files must be in the same order!  TODO - add a quality control check for this.

  goodColNames = c('Amygdala',
                   'Anterior Commissure - Anterior',
                   'Anterior Commissure - Posterior',
                   'Arbor Vita of Cerebellum',
                   'Basal Forebrain',
                   'Bed Nucleus of Stria Terminalis',
                   'Cerebellar Cortex',
                   'Cerebellar Peduncle - Inferior',
                   'Cerebellar Peduncle - Middle',
                   'Cerebellar Peduncle - Superior',
                   'Cerebral Aqueduct',
                   'Entorhinal Cortex',
                   'Frontal Lobe',
                   'Occipital Lobe',
                   'Parieto-Temporal Lobe',
                   'Cerebral Peduncle',
                   'Inferior Colliculus',
                   'Superior Colliculus',
                   'Corpus Callosum',
                   'Cortico-Spinal Tract',
                   'Cuneate Nucleus',
                   'Dentate Gyrus',
                   'Cranial Nerve 7',
                   'Fasciculus Retroflexus',
                   'Fimbria',
                   'Fornix',
                   'Fourth Ventricle',
                   'Fundus of Striatum',
                   'Globus Pallidus',
                   'Habenular Commissure',
                   'Hippocampus',
                   'Hypothalamus',
                   'Inferior Olivary Complex',
                   'Internal Capsule',
                   'Interpeduncular Nucleus',
                   'Lateral Olfactory Tract',
                   'Lateral Septum',
                   'Lateral Ventricle',
                   'Mammillary Bodies',
                   'Mammilothalamic Tract',
                   'Medial Longitudinal Fasciculus',
                   'Medial Septum',
                   'Medulla',
                   'Midbrain',
                   'Nucleus Accumbens',
                   'Olfactory Bulbs',
                   'Olfactory Tubercle',
                   'Optic Tract',
                   'Periaqueductal Grey',
                   'Pons',
                   'Pontine Nucleus',
                   'Posterior Commissure',
                   'Pre-Para Subiculum',
                   'Stratum Granulosum',
                   'Stria Medullaris',
                   'Stria Terminalis',
                   'Striatum',
                   'Rhinocele',
                   'Superior Olivary Complex',
                   'Thalamus',
                   'Third Ventricle',
                   'Ventral Tegmental Decussation')
  
  return(goodColNames)
}
