library(dplyr)
library(ggplot2)

fly1 <- readRDS("summarySCC_PM25.rds")
fly2 <- readRDS("Source_Classification_Code.rds")

eby <-
  summarize( group_by(fly1,year),filter(fips == "24510" & type == "ON-ROAD"),total_emissions = sum(Emissions))

eby$year <- as.factor(eby$year)

ggplot(eby, aes(x=year, y=total_emissions)) + geom_bar(stat="identity") + labs(x="Year", y="PM2.5 Emissions (tons)") + ggtitle("Baltimore City PM2.5 Emissions from Vehicle Related Sources")

dev.copy(png,'plot5.png')
dev.off()