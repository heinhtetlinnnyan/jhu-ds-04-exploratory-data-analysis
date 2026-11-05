##Across the United States, how have emissions from coal combustion-related sources 
##changed from 1999–2008?


names(SCC)
str(SCC)
head(SCC)
coal_comb_matches <- grepl("coal", SCC$Short.Name, ignore.case = TRUE) & 
                     grepl("comb", SCC$Short.Name, ignore.case = TRUE)
coal_scc <- SCC$SCC[coal_comb_matches]

nei_coal <- subset(NEI, SCC %in% coal_scc)
coal_emissions <- with(nei_coal, tapply(Emissions, year, sum))
barplot(coal_emissions,
        main = "Coal combustion-related PM2.5 Emissions in US 1999-2008")
