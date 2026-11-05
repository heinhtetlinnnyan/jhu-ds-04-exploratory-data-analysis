##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (
##fips == "24510") from 1999 to 2008? 
##Use the base plotting system to make a plot answering this question.

baltimore_data <- subset(NEI, fips == "24510")
head(baltimore_data)
baltimore_total_emissions <- with(baltimore_data, tapply(Emissions, year, sum))
baltimore_total_emissions
barplot(baltimore_total_emissions,
        col = "blue")
