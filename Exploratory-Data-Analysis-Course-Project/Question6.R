## Code to create plot to answer question 6:
#
#   "Compare emissions from motor vehicle sources in Baltimore City with emissions
#   from motor vehicle sources in Los Angeles County, California (fips=="06037"). 
#   Which city has seen greater changes over time in motor vehicle emissions?"
#
library(dplyr)
library(ggplot2)

# Get data
dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(dataurl, "data.zip")
unzip("data.zip")

# Load data
NEI <- tbl_df(readRDS("summarySCC_PM25.rds"))
SCC <- tbl_df(readRDS("Source_Classification_Code.rds"))

# Extract SCCs related to emissions from motor vehicle sources
motorscc <- SCC[grep("vehicle", SCC$EI.Sector, ignore.case = TRUE),]

# Extract data related to motor vehicles AND observations from Baltimore City only
dat <- filter(NEI, (SCC %in% motorscc$SCC) & ((fips == "24510") | fips == "06037"))

# Plot
dat %>% 
  group_by(fips, year) %>% 
  summarize(total_yearly_emission_from_vehicles = sum(Emissions)) %>%
  ggplot(aes(year, total_yearly_emission_from_vehicles, color = fips)) + 
  geom_point(cex = 3) + 
  geom_line(lwd = 1.5) + 
  labs(x = "Year", y = "Total Yearly Emissions [tons]", title = "Total Yearly Emissions from Motor Vehicles in Baltimore City and Los Angeles 1999-2008") +
  theme(plot.title = element_text(size = 9)) +
  scale_color_manual("City",values=c("coral1","aquamarine3"), breaks=c("06037", "24510"), labels=c("Los Angeles","Baltimore City")) +
  ggsave(filename = "q6plot.png", dpi = 300)


print("plot for question 6 created!")