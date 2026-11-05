##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
##for each of the years 1999, 2002, 2005, and 2008.



total_emissions <- with(NEI, tapply(Emissions, year, sum))
total_emissions
barplot(total_emissions,
        col = "blue")