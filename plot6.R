##Compare emissions from motor vehicle sources 
##in Baltimore City with emissions from motor vehicle sources in 
## Los Angeles County, California (
##fips == "06037"
##fips == "06037". Which city has seen greater changes over time in motor vehicle emissions?

bal_cal <-subset(NEI, (fips == "24510" | fips == "06037") & type == "ON-ROAD")
compare_bal_cal <- with(bal_cal, tapply(Emissions, list(year, fips), sum))
compare_df <- as.data.frame.table(compare_bal_cal)
compare_df
names(compare_df) <- c("Year", "Fips", "Emissions")
compare_df$City <- ifelse(compare_df$Fips == "24510", "Baltimore City", "Los Angeles County")
compare_df
library(ggplot2)
ggplot(data = compare_df,
       aes(x = Year,
           y = Emissions,
           group = City,
           color = City)) +
        geom_point() +
        facet_wrap(~ City) +
        theme_bw() +
        labs(
                title = "Motor Vehicle - PM2.5 Emission - Baltimore and California 1999-2008"
        )
