## Introduction

This repo contains a script called *"run_analysis.R"*, which gets and cleans the *"Human Activity Recognition Using Smartphones Data Set"*, available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The script produces a tidy data set called *"tidydata.txt"* which contains summarized values from the raw data set. More information about the raw data set, the script and the produced tidy data set, can be found in the Code book.

The requirements for the script was to perform/fulfill the following:
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each 
   measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

**Steps performed in "run_analysis.R":**

1. Download the *"Human Activity Recognition Using Smartphones Data Set"* from the following url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip the contents of the downloaded package.

3. Load train, test, subject data and meta data (activity and feature names) into separate data frames using *read.table()*.

4. Concatenate the measurements with activities and subjects for both train and test set column-wise with *cbind()*. Concatenate the train and test sets row-wise with *rbind()*.

5. Find the relevant names and their indices in the feature name data frame, i.e. the ones containing either "mean" or "std" by using the *grep()* function. 

6. Extract the relevant variables from the concatenated data frame using the indices found in step 5.

7. Add correct names to the new data frame using the names found in step 5.

8. Exchange the numbers in the activities column of the data frame to proper descriptive names found in the *"activity_lables.txt"* file. This is performed by transforming the data frame to a tibble using *tbl_df()*, and mutating the "activity" column, calling on corresponding activity names in the data frame loaded from *"activity_labels.txt"*.

9. Calculate the mean for each variable for each subject and each activity and store it in a new data frame by grouping the data frame by subjects and activities, and then calling *summarize_all()*, calculating the mean for all variables in all groups.

10. Write the new data frame to a new file called *"tidydata.txt"*, using *write.table()*.



## Instructions to read the tidy data set

Either run the script locally or directly download the tidy data from this repo to get the *"tidydata.txt"* file on your local computer. Load the *"tidydata.txt"* by loading *data.table* package and then use the *read.table()* function, with argument *"stringsAsFactors = FALSE"*, *"header = TRUE"*, *"check.names = FALSE"* and *"sep = " ""*. To simplify viewing the data frame, use the *dplyr* package and transform the data frame to a tibble using the *tbl_df()* function. One can now print the contents of the data frame to the console or view it with the *View()* function. 
