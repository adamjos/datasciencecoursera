## Code for creating plot to answer question 4:
#
#   "Across the United States, how have emissions from coal combustion-related
#    sources changed from 1999–2008?"
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

# Extract SCCs related to coal combustion
coalscc <- SCC[grep("- Coal", SCC$EI.Sector),]

# Extract data related to coal combustion only
dat <- filter(NEI, SCC %in% coalscc$SCC)

# Plot
dat %>% 
  group_by(year) %>% 
  summarize(total_yearly_emission_from_coal = sum(Emissions)) %>%
  ggplot(aes(year, total_yearly_emission_from_coal)) + 
  geom_point() + 
  geom_line() + 
  labs(x = "Year", y = "Total Yearly Emissions [tons]", title = "Total Yearly Emissions from Coal Combustion in US 1999-2008")
  ggsave(filename = "q4plot.png", dpi = 300)


print("plot for question 4 created!")
