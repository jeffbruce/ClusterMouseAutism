datadefs <- rbind(c(name="FMR1vB6 (-/Y)", 
                    gf="gf_FMR1_relative", 
                    data="Combined_vols_FMR1_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="FXS"),
                  c(name="FMR1vFVB (-/Y)", 
                    gf="gf_FMR1_FVB_relative", 
                    data="Combined_vols_FMR1_FVB_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="FXS"),
                  c(name="Mecp2 p60 (-/Y)", 
                    gf="gf_Mecp2_p60_relative", 
                    data="Combined_vols_Mecp2_p60_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="Rett"),
                  c(name="NL3 R451C", 
                    gf="gf_NL3_relative", 
                    data="Combined_vols_NL3_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="NLGN"),
                  c(name="En2", 
                    gf="gf_En2_relative", 
                    data="Combined_vols_En2_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="En2"),
                  c(name="16p11.2 (dp/+)", 
                    gf="gf_16p11_relative", 
                    data="Combined_vols_16p11_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="dp", 
                    group="16p11"),
                  c(name="16p11.2 (df/dp)", 
                    gf="gf_16p11_relative", 
                    data="Combined_vols_16p11_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="dfdp", 
                    group="16p11"),
                  c(name="16p11.2 (df/+)", 
                    gf="gf_16p11_relative", 
                    data="Combined_vols_16p11_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="df", 
                    group="16p11"),
                  c(name="15q11-13", 
                    gf="gf_15q_relative", 
                    data="Combined_vols_15q_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="DEL", 
                    group="15q"),
                  c(name="CNTNAP2 (-/-)", 
                    gf="gf_CNTNAP2_relative", 
                    data="Combined_vols_CNTNAP2_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="22q11"),
                  c(name="BTBRvB6", 
                    gf="gf_BTBR_relative", 
                    data="Combined_vols_BTBR_relative",
                    term="Genotype", 
                    G1="B6", 
                    G2="BTBR", 
                    group="BTBR"),
                  c(name="BTBRvFVB", 
                    gf="gf_BTBR_relative", 
                    data="Combined_vols_BTBR_relative",
                    term="Genotype", 
                    G1="FVB", 
                    G2="BTBR", 
                    group="BTBR"),
                  c(name="NRXN1a (-/-)", 
                    gf="gf_NRXN1a_relative", 
                    data="Combined_vols_NRXN1a_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="NRXN"),
                  c(name="NRXN1a (-/+)", 
                    gf="gf_NRXN1a_relative", 
                    data="Combined_vols_NRXN1a_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="Het", 
                    group="NRXN"),
                  c(name="SERT Ala56 KI", 
                    gf="gf_SERT_KI_Male_relative", 
                    data="Combined_vols_SERT_KI_Male_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KI", 
                    group="SERT"),
                  c(name="SERT Ala56 KI 129", 
                    gf="gf_SERT_KI_129_relative_Male", 
                    data="Combined_vols_SERT_KI_129_Male_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KI", 
                    group="SERT"),
                  c(name="SERT KO (-/-)", 
                    gf="gf_SERT_KO_Male_relative", 
                    data="Combined_vols_SERT_KO_Male_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="SERT"),
                  c(name="SHANK3 (-/-)", 
                    gf="gf_SHANK3_relative", 
                    data="Combined_vols_SHANK3_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="SHANK3"),
                  c(name="SHANK3 (-/+)", 
                    gf="gf_SHANK3_relative", 
                    data="Combined_vols_SHANK3_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="Het", 
                    group="SHANK3"),
                  c(name="AndR 12Q", 
                    gf="gf_AndR_relative", 
                    data="Combined_vols_AndR_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="12Q", 
                    group="AndR"),
                  c(name="AndR 48Q", 
                    gf="gf_AndR_relative", 
                    data="Combined_vols_AndR_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="48Q", 
                    group="AndR"),
                  c(name="BALBCvB6", 
                    gf="gf_BALBC_relative", 
                    data="Combined_vols_BALBC_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="BALBC", 
                    group="BALBC"),
                  c(name="Turner XOvXX", 
                    gf="gf_Turner_relative", 
                    data="Combined_vols_Turner_relative",
                    term="Genotype", 
                    G1="XX", 
                    G2="XO", 
                    group="Turner"),
                  c(name="GTF2i (dp/dp)", 
                    gf="gf_GTF2i_Male_relative", 
                    data="Combined_vols_GTF2i_Male_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="XS", 
                    group="GTF2i"),
                  c(name="GTF2i (+/-)", 
                    gf="gf_GTF2i_Male_relative", 
                    data="Combined_vols_GTF2i_Male_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="YT", 
                    group="GTF2i"),
                  c(name="ITGB3 (-/-)", 
                    gf="gf_ITGB3_relative", 
                    data="Combined_vols_ITGB3_relative",
                    term="Genotype", 
                    G1="WT", 
                    G2="KO", 
                    group="ITGB3"))

datadefs <- as.data.frame(datadefs, stringsAsFactors=FALSE)
# Remove the GTF2i entries in datadefs; there are no corresponding data files.
datadefs = datadefs[c(-24,-25),]


# jdfs --------------------------------------------------------------------
# Distance function used for clustering.  Basically causes values to range between 0
# (perfect positive correlation) and 2 (perfect negative correlation).
jdfs = function(x) 
{
  as.dist(1-cor(t(x)))  
}

jdfs_absolute = function(x) {
  abs(jdfs(x))
}

# cohensd -----------------------------------------------------------------
# Effect size.
cohensd <- function(g1, g2) 
{
  return( (mean(g2) - mean(g1)) / sd(g1) )
}


# structureeffects --------------------------------------------------------
# Calculates the effect sizes for the first group (ind1) and the second group (ind2)
# for each brain region.
structureeffects <- function(ind1, ind2, datatable) 
{
  
  effects <- vector(length=ncol(datatable))
  for (i in 1:ncol(datatable)) {
    effects[i] <- cohensd(datatable[ind1, i],
                          datatable[ind2, i])
  }
  names(effects) <- colnames(datatable)
  return(effects)
}


# structureeffectsfromdatadefs --------------------------------------------
# Calls structureeffects on either a bootstrapped or real sample.
structureeffectsfromdatadefs <- function(datadefs, i, boot=F) 
{
  
  # Get data and appropriate labels from Combined_vols and gf files.
  dt <- get(datadefs$data[i])
  gterm <- get(datadefs$term[i], get(datadefs$gf[i]))
  
  # Extract the indices corresponding to WT and KO.
  ind1 <- grep(datadefs$G1[i], gterm)
  ind2 <- grep(datadefs$G2[i], gterm)
  
  # Create repeated samples.
  if (boot == T) {
    ind1 <- sample(ind1, replace=T)
    ind2 <- sample(ind2, replace=T)
  }
  
  return(structureeffects(ind1, ind2, dt))
}


# IndividualData -------------------------------------------------------------
# Creates a data table containing volume data for every brain region, for
# every individual mouse, in long format.
IndividualData <- function(datadefs)
{
  individualData = data.table(matrix(ncol = 2 + length(GetColNames())))
  individualData = individualData[-1, ]  # remove NAs from initialization
  setnames(individualData, c('name', 'genotype', GetColNames()))
  
  for (i in 1:nrow(datadefs))
  {
    # Get data associated with a row of the data frame
    row = datadefs[i,]
    tempData = get(row$data)
    tempData = as.data.table(tempData)
     
    # Set proper column names
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
    
    # Append data to total dataset
    individualData = rbind(individualData, tempData)
  }
  
  # Make long format and set appropriate column names
  individualData = reshape2:::melt(individualData, id=c('name','genotype'))
  setnames(individualData, c('name','genotype','region','volume'))
  individualData$genotype = as.factor(individualData$genotype)
  individualData$region = as.factor(individualData$region)
  individualData$name = as.factor(individualData$name)
  
  return(individualData)
}


# SummaryData -------------------------------------------------------------
# Computes means and standard deviations for each strain * genotype * region
SummaryData = function(individualData)
{
  summaryData = aggregate( .~name:genotype:region, individualData, FUN = function(x) c(mn=mean(x), stdev=sd(x)))
  
  # 'volume' is a matrix inside of a data frame.
  # Need to extract the mean and sd data inside of the 'volume' matrix.
  summaryData$mean = summaryData$volume[,1]
  summaryData$sd = summaryData$volume[,2]
  summaryData$volume = NULL
  
  return(summaryData)
}

  
# alleffects --------------------------------------------------------------
# Loops through all mouse models and computes the effect size for each.
alleffects <- function(datadefs, boot=F) 
{
  
  neffects <- nrow(datadefs)
  
  out <- structureeffectsfromdatadefs(datadefs, 1, boot)
  for (i in 2:neffects) {
    out <- rbind(out, structureeffectsfromdatadefs(datadefs, i, boot))
  }
  
  rownames(out) <- datadefs$name
  
  # comment out this line if it's returning incorrect column names 
  colnames(out) <- GetColNames()
  
  return(out)
}


# bootalleffects ----------------------------------------------------------
# Get effect sizes for each genotype and structure with repeated sampling with
# replacement.  This function takes > 1 minute to run in its current implementation.
bootalleffects <- function(datadefs, n=1000) 
{
  
  a = array(0, dim=c(n, nrow(datadefs), 62))
  
  for (i in 1:n) {
    a[i,,] <- alleffects(datadefs, T)
  }
  
  return(a)
}


# bootallconfints ---------------------------------------------------------
# Takes the output of bootalleffects and returns an array of confidence
# intervals and medians.
bootallconfints <-function(bootarray, datadefs, hierarchy=FALSE) 
{
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


# bootalldist -------------------------------------------------------------
# Compute the distance function on bootstrapped effects.
bootalldist <- function(bootarray, distfun) 
{
  
  ngroups <- dim(bootarray)[2]
  nboot <- dim(bootarray)[1]
  out <- array(0, dim=c(nboot, ngroups, ngroups))
  
  for (i in 1:nboot) {
    out[i,,] <- as.matrix(distfun(bootarray[i,,]))
  }
  
  return(out)
}


# bootalldistregion -------------------------------------------------------
bootalldistregion<- function(bootarray, distfun) 
{
  ngroups <- dim(bootarray)[3]
  nboot <- dim(bootarray)[1]
  out <- array(0, dim=c(nboot, ngroups, ngroups))
  for (i in 1:nboot) {
    out[i,,] <- as.matrix(distfun(bootarray[i,,]))
  }
  return(out)
}


# bootdistcint ------------------------------------------------------------
bootdistcint <- function(bootdistarray, datadefs) 
{
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


# clustmember -------------------------------------------------------------
# How often are cluster memberships shared?
clustmember <- function(bootdistarray, cutsize=2, datadefs=datadefs) 
{
  
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


# plotconfints ------------------------------------------------------------
# Plot the confidence intervals.
plotconfints <- function(cints, ymin=-4, ymax=4) 
{
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


# GetColNames ----------------------------------------------------------
# called by alleffects when creating the effect size data
# this function will need to be modified when a new atlas is used
# or when data files with differently ordered columns are used
GetColNames <- function() 
{
  
  # manually supply brain region labels
  goodColNames = c('Amygdala',
                   'Anterior Commissure - Anterior',
                   'Anterior Commissure - Posterior',
                   'Arbor Vita of Cerebellum',
                   'Basal Forebrain',
                   'Stria Terminalis',
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
                   'Ventral Tegmental Decussation'
  )
  return(goodColNames)
}
