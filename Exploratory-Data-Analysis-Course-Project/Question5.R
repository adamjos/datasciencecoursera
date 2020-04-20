## Code to create plot to answer question 5:
#
#   "How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?"
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
dat <- filter(NEI, (SCC %in% motorscc$SCC) & (fips == "24510"))

# Plot
dat %>% 
  group_by(year) %>% 
  summarize(total_yearly_emission_from_vehicles = sum(Emissions)) %>%
  ggplot(aes(year, total_yearly_emission_from_vehicles)) + 
  geom_point(col = "steelblue") + 
  geom_line(col = "steelblue") + 
  labs(x = "Year", y = "Total Yearly Emissions [tons]", title = "Total Yearly Emissions from Motor Vehicles in Baltimore City 1999-2008") +
  theme(plot.title = element_text(size = 12)) +
  ggsave(filename = "q5plot.png", dpi = 300)


print("plot for question 5 created!")