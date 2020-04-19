## Code for creating plot to answer question 3 (Two sub questions):
#
#   "Of the four types of sources indicated by the type (point, nonpoint, onroad, 
#   nonroad) variable, which of these four sources have seen decreases in emissions
#   from 1999–2008 for Baltimore City? Which have seen increases in emissions from 
#   1999–2008? Use the ggplot2 plotting system to make a plot answer this question."
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

# Extract data for Baltimore City only
baltdat <- filter(NEI, fips == "24510")

# Plot
baltdat %>% 
  group_by(type, year) %>%
  summarize(total_yearly_emissions = sum(Emissions)) %>%
  ggplot(aes(x = year, y = total_yearly_emissions, color = type)) +
  geom_point() +
  geom_line() +
  labs(x = "Year", y = "Total Yearly Emissions [tons]", title = "Total Yearly Emissions by Type in Baltimore City 1999-2008") +
  theme(plot.title = element_text(size = 12)) +
  ggsave(filename = "q3plot.png", dpi = 300)


print("plot for question 3 created!")
