## run_analysis.R
## ==============
## What: Script that gets and clean the raw data, 
## Human Activity Recognition Using Smartphones Data Set, found at: 
## [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]
##
## The actions of the script can be broken down into:
##
## 1. Merges the training and the test sets to create one data set.
##
## 2. Extracts only the measurements on the mean and standard deviation
##    for each measurement.
##
## 3. Uses descriptive activity names to name the activities in the data set
##
## 4. Appropriately labels the data set with descriptive variable names.
##
## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.

library(data.table)
library(dplyr)

# Get data
#==========
hardataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(hardataurl,"hardata.zip")
unzip("hardata.zip")

# Load data
#===========
# train data
meastrain <- read.table("UCI HAR Dataset/train/X_train.txt")
activtrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
# test data
meastest <- read.table("UCI HAR Dataset/test/X_test.txt")
activtest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjtest <- read.table("UCI HAR Dataset/test/subject_test.txt")

# meta data
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
featurenames <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

# Concatenate data
#=================
# Concat x with y for train (cbind)
train <- cbind(activtrain, meastrain)
# Concat subjects with train (cbind)
train <- cbind(subjtrain, train)
# Concat x with y for test (cbind)
test <- cbind(activtest, meastest)
# Concat subjects with test (cbind)
test <- cbind(subjtest, test)
# Concat train with test (rbind)
dat <- rbind(train,test)

# Find only relevant features (containing "mean" or "std" in the name)
relevfeatind <- grep("mean|std", featurenames$V2, ignore.case = TRUE)
relevfeatnames <- featurenames$V2[relevfeatind]

# Select only relevant features and store in df
dat <- dat[,c(1,2,(relevfeatind + 2))]

# Add feature names
names(dat) <- c("subject", "activity", relevfeatnames)

# Rename activities from numbers to descriptive strings (Use information in "activitylabels.txt")
dat <- tbl_df(dat)
dat <- mutate(dat, activity = activitylabels$V2[activity])

# Summarize features in mean values in new df for each activity and each subject
meandat <- dat %>% group_by(subject, activity) %>% summarize_all(mean)

# Write the summarized dataframe to a new file (write.table)
write.table(meandat, file = "tidydata.csv")



