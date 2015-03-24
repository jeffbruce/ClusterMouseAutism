setwd("/micehome/jbruce/Documents/Code/R/ShinyMouseCluster")
source('loaddata.R')
source('helpers.R')

# Compute effect sizes for all KO models vs. WT models.  Scale extreme effect sizes.
Effects_relative_13Jun_MM <- alleffects(datadefs)
Effects_relative_13Jun_MM_new <- Effects_relative_13Jun_MM
Effects_relative_13Jun_MM[Effects_relative_13Jun_MM < -3] <- -3
Effects_relative_13Jun_MM[Effects_relative_13Jun_MM > 3] <- 3

# Basic heatmap of the models with the brain regions.
library(gplots)
heatmap.2(as.matrix(Effects_relative_13Jun_MM), distfun=jdfs, col=bluered, margins=c(8,14), trace="none", density.info="histogram", keysize=1.2, symkey=TRUE, symbreaks=TRUE)

# Bootstrapping.  bootalleffects(datadefs) takes a really long time (> 1 minute).  Not necessary to run this
# for the Shiny app.
Effects_relative_13Jun_MM_new_boot <- bootalleffects(datadefs)
Effects_relative_13Jun_MM_new_boot_dist <- bootalldist(Effects_relative_13Jun_MM_new_boot, jdfs)
Effects_relative_13Jun_MM_new_boot_dist_apply <- apply(clustmember(Effects_relative_13Jun_MM_new_boot_dist,5),c(2,3),mean)
rownames(Effects_relative_13Jun_MM_new_boot_dist_apply) <- datadefs$name
colnames(Effects_relative_13Jun_MM_new_boot_dist_apply) <- datadefs$name

# Basically doing bootstrapping on both the mean and median.
library(pvclust)
pv_MM <- pvclust(t(Effects_relative_13Jun_MM_new))
plot(pv_MM)
pvrect(pv_MM,alpha=0.9)
pvrect(pv_MM,alpha=0.85)
Effects_relative_13Jun_MM_new_boot_MEDIAN <- apply(Effects_relative_13Jun_MM_new_boot, c(2,3), median)
Effects_relative_13Jun_MM_new_boot_MEDIAN_named <- data.frame(Effects_relative_13Jun_MM_new_boot_MEDIAN)
rownames(Effects_relative_13Jun_MM_new_boot_MEDIAN_named) <- datadefs$name
colnames(Effects_relative_13Jun_MM_new_boot_MEDIAN_named) <- colnames(Effects_relative_13Jun_new)
colnames(Effects_relative_13Jun_MM_new_boot_MEDIAN_named) <- colnames(Effects_relative_13Jun_new)
Effects_relative_13Jun_MM_new_boot_MEDIAN_named_new <- Effects_relative_13Jun_MM_new_boot_MEDIAN_named
Effects_relative_13Jun_MM_new_boot_MEDIAN_named_new[Effects_relative_13Jun_MM_new_boot_MEDIAN_named_new < -3] <- -3
Effects_relative_13Jun_MM_new_boot_MEDIAN_named_new[Effects_relative_13Jun_MM_new_boot_MEDIAN_named_new > 3] <- 3
heatmap.2(as.matrix(Effects_relative_13Jun_MM_new_boot_MEDIAN_named_new), distfun=jdfs, col=bluered, margins=c(8,14), trace="none", density.info="histogram", keysize=1.2, symkey=TRUE, symbreaks=TRUE)
heatmap.2(as.matrix(Effects_relative_13Jun_MM_new_boot_MEDIAN_named_new), distfun=jdfs_absolute, col=bluered, margins=c(8,14), trace="none", density.info="histogram", keysize=1.2, symkey=TRUE, symbreaks=TRUE)

Effects_relative_13Jun_MM_new_boot_MEAN <- apply(Effects_relative_13Jun_MM_new_boot, c(2,3), mean)
Effects_relative_13Jun_MM_new_boot_MEAN_named <- data.frame(Effects_relative_13Jun_MM_new_boot_MEAN)
rownames(Effects_relative_13Jun_MM_new_boot_MEAN_named) <- datadefs$name
colnames(Effects_relative_13Jun_MM_new_boot_MEAN_named) <- colnames(Effects_relative_13Jun_new)
Effects_relative_13Jun_MM_new_boot_MEAN_named_new <- Effects_relative_13Jun_MM_new_boot_MEAN_named
Effects_relative_13Jun_MM_new_boot_MEAN_named_new[Effects_relative_13Jun_MM_new_boot_MEAN_named_new < -3] <- -3
Effects_relative_13Jun_MM_new_boot_MEAN_named_new[Effects_relative_13Jun_MM_new_boot_MEAN_named_new > 3] <- 3
heatmap.2(as.matrix(Effects_relative_13Jun_MM_new_boot_MEAN_named_new), distfun=jdfs, col=bluered, margins=c(8,14), trace="none", density.info="histogram", keysize=1.2, symkey=TRUE, symbreaks=TRUE)
heatmap.2(as.matrix(Effects_relative_13Jun_MM_new_boot_MEAN_named_new), distfun=jdfs_absolute, col=bluered, margins=c(8,14), trace="none", density.info="histogram", keysize=1.2, symkey=TRUE, symbreaks=TRUE)

