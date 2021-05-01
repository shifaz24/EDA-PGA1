library(dplyr)
library(ggplot2)

FLY1 <- readRDS("summarySCC_PM25.rds")
FLY2 <- readRDS("Source_Classification_Code.rds")

EBY <-summarize( group_by(FLY1,year), filter(fips %in% c("24510", "06037") & type == "ON-ROAD"),total_emissions = sum(Emissions))

EBY$year <- as.factor(EBY$year)
EBY$county_name <- factor(labels=c("Los Angeles County", "Baltimore City"),levels=c("06037", "24510"),EBY$fips  ) 

ggplot(EBY, aes(x=year, y=total_emissions)) + 
  geom_bar(stat="identity", aes(fill=county_name), position = "dodge") +
  guides(fill=guide_legend(title=NULL)) +
  labs(x="Year", y="PM2.5 Emissions (tons)") +
  ggtitle("Vehicle PM2.5 Emissions - Baltimore City and LA County") +
  theme(legend.position="bottom")


dev.copy(png,'plot6.png')
dev.off()