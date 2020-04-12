## Background

This repo contains a script called *"run_analysis.R"*, which gets and cleans the *"Human Activity Recognition Using Smartphones Data Set"*, available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The script produces a tidy data set called *"tidydata.csv"* which contains summarized values from the raw data set. More information about the raw data set, the script and the produced tidy data set, can be found in the Code book.


## Steps performed in run_analysis.R

The requirements for the script was to perform/fulfill the following:
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each 
   measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.


## Instructions to read the tidy data set

Either run the script locally or directly download the tidy data from this repo to get the *"tidydata.csv"* file on your local computer. Load the *"tidydata.csv"* by loading *data.table* package and then use the *read.table()* function, with argument *"stringsAsFactors = FALSE"*. To simplify viewing the data frame, use the *dplyr* package and transform the data frame to a tibble using the *tbl_df()* function. One can now print the contents of the data frame to the console or view it with the *View()* function. 
