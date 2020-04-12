## Codebook

This is a description of the variables used from the raw data set as well as a description of the variables in the produced tidy data set. It is also a detailed description of the steps in the "run_analysis.R" script.

### Study design
This section explains the raw data and how it was obtained, by citing the original authors, Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto of Smartlab - Non Linear Complex Systems Laboratory, DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy:

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

*- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.* 

*Notes:* 
*- Features are normalized and bounded within [-1,1].*
*- Each feature vector is a row on the text file.*

*For more information about this dataset contact: activityrecognition@smartlab.ws"*

---

### Variable description

Following is a quotation of the original authors, Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto, regarding the description of the raw data variables:

*"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.* 

*Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).* 

*Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).* 

*These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.*

*tBodyAcc-XYZ*,
*tGravityAcc-XYZ*,
*tBodyAccJerk-XYZ*,
*tBodyGyro-XYZ*,
*tBodyGyroJerk-XYZ*,
*tBodyAccMag*,
*tGravityAccMag*,
*tBodyAccJerkMag*,
*tBodyGyroMag*,
*tBodyGyroJerkMag*,
*fBodyAcc-XYZ*,
*fBodyAccJerk-XYZ*,
*fBodyGyro-XYZ*,
*fBodyAccMag*,
*fBodyAccJerkMag*,
*fBodyGyroMag*,
*fBodyGyroJerkMag*,


*The set of variables that were estimated from these signals are:*

*mean(): Mean value*

*std(): Standard deviation*

...

*Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:*

*gravityMean,
tBodyAccMean,
tBodyAccJerkMean,
tBodyGyroMean,
tBodyGyroJerkMean*

*The complete list of variables of each feature vector is available in 'features.txt'."*

---

In order to produce the tidy data set, a sub set of the variables in the raw data set was used, namely all variables containing "mean" and "std" in the name.

following the steps described below, *"run_analysis.R"* computes the mean of these variables, grouped by both subjects with ID's [1, 30] and activites {WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING}. The naming of the calculated mean follows the naming of the raw data source, i.e. the mean of "tGravityAcc-mean()-X" is named "tGravityAcc-mean()-X", and in the same way, the mean of "tGravityAcc-std()-X" is named "tGravityAcc-std()-X" etc.

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

---
