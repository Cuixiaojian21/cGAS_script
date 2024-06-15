library(this.path)
setwd(this.path::this.dir())
library(ggpubr)
library(ggplot2)
library(stringr)

data = read.csv('1_1.rawdata.tsv', sep='\t')
data[data >10000] <- 10000
hist(x=data$shGFP,breaks = 30, xlab="shGFP",ylim = c(0,3500))

hist(x=data$shcGAS.1,breaks = 50, xlab="shcGAS-1",ylim = c(0,2000))

hist(x=data$shcGAS.2,breaks = 50, xlab="shcGAS-2",ylim = c(0,2000))

data2 = subset(data, shcGAS.1.shGFP < 4)
# hist(x=data2$shcGAS.1.shGFP,breaks = 50, xlab="shcGAS-1/shGFP",ylim = c(0,1200))
x <- data2$shcGAS.1.shGFP
h1 <- hist(x,breaks = 50, xlab="shcGAS-1/shGFP",ylim = c(0,1200))
xfit<-seq(min(x),max(x),length=80)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h1$mids[1:2])*length(x) 
lines(xfit, yfit, col="blue", lwd=2)




x <- data$shcGAS.2.shGFP
h2 <- hist(x,breaks = 50, xlab="shcGAS-2/shGFP",ylim = c(0,1500),xlim = c(0,4))
xfit2<-seq(min(x),max(x),length=80)
yfit2<-dnorm(xfit2,mean=mean(x),sd=sd(x))
yfit2 <- yfit2*diff(h2$mids[1:2])*length(x) 
lines(xfit2, yfit2, col="pink", lwd=2)

x <- data$shcGAS.2.shGFP
h2 <- hist(x,breaks = 50, xlab="blue:shcGAS-2/shGFP pink:shcGAS-2/shGFP",ylim = c(0,1200),xlim = c(0,4))
xfit2<-seq(min(x),max(x),length=80)
yfit2<-dnorm(xfit2,mean=mean(x),sd=sd(x))
yfit2 <- yfit2*diff(h2$mids[1:2])*length(x) 
lines(xfit2, yfit2, col="pink", lwd=2)
lines(xfit, yfit, col="blue", lwd=2)
