# Rowv=FALSE and Colv=FALSE prevent dendrogram rearrangement

mousedatamat

# paper_strain_order = c("En2", "FMR1vB6 (-/Y)", "SHANK3 (-/+)", "SHANK3 (-/-)",
#                        "NRXN1a (-/-)", "NRXN1a (-/+)", "FMR1vFVB (-/Y)", "BTBRvFVB", 
#                        "BTBRvB6", "NL3 R451C", "SERT Ala56 KI 129", "Gtf2i (dp/dp)",
#                        "15q11-13", "AndR 48Q", "ITGB3 (-/-)", "AndR 12Q",
#                        "Mecp2 p60 (-/Y)", "BALBCvB6", "Turner XOvXX", "CNTNAP2 (-/-)",
#                        "SERT KO (-/-)", "SERT Ala56 KI", "16p11.2 (df/dp)", "16p11.2 (dp/+)",
#                        "16p11.2 (df/+)", "Gtf2i (+/-)")

# Had to rename all of these labels to match those used in the paper.  Watch out for case sensitivity.
paper_strain_order = c("En2 (-/-)", "FMR1 (-/Y) (B6)", "SHANK3 (-/+)", "SHANK3 (-/-)",
                       "NRXN1a (-/-)", "NRXN1a (-/+)", "FMR1 (-/y) (FVB)", "BTBR (FVB)", 
                       "BTBR (B6)", "NL3 R451C", "SLC6A4 Ala56 (129)", "GTF2i (dp/dp)",
                       "15q11-13 (patDp/+)", "AndR (48Q)", "ITGB3 (-/-)", "AndR (12Q)",
                       "Mecp2 (-/y)", "BALB/CJ (B6)", "XO", "CNTNAP2 (-/-)",
                       "SLC6A4 KO (-/-)", "SLC6A4 Ala56 (B6)", "16p11.2 (df/dp)", "16p11.2 (dp/+)",
                       "16p11.2 (df/+)", "GTF2i (+/-)")
mousedatamatnew = mousedatamat[paper_strain_order, ]

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
mousedatamatnewnew = mousedatamatnew[, paper_region_order]

heatmap.2(x=mousedatamatnewnew, 
          Rowv=FALSE, 
          Colv=FALSE, 
          col=bluered,
          breaks=seq(-3, 3, by=0.4),
          trace='none')

mousedatamedian = bootalleffects(datadefs)
mousedatamediansummary = apply(mousedatamedian, c(2,3), median)

heatmap.2(x=as.matrix(modified_jacobs_data), 
          distfun=jdfs, 
          col=bluered, 
          trace='none', 
          hclustfun=function(x) {hclust(x, method='complete')},
          margin=c(12,14))

