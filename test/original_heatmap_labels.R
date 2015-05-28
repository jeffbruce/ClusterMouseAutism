# TEST CASES

# Summary: Come up with test cases to test the correctness of the app.
#          Arrange axis labels manually in the same order as that found in Figure 3 in the
#          paper so that the app heatmap can be compared side by side with the paper heatmap.

# Notes:
# - the labels in the paper actually differ from the labels in the app, so perhaps the datadefs
#   labels ought to change

# Left to Right
original_region_labels <- c('Stratum Granulosum',
                            'Dentate Gyrus',
                            'Globus Pallidus',
                            'Stria Medullaris',
                            'Corpus Callosum',
                            'Thalamus',
                            'Stria Terminalis',
                            'Nucleus Accumbens',
                            'Mammilothalamic Tract',
                            'Lateral Ventricle',
                            'Fimbria',
                            'Frontal Lobe',
                            'Parieto-Temporal Lobe',
                            'Entorhinal Cortex',
                            'Occipital Lobe',
                            'Striatum',
                            'Internal Capsule',
                            'Cerebral Peduncle',
                            'Pre-Para Subiculum',
                            'Third Ventricle',
                            'Posterior Commissure',
                            'Rhinocele',
                            'Superior Colliculus',
                            'Olfactory Bulbs',
                            'Amygdala',
                            'Bed Nucleus of Stria Terminalis',  # called "Bed Nucleus" in paper
                            'Periaqueductal Grey',
                            'Lateral Septum',
                            'Anterior Commissure - Anterior',
                            'Hypothalamus',
                            'Optic Tract',
                            'Fasciculus Retroflexus',
                            'Fornix',
                            'Ventral Tegmental Decussation',
                            'Hippocampus',
                            'Lateral Olfactory Tract',
                            'Interpeduncular Nucleus',  # typo in paper: "Interpendunclar"
                            'Habenular Commissure',
                            'Inferior Colliculus',
                            'Cerebellar Peduncle - Middle',
                            'Arbor Vita of Cerebellum',
                            'Cerebellar Cortex',
                            'Cerebellar Peduncle - Inferior',
                            'Cuneate Nucleus',
                            'Cerebral Aqueduct',
                            'Cerebellar Peduncle - Superior',
                            'Midbrain',
                            'Basal Forebrain',
                            'Medial Septum',
                            'Fundus of Striatum',
                            'Anterior Commissure - Posterior',
                            'Medial Longitudinal Fasciculus',
                            'Cortico-Spinal Tract',
                            'Inferior Olivary Complex',
                            'Mammillary Bodies',
                            'Superior Olivary Complex',
                            'Pontine Nucleus',
                            'Medulla',
                            'Fourth Ventricle',
                            'Olfactory Tubercle',
                            'Pons',
                            'Cranial Nerve 7')

# Top to Bottom
original_strain_labels <- c('En2 (-/-)',
                            'FMR1 (-/Y) (B6)',
                            'SHANK3 (-/+)',
                            'SHANK3 (-/-)',
                            'NRXN1a (-/-)',  # uses alpha character in paper
                            'NRXN1a (-/+)',  # uses alpha character in paper
                            'FMR1 (-/y) (FVB)',
                            'BTBR (FVB)',
                            'BTBR (B6)',
                            'NL3 R451C',
                            'SLC6A4 Ala56 (129)',
                            'GTF2i (dp/dp)',
                            '15q11-13 (patDp/+)',
                            'AndR (48Q)',
                            'ITGB3 (-/-)',  # uses beta character in paper
                            'AndR (12Q)',
                            'Mecp2 (-/y)',
                            'BALB/CJ (B6)',
                            'XO',
                            'CNTNAP2 (-/-)',
                            'SLC6A4 KO (-/-)',
                            'SLC6A4 Ala56 (B6)',
                            '16p11.2 (df/dp)',
                            '16p11.2 (dp/+)',
                            '16p11.2 (df/+)',
                            'GTF2i (+/-)')

mousedatanew = mousedata
mousedatanew[mousedatanew < -3] = -3
mousedatanew[mousedatanew > 3] = 3
mousedatanew = mousedatanew[original_strain_labels, ]
mousedatanew = mousedatanew[, original_region_labels]

heatmap = heatmap.2(x=mousedatanew,
                    dendrogram = 'none', 
                    Rowv = FALSE, 
                    Colv = FALSE,
                    #Rowv=as.dendrogram(hr),
                    #Colv=as.dendrogram(hc),
                    distfun=jdfs,
                    #hclustfun=hclust.avg,
                    col=bluered, 
                    margins=c(20,14),
                    trace='none', 
                    cexRow=1.0, 
                    cexCol=1.0, 
                    density.info='histogram', 
                    keysize=0.8,
                    key.title='Effect Size',
                    key.xlab='Relative to Wildtype',
                    symkey=TRUE, 
                    symbreaks=TRUE)