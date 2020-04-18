## Code for creating plot to answer question 2:
#
#   "Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
#   (fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot
#   answering this question."
#
library(dplyr)

# Get data
dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(dataurl, "data.zip")
unzip("data.zip")

# Load data
NEI <- tbl_df(readRDS("summarySCC_PM25.rds"))
SCC <- tbl_df(readRDS("Source_Classification_Code.rds"))

# Extract data for Baltimore City only
baltdat <- filter(NEI, fips == "24510")

# Calculate sum of emissions from all sources per year in Baltimore City
emsum <- tapply(baltdat$Emissions, baltdat$year, sum)

# Create and open PNG graphic device
png(filename = "q2plot.png", width = 480, height = 480)

# Plot
plot(names(emsum), emsum, col = "red", xlab = "Year", ylab = "Total Yearly Emissions [tons]", main = "Total Yearly Emissions in Baltimore City 1999-2008")
lines(names(emsum),emsum)

# Close PNG device
dev.off()

print("plot for question 2 created!")
