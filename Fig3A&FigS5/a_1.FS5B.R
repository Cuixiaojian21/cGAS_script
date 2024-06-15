library(this.path)
setwd(this.path::this.dir())
library(ggpubr)
library(ggplot2)
library(stringr)
data = read.csv('1_2.log10.1_1.tsv', sep='\t')
data[data < 3] <- 3
data[data > 9] <- 9

hist(x=data$Abundance_811269,breaks = 12, xlim = c(3,9), xlab="control log10 value")

hist(x=data$Abundance_811270,breaks = 12, xlim = c(3,9), xlab="cytoplasm log10 value")

hist(x=data$Abundance_811271,breaks = 12, xlim = c(3,9), xlab="nucleus log10 value")

data = read.csv('1_2.log10.1_1.tsv', sep='\t')
x <- data$cytoplasm
h1 <- hist(x,breaks = 20, xlab="cytoplasm/control log10 value", xlim = c(-4,6))
xfit<-seq(min(x),max(x),length=40)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h1$mids[1:2])*length(x) 
lines(xfit, yfit, col="blue", lwd=2)

y <- data$nucleus
h2 <- hist(y,breaks = 20, xlab="nucleus/control log10 value", xlim = c(-4,6))
xfit2<-seq(min(y),max(y),length=40)
yfit2<-dnorm(xfit2,mean=mean(y),sd=sd(y))
yfit2 <- yfit2*diff(h2$mids[1:2])*length(y) 
lines(xfit2, yfit2, col="pink", lwd=2)

hist(y,breaks = 20, xlab="nucleus/control log10 value", xlim = c(-4,6), ylim = c(0,250))
lines(xfit, yfit, col="blue", lwd=2)
lines(xfit2, yfit2, col="pink", lwd=2)


lines(frequency(data$cytoplasm),lwd=2)
hist(x=data$nucleus,breaks = 12, xlab="nucleus/control log10 value")
lines(x)
