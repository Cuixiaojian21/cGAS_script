library(this.path)
setwd(this.path::this.dir())
library(ChIPseeker)
library(clusterProfiler)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(org.Hs.eg.db)
library(ggplot2)
library(stringr)
library(ggpubr)
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

peak <- readPeakFile("./0_4_Cut_Tag_cGAS_union.peak.chr24.narrowPeak")
peakAnno <- annotatePeak(peak, tssRegion = c(-3000, 3000), 
                         TxDb = txdb,annoDb="org.Hs.eg.db")
write.table(as.data.frame(peakAnno),file="1_1_peaks.annotate.tsv",
            sep='\t',quote = F, row.names = FALSE)
#F3C
pdf('1_1_pieplot_anno.pdf', width = 11.69, height = 8.27)
plotAnnoPie(peakAnno,cex=0.7,radius=0.75)
dev.off()