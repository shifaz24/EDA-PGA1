
library(dplyr)

fly1 <- readRDS("summarySCC_PM25.rds")
fly2 <- readRDS("Source_Classification_Code.rds")
summarize(group_by(fly1,year),
          a= sum(Emissions))
         with(emissions_by_year, barplot(a, names.arg = year, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "Total PM2.5 Emissions from All Sources"))
          
          
          
          dev.copy(png,'plot1.png')
          dev.off()