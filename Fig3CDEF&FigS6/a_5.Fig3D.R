library(this.path)
setwd(this.path::this.dir())
#setwd('D:/1_1_Work_Path/1_1_YuanLin/1_1_cGAS/8_5_cGAS_6/F2D')

library(clusterProfiler)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(org.Hs.eg.db)
library(ggplot2)
library(stringr)
library(ChIPseeker)
library(ggpubr)
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

sample_lab = "2_1_genelist.promoter"
gene_list_file <- paste0(sample_lab,".tsv")
ego_out_file <- paste0("3_1_ego_", sample_lab, ".tsv")
kegg_out_file <- paste0("4_1_kegg_", sample_lab, ".tsv")
ego_out_pdf <- paste0("3_1_ego_", sample_lab, ".pdf")
kegg_out_pdf <- paste0("4_1_kegg_", sample_lab, ".pdf")


data = read.csv(gene_list_file, sep='\t')
gene = data$geneId

# F2D
kegg <- enrichKEGG(
  gene = gene,  
  keyType = 'kegg',  
  organism = 'human',  
  pvalueCutoff = 0.05,
  )
dotplot(kegg,
        color = (c("pvalue")))
