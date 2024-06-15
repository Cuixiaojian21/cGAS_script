library(this.path)
setwd(this.path::this.dir())
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


# FS6J
ego <- enrichGO(gene = gene,
                keyType = "ENTREZID",
                OrgDb = org.Hs.eg.db,
                ont = "ALL",
                pvalueCutoff = 0.05,
                readable = TRUE)
write.table(ego, "promoter_peak_3kind.tsv", 
            sep = '\t', 
            quote = FALSE, row.names = FALSE)
p2 <- barplot(ego, split="ONTOLOGY",
              showCategory = 5,
              color = (c("qvalue")))+facet_grid(ONTOLOGY~., scale="free")+
  scale_y_discrete(labels = function(y) str_wrap(y, width = 50) )+ theme_bw()+theme(panel.grid=element_blank())+
  theme(legend.position = "right")
p4 <- ggpar(p2, font.y=c(8), font.tickslab=c(8), font.legend=c(8),legend = "right")
p4



