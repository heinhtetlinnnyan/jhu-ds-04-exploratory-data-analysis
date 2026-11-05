if (!file.exists("data")) {
        dir.create("data")
}


# Define the URL
data_url <- "https://raw.githubusercontent.com/rdpeng/courses/master/04_ExploratoryAnalysis/exploratoryGraphs/data/avgpm25.csv"
dest_path <- "data/avgpm25.csv"
download.file(url = data_url, destfile = dest_path, method = "curl")

initial_look <- read.csv("data/avgpm25.csv", nrows = 5)
str(initial_look)
classes <- sapply(initial_look, class)
classes

pollution <- read.csv(dest_path, 
                      colClasses = c("numeric", "character", "factor", "numeric", "numeric"))


head(pollution)
summary(pollution$pm25)
boxplot(pollution$pm25, col = "blue")
hist(pollution$pm25, col = "green", breaks = 100)
rug(pollution$pm25)

boxplot(pollution$pm25, col = "blue")
abline(h = 12)

hist(pollution$pm25, col = "green")
rug(pollution$pm25)
abline( v = 12, lwd = 2)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)

barplot(table(pollution$region), col = "wheat", main = "Number of Counties in Each Region")

table(pollution$region)

boxplot(pm25 ~ region, data = pollution, col = "red")
abline(h = 12, col = "wheat")

par(mfrow = c (2,1), mar = c(4, 4, 2, 1))
hist(subset(pollution, region == "east")$pm25, col = "green", main = "East")
rug(subset(pollution, region == "east")$pm25)
hist(subset(pollution, region == "west")$pm25, col = "green", main = "West")
rug(subset(pollution, region == "west")$pm25)

dev.off()
with(pollution, plot(latitude, pm25, col = region))
abline(h = 12, lwd = 2, lty =2)

par(mfrow = c (1,2), mar = c(5, 4, 2, 1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
abline(h = 12, lwd = 2, lty =2)
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))
abline(h = 12, lwd = 2, lty =2)
dev.off()

library(datasets)
data(cars)
with(cars, plot(speed, dist))
head(cars)  
with(cars, boxplot(speed, dist))

library(datasets)
with(airquality, hist(Ozone))
with(airquality, plot(Wind, Ozone))

airquality <- transform(airquality, Month = factor(Month))
with(airquality, boxplot(Ozone ~ Month, xlab = "Month", ylab = "Ozone (ppb)"))

with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in New York City")

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in NY City"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in NYC", pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

dev.off()

par(mfrow = c(1,2))
with(airquality, {
        plot(Wind, Ozone, main = "Ozone and Wind")
        plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
})

par(mfrow = c (1,3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(airquality, {
        plot(Wind, Ozone, main = "Ozone and Wind")
        plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
        plot(Temp, Ozone, main = "Ozone and Temperature")
        mtext("Ozone and Weather in NYC",outer = TRUE)
})

par("mar")
x <- rnorm(100)
hist(x)
y <- rnorm(100)
plot(x , y)
z <- rnorm(100)
plot(x, z, pch = 19)
par(mar = c(4,4,2,2))

example(points)


x <-  rnorm(100)
y <-  x + rnorm(100)
g <- gl(2, 50)
g <- gl(2, 50, labels = c("Male", "Female"))
plot(x, y, type = "n")
points(x [g == "Male"], y[g == "Male"], col = "green")
points(x [g == "Female"], y[g == "Female"], col = "red", pch =19)


x11() #screen. 


pdf(file = "myplot.pdf")
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")
dev.off()
getwd()

dev.cur()


library(datasets)
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")
dev.copy(png, file = "geyserplot.png")
dev.off()


library(datasets)

# 1. Open the PNG device first
png(file = "geyserplot.png", width = 480, height = 480)

# 2. Plot directly into the file
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")

# 3. Close and save the file
dev.off()

library(swirl)
swirl()

install_from_swirl("Exploratory Data Analysis")
x11()

low


##lattice plot
library(lattice)
library(datasets)
xyplot(Ozone ~ Wind, data = airquality)
plot(x = airquality$Wind, y = airquality$Ozone, data = airquality)

airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))


set.seed(10)
x <-  rnorm(100)
f <-  rep(0:1, each = 50)


y <-  x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group1", "Group2"))
xyplot(y ~x | f, layout = c (2,1))          
x11()


test <- xyplot( y ~ x | f,  panel = function(x, y, ...) {
        panel.xyplot(x,y, ...)
        panel.abline( h = median(y), lty =2)
})
x11()
class(test)

xyplot( y ~ x | f,  panel = function(x, y, ...) {
        panel.xyplot(x,y, ...)
        panel.lmline( x,y, col =2)
})
dev.off()

#ggplot2
library(ggplot2)
str(mpg)

ggplot( data = mpg,
        mapping = aes( x= displ, y = hwy)) +
        geom_point() +
        facet_grid(.~ drv)

x <- ggplot( data = mpg,
        mapping = aes( x= displ, y = hwy)) +
        geom_point() +
        facet_grid(drv ~.)
summary(x)

ggplot(data = mpg, mapping = aes(x = displ)) +
        geom_histogram(binwidth = 0.5) +
        facet_grid(. ~ drv) +
        theme_bw()
??theme_

# Imagine a heavily skewed vector of property prices
prices <- c(50000, 60000, 75000, 120000, 5000000)

# Actual Numbers: The 5-million house ruins the scale
hist(prices, main="Actual Numbers")

# Log Transformed: The data becomes much more symmetric
log_prices <- log(prices)
hist(log_prices, main="Log Transformed")


library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)

p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)
p

install.packages("ggplot2movies")
library(ggplot2)
library(ggplot2movies)
g <- ggplot(movies, aes(votes, rating))
print(g)
qplot(votes, rating, data = movies) + geom_smooth()


library(swirl)
swirl()

exit
