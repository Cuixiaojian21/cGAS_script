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

sample_lab = "5_1.down"
gene_list_file <- paste0(sample_lab,".list")

data = read.csv(gene_list_file, sep='\t')
gene = data$geneId

ego <- enrichGO(gene = gene,
                keyType = "ENTREZID",
                OrgDb = org.Hs.eg.db,
                ont = "ALL",
                pvalueCutoff = 0.05,
                qvalueCutoff = 0.05,
                readable = TRUE)
write.table(ego@result,
            file = "down_3kind.tsv",
            sep = "\t",
            row.names = F,col.names = T, quote = FALSE)
p2 <- barplot(ego, split="ONTOLOGY",
              showCategory = 5,
              color = (c("qvalue")))+facet_grid(ONTOLOGY~., scale="free")+
  scale_y_discrete(labels = function(y) str_wrap(y, width = 50) )+ theme_bw()+theme(panel.grid=element_blank())+
  theme(legend.position = "right")
p4 <- ggpar(p2, font.y=c(8), font.tickslab=c(8), font.legend=c(8),legend = "right")
p4
