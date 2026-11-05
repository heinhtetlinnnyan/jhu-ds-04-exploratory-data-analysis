##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

baltimore_vehicles <- subset(NEI, fips == "24510" & type == "ON-ROAD")
vehicle_emissions <- with(baltimore_vehicles, tapply(Emissions, year, sum))
barplot(vehicle_emissions,
        main = "Motor Vehicle sources PM2.5 Emission in Baltimore City 1999-2008")
