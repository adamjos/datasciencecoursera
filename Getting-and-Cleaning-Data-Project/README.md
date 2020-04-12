## Background

This file explains the steps in the script *"run_analysis.R"*, which gets and cleans the *"Human Activity Recognition Using Smartphones Data Set"*, available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. To give a background into the raw data, following is a citation of the README file written by the authors of the original data set, Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto of Smartlab - Non Linear Complex Systems Laboratory, DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy:

*"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.* 

*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.* 

*For each record it is provided:*

*- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.*
*- Triaxial Angular velocity from the gyroscope.* 
*- A 561-feature vector with time and frequency domain variables.* 
*- Its activity label.* 
*- An identifier of the subject who carried out the experiment.*

*The dataset includes the following files:*

*- 'README.txt'*

*- 'features_info.txt': Shows information about the variables used on the feature vector.*

*- 'features.txt': List of all features.*

*- 'activity_labels.txt': Links the class labels with their activity name.*

*- 'train/X_train.txt': Training set.*

*- 'train/y_train.txt': Training labels.*

*- 'test/X_test.txt': Test set.*

*- 'test/y_test.txt': Test labels.*

*The following files are available for the train and test data. Their descriptions are equivalent.* 

*- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.* 

*- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.* 

*- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.* 

*- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.* 

*Notes:* 
*- Features are normalized and bounded within [-1,1].*
*- Each feature vector is a row on the text file.*

*For more information about this dataset contact: activityrecognition@smartlab.ws"*

---

## Steps performed in run_analysis.R

The requirements for the script was to perform/fulfill the following:
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each 
   measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the     average of each variable for each activity and each subject.

**The steps taken in the script are:**

1. Download the *"Human Activity Recognition Using Smartphones Data Set"* from the following url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip the contents of the downloaded package.

3. Load train, test, subject data and meta data (activity and feature names) into separate data frames using *read.table()*.

4. Concatenate the measurements with activities and subjects for both train and test set column-wise with *cbind()*. Concatenate the train and test sets row-wise with *rbind()*.

5. Find the relevant names and their indices in the feature name data frame, i.e. the ones containing either "mean" or "std" by using the *grep()* function. 

6. Extract the relevant variables from the concatenated data frame using the indices found in step 5.

7. Add correct names to the new data frame using the names found in step 5.

8. Exchange the numbers in the activities column of the data frame to proper descriptive names found in the *"activity_lables.txt"* file. This is performed by transforming the data frame to a tibble using *tbl_df()*, and mutating the "activity" column, calling on corresponding activity names in the data frame loaded from *"activity_labels.txt"*.

9. Calculate the mean for each variable for each subject and each activity and store it in a new data frame by grouping the data frame by subjects and activities, and then calling *summarize_all()*, calculating the mean for all variables in all groups.

10. Write the new data frame to a new file called *"tidydata.csv"*, using *write.table()*.

---

## Instructions to read the tidy data set

Load the *data.table* library and then use the *read.table()* function, with *"stringsAsFactors = FALSE"*. To simplify viewing the data frame, use the *dplyr* package and transform the data frame to a tibble using the *tbl_df()* function. One can now print the contents of the data frame to the console or view it with the *View()* function. 
