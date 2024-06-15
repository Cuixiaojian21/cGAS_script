library(this.path)
setwd(this.path::this.dir())
library(ChIPseeker)
library(clusterProfiler)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(org.Hs.eg.db)
library(ggplot2)
library(stringr)
library(ggpubr)

data1 = readPeakFile("0_1.cGAS_R1.24chr.narrowPeak") 
data2 = readPeakFile("0_2.cGAS_R2.24chr.narrowPeak")


covplot(data1,weightCol="V5", chrs = c("chr1"))
covplot(data2,weightCol="V5", chrs = c("chr1"))