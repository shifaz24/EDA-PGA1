library(dplyr)
library(ggplot2)

fly1 <- readRDS("summarySCC_PM25.rds")
fly2 <- readRDS("Source_Classification_Code.rds")

coal_fly2s <- 
  select(fly2,filter(grepl("coal", EI.Sector, ignore.case=TRUE)))

eby <- 
  
  summarize( group_by(fly1,year),filter(fly2 %in% coal_fly2s$fly2),total_emissions = sum(Emissions))

eby$year <- as.factor(eby$year)

ggplot(eby, aes(x=year, y=total_emissions)) + geom_bar(stat="identity") + labs(x="Year", y="PM2.5 Emissions (tons)") + ggtitle("US PM2.5 Emissions from Coal Related Sources")

dev.copy(png,'plot4.png')
dev.off()