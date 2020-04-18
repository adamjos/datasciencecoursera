## Code for plot to answer question 1:
#
#   "Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#   Using the base plotting system, make a plot showing the total PM2.5 emission from
#   all sources for each of the years 1999, 2002, 2005, and 2008."
#

# Get data
dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(dataurl, "data.zip")
unzip("data.zip")

# Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Calculate sum of emissions from all sources per year
emsum <- tapply(NEI$Emissions, NEI$year, sum)

# Create and open PNG graphic device
png(filename = "q1plot.png", width = 480, height = 480)

# Plot
plot(names(emsum), emsum, col = "blue", xlab = "Year", ylab = "Total Yearly Emissions [tons]", main = "Total Yearly Emissions in US 1999-2008")
lines(names(emsum),emsum)

# Close PNG device
dev.off()

print("plot for question 1 created!")


