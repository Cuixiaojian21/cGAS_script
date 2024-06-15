#!/bin/bash
#Author: LinLin
source /mnt/d/software/miniconda/bin/activate
conda activate ChIP_downstream


#~ computeMatrix reference-point --skipZeros -p 20 \
#~ --referencePoint TSS \
#~ -b 1000 -a 1000 \
#~ -R 0_3_hg19.Gene_body.bed \
#~ -S 4_1_RPGC.2_1_sorted.cgas_control.bw 4_1_RPGC.2_2_sorted.cgas_treat_R1.bw 4_1_RPGC.2_3_sorted.cgas_treat_R2.bw \
#~ --samplesLabel control "cGAS_Cut&Tag_R1" "cGAS_Cut&Tag_R2" \
#~ -o matrix1_0_3_hg19.Gene_body_TSS.gz


plotHeatmap -m matrix1_0_3_hg19.Gene_body_TSS.gz --colorMap coolwarm \
-out Heatmap_0_3_hg19.Gene_body_TSS.pdf

#~ computeMatrix reference-point --skipZeros -p 20 \
#~ --referencePoint TSS \
#~ -b 1000 -a 1000 \
#~ -R 2_1_necssary_gene.bed 2_2_unnecessary_gene.bed \
#~ -S 4_1_RPGC.2_3_sorted.cgas_treat_R2.bw \
#~ -o matrix2_two_gene_list.gz

#~ plotProfile -m matrix2_two_gene_list.gz \
#~ -out two_gene_list.pdf
