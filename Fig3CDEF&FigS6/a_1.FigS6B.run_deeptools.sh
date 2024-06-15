#!/bin/bash
#Author: LinLin

source /mnt/d/software/miniconda/bin/activate
conda activate ChIP_downstream


multiBigwigSummary bins -b Control.bw cGAS_R1.bw cGAS_R2.bw -o about_rep.npz -p 28 --outRawCounts about_rep.tab
plotCorrelation -in about_rep.npz --corMethod spearman --skipZeros --whatToPlot heatmap --colorMap Reds --plotNumbers -o 4_3.heatmap_SpearmanCorr_about_rep.svg --outFileCorMatrix SpearmanCorr_about_rep.tab --removeOutliers
