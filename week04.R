if (!file.exists("data")) {
        dir.create("data")
}

file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
zip_path <- "data/NEI_data.zip"

if (!file.exists(zip_path)) {
        download.file(file_url, destfile = zip_path, method = "curl")
}

unzip(zip_path, exdir = "data")

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

head(NEI)
dim(NEI)

head(SCC)
dim(SCC)
str(SCC)
total_emissions <- with(NEI, tapply(Emissions, year, sum))
total_emissions
barplot(total_emissions,
        col = "blue")

