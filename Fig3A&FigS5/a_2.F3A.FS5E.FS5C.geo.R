library(this.path)
setwd(this.path::this.dir())
library(clusterProfiler)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(org.Hs.eg.db)
library(ggplot2)
library(stringr)
library(ggpubr)
library(ChIPseeker)
data = read.csv('GeneId_nucleus_only.txt', sep='\t')
gene = data$Gene.ID


ego <- enrichGO(gene = gene,
                keyType = "ENTREZID",
                OrgDb = org.Hs.eg.db,
                ont = "CC",
                pvalueCutoff = 0.05,
                qvalueCutoff = 0.05,
                readable = TRUE)
p1 <- barplot(ego,color = (c("qvalue")))+
  theme_bw()+ theme(panel.grid=element_blank())
p2 <- dotplot(ego,color = (c("qvalue")))+
  theme_bw()+ theme(panel.grid=element_blank())
p5 <- ggpar(p1, font.y=c(8), font.tickslab=c(8), font.legend=c(8),legend = "right")
#Figure 3 A
p5
p4 <- ggpar(p2, font.y=c(8), font.tickslab=c(8), font.legend=c(8),legend = "right")
p4
write.table(ego@result,
            file = "nucleus_only_result.tsv",
            sep = "\t",
            row.names = F,col.names = T, quote = FALSE)
#######################################
ego <- enrichGO(gene = gene,
                keyType = "ENTREZID",
                OrgDb = org.Hs.eg.db,
                ont = "ALL",
                pvalueCutoff = 0.05,
                qvalueCutoff = 0.05,
                readable = TRUE)
write.table(ego@result,
            file = "nucleus_only_result.3kind.tsv",
            sep = "\t",
            row.names = F,col.names = T, quote = FALSE)
p2 <- barplot(ego, split="ONTOLOGY",
              showCategory = 5,
              color = (c("qvalue")))+facet_grid(ONTOLOGY~., scale="free")+
  scale_y_discrete(labels = function(y) str_wrap(y, width = 50) )+ theme_bw()+theme(panel.grid=element_blank())+
  theme(legend.position = "right")
p4 <- ggpar(p2, font.y=c(8), font.tickslab=c(8), font.legend=c(8),legend = "right")
#Figure S5 E
p4
####################################################################################################################################################
data = read.csv('GeneId_Cytoplasm_all.txt', sep='\t')
gene = data$Gene.ID
ego <- enrichGO(gene = gene,
                keyType = "ENTREZID",
                OrgDb = org.Hs.eg.db,
                ont = "ALL",
                pvalueCutoff = 0.05,
                qvalueCutoff = 0.05,
                readable = TRUE)
write.table(ego@result,
            file = "Cytoplasm_all_result.3kind.tsv",
            sep = "\t",
            row.names = F,col.names = T, quote = FALSE)
p2 <- barplot(ego, split="ONTOLOGY",
              showCategory = 5,
              color = (c("qvalue")))+facet_grid(ONTOLOGY~., scale="free")+
  scale_y_discrete(labels = function(y) str_wrap(y, width = 50) )+ theme_bw()+theme(panel.grid=element_blank())+
  theme(legend.position = "right")
p4 <- ggpar(p2, font.y=c(8), font.tickslab=c(8), font.legend=c(8),legend = "right")
#Figure S5 C
p4
