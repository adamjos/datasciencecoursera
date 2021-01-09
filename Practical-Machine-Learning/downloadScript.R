# Script to download data for Human Activity Recognition Project (Course project for Practical Machine Learning Course)

urlTrainDat <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
download.file(urlTrainDat, "trainDat.csv")

urlTestDat <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"
download.file(urlTestDat, "testDat.csv")
