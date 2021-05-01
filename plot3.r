library(dplyr)
library(ggplot2)

fly1 <- readRDS("summarySCC_PM25.rds")
fly2 <- readRDS("Source_Classification_Code.rds")

ab <-
  
  summarize(group_by(year, type),filter(fips == "24510") ,total_emissions = sum(Emissions))

ab$year <- as.factor(ab$year)

ggplot(ab, aes(x=year, y=total_emissions)) + geom_bar(stat="identity") + facet_grid(. ~ type) + labs(x="Year", y="PM2.5 Emissions (tons)") + ggtitle("Baltimore City PM2.5 Emissions by Type")

dev.copy(png,'plot3.png')
dev.off()