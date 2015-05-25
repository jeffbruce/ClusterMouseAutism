
# Can't reproduce same figure as in paper.
# Jason wants to be able to view the original paper figure.
# Tried clustering on -3 and +3 limited values, original values, and median 
# effect size values.
# Now need to ensure that I'm using the same data as the paper because
# these results are discouraging.

# Rowv=FALSE and Colv=FALSE prevent dendrogram rearrangement

mousedatamat

paper_strain_order = c("En2", "FMR1vB6 (-/Y)", "SHANK3 (-/+)", "SHANK3 (-/-)",
                       "NRXN1a (-/-)", "NRXN1a (-/+)", "FMR1vFVB (-/Y)", "BTBRvFVB", 
                       "BTBRvB6", "NL3 R451C", "SERT Ala56 KI 129", "Gtf2i (dp/dp)",
                       "15q11-13", "AndR 48Q", "ITGB3 (-/-)", "AndR 12Q",
                       "Mecp2 p60 (-/Y)", "BALBCvB6", "Turner XOvXX", "CNTNAP2 (-/-)",
                       "SERT KO (-/-)", "SERT Ala56 KI", "16p11.2 (df/dp)", "16p11.2 (dp/+)",
                       "16p11.2 (df/+)", "Gtf2i (+/-)")
mousedatamatnew = mousedatamat[paper_strain_order,]

paper_region_order = c("Stratum Granulosum", "Dentate Gyrus", "Globus Pallidus", "Stria Medullaris",
                       "Corpus Callosum", "Thalamus", "Stria Terminalis", "Nucleus Accumbens",
                       "Mammilothalamic Tract", "Lateral Ventricle", "Fimbria", "Frontal Lobe",
                       "Parieto-Temporal Lobe", "Entorhinal Cortex", "Occipital Lobe", "Striatum",
                       "Internal Capsule", "Cerebral Peduncle", "Pre-Para Subiculum", "Third Ventricle",
                       "Posterior Commissure", "Rhinocele", "Superior Colliculus", "Olfactory Bulbs",
                       "Amygdala", "Bed Nucleus of Stria Terminalis", "Periaqueductal Grey", "Lateral Septum",
                       "Anterior Commissure - Anterior", "Hypothalamus", "Optic Tract", "Fasciculus Retroflexus",
                       "Fornix", "Ventral Tegmental Decussation", "Hippocampus", "Lateral Olfactory Tract",
                       "Interpeduncular Nucleus", "Habenular Commissure", "Inferior Colliculus", "Cerebellar Peduncle - Middle",
                       "Arbor Vita of Cerebellum", "Cerebellar Cortex", "Cerebellar Peduncle - Inferior", "Cuneate Nucleus",
                       "Cerebral Aqueduct", "Cerebellar Peduncle - Superior", "Midbrain", "Basal Forebrain",
                       "Medial Septum", "Fundus of Striatum", "Anterior Commissure - Posterior", "Medial Longitudinal Fasciculus",
                       "Cortico-Spinal Tract", "Inferior Olivary Complex", "Mammillary Bodies", "Superior Olivary Complex",
                       "Pontine Nucleus", "Medulla", "Fourth Ventricle", "Olfactory Tubercle",
                       "Pons", "Cranial Nerve 7")
mousedatamatnewnew = mousedatamatnew[,paper_region_order]

heatmap.2(x=mousedatamatnewnew, Rowv=FALSE, Colv=FALSE, col=bluered)

mousedatamedian = bootalleffects(datadefs)
mousedatamediansummary = apply(mousedatamedian, c(2,3), median)

heatmap.2(x=as.matrix(modified_jacobs_data), 
          distfun=jdfs, 
          col=bluered, 
          trace='none', 
          hclustfun=function(x) {hclust(x, method='complete')},
          margin=c(12,14))

