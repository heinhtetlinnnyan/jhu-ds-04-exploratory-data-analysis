set.seed(1234)
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
plot(x,y, col = "blue", pch = 19, cex =2)
text(x + 0.05, y +0.05, labels = as.character(1:12))

dataFrame <- data.frame(x = x, y = y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
plot(hClustering)
myplclust(hClustering, lab = rep(1:3, each =4), lab.col = rep(1:3, each =4))

dataFrame <- data.frame(x = x, y =y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame) [sample(1:12),]
heatmap(dataMatrix)

dev.off()

dataFrame <- data.frame(x,y)
kmeansObj <- kmeans(dataFrame, centers =3)
names(kmeansObj)
kmeansObj$cluster

plot(x,y, col = kmeansObj$centers, pch = 19, cex = 2)
points(kmeansObj$centers, col = 1:3, pch = 3, cex = 2, lwd =3 )

for (i in 10:15) {
        i <- i + 5
        print(i)
}

pal <- colorRamp(c("red", "blue"))
pal
pal(0)

pal <- colorRampPalette(c("red", "blue"))
pal(10)

x <- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x, y)
plot(x,y)

library(swirl)
swirl()
