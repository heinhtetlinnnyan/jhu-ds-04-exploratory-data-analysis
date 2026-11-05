##Of the four types of sources indicated by the type
##types (point, nonpoint, onroad, nonroad) variable,
##which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
##Which have seen increases in emissions from 1999–2008? 
##Use the ggplot2 plotting system to make a plot answer this question.

baltimore_data <- subset(NEI, fips == "24510")
baltimore_matrix <- with(baltimore_data, tapply(Emissions, list(year, type), sum))
baltimore_df <- as.data.frame.table(baltimore_matrix)
baltimore_df
names(baltimore_df) <- c("Year", "Type", "Emissions")
library(ggplot2)

ggplot(data = baltimore_df,
       aes(x = Year, 
           y = Emissions,
           group = Type)) +
        geom_point() +
        facet_wrap(~ Type) +
        theme_bw()
