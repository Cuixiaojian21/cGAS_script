library(this.path)
setwd(this.path::this.dir())
library(clusterProfiler)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(org.Hs.eg.db)
library(ggplot2)
library(stringr)
library(ggpubr)
library(ChIPseeker)
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

sample_lab = "down"
gene_list_file <- paste0(sample_lab,".list")

data = read.csv(gene_list_file, sep='\t')
gene = data$geneId


ego <- enrichGO(gene = gene,
                keyType = "ENTREZID",
                OrgDb = org.Hs.eg.db,
                ont = "BP",
                pvalueCutoff = 0.05,
                qvalueCutoff = 0.05,
                readable = TRUE)
write.table(ego@result,
            file = "down_BP.tsv",
            sep = "\t",
            row.names = F,col.names = T, quote = FALSE)
p1 <- barplot(ego,color = (c("qvalue")))+
  theme_bw()+ theme(panel.grid=element_blank())
p2 <- dotplot(ego,color = (c("qvalue")))+
  theme_bw()+ theme(panel.grid=element_blank())

p5 <- ggpar(p1, font.y=c(8), font.tickslab=c(8), font.legend=c(8),legend = "right", legend.title="Database")
p5
p4 <- ggpar(p2, font.y=c(8), font.tickslab=c(8), font.legend=c(8),legend = "right", legend.title="Database")
# Fig3E
p4
