library(mclust)

cpi<-ts(read.csv("D:/inflation.csv", header=FALSE),
           start=c(1948),frequency=12, names=c("cpi"))


#plot time series
labels.chart = seq(as.Date("1948-01-01"), as.Date("2024-04-01"), by = "months")
plot.ts(cpi)
axis(1, cpi, format(labels.chart, "%Y-%m"), las=2)


#fit mclust
fit2 <- Mclust(data.frame(x = cpi, y = time(cpi)), G=2)

summary(fit2)


plot(fit2, what = "density", type = "hdr",pch = 19,
     xlab = "Consumer price Index",
     ylab = "Time")

#mclust.options

plot(fit2, what = "classification",
     xlab = "Consumer price Index",
     ylab = "Time")


require(dplyr)
library(ggplot2)
library(factoextra)


fviz_mclust(fit2, "classification", ellipse.type = "norm", ellipse.level = 0.4,geom = "point", xlab = "Consumer price Index",
            ylab = "Time")

fviz_mclust(fit2, "uncertainty",xlab = "Consumer price Index",
            ylab = "Time")

