## Codebook

This is a description of the variables used in the raw data set as well as a description of the variables in the produced tidy data set.

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

In order to produce the tidy data set, a sub set of the variables in the raw data set was used, i.e. all variables containing "mean" and "std" in the name.

following the steps described in the README, *"run_analysis.R"* computes the mean of these variables, grouped by both subjects with ID's [1, 30] and activites {WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING}. The naming of the calculated mean follows the naming of the raw data source, i.e. the mean of tGravityAcc-mean()-X is named the same, as well as the mean of tGravityAcc-std()-X is named the same etc.
