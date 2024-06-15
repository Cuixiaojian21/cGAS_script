library(this.path)
setwd(this.path::this.dir())
#setwd('D:/1_1_Work_Path/8_4_cGAS_4')
library(ggplot2)
library(cowplot)
library(tidyverse)
library(ggsci)
library(ggpubr)
library(ggsignif)

data=read.csv("4_2_data_for_plot.tsv", sep='\t')
# my_comparisons <- list( c("control", "mtx treat"))group	PPI count
my_comparisons <- list( c("group","Database", "PPI.count"))
p <- ggboxplot(data,x = "group", y = "PPI.count", color = "Database", 
               palette = c("#4DDCDC","#DD3125"), 
               outlier.shape = NA, width = 0.8)+
  theme_bw()+ theme(panel.grid=element_blank())+
  theme(legend.position = "right")
  # theme(strip.background = element_blank(),strip.text = element_blank(), panel.border = element_blank())
p
# p4 <- ggpar(p, xlab = FALSE, ylab = "TADs Size",legend = "right", ylim=c(0,4),
#             font.family="TNR", font.y=c(7), font.tickslab=c(6), font.legend=c(6), legend.title="TAD hierarchy",)
p4 <- ggpar(p, xlab = FALSE,  font.y=c(8), font.tickslab=c(8), font.legend=c(8),legend = "none", ylim=c(0,400))
p4
p5 <- ggpar(p, xlab = FALSE,  font.y=c(8), font.tickslab=c(8), font.legend=c(8),legend = "right", ylim=c(0,400), legend.title="Database")
p5
