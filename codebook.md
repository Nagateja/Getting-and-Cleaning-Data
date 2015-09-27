##Codebook.md

Files that were provided: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Files that were used for the assignment: X_test, X_train, y_test, y_train, subject_test, subject_train, features and
activity_labels

###Briefly:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned 
into two sets, where 70% (21 participants) of the volunteers was selected for generating the training data and 30% (9 participants) the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

###About the files:
The files described below are limited to the scope of the assignment
  * features.txt': List of all features.
  * activity_labels.txt: Links the class labels with their activity name.
  * X_train.txt: Training set.
  * y_train.txt: Training labels.
  * X_test.txt: Test set.
  * y_test.txt: Test labels.
  * subject_test: subject IDs for test data
  * subject_train: subject IDs for train data
  
###features.txt
All through the text, you will see terms like: t, f, Body, Acc, Mag, Jerk, Gyro, Gravity, Mean, Std, X, Y, Z etc. They could be understood like this:

  * t = time
  * f = frequency
  * Acc = Acceleration
  * Body = Body
  * Mag = Magnitude
  * Jerk = Jerk
  * Gyro = Gyroscope
  * Gravity = Gravity
  * Mean = Mean, average
  * Std = Standard Deviation
  * X, Y, Z = X-axis, Y-axis, Z-axis respectively (measurements were taken along these axes)

So if you see something like **tBodyAccJerkMag**, it stands for **timeBodyAccelerationJerkMagnitude** (I wish I could explain the Physics ;)). There are lot of measurements that were estimated from these readings. But for this data, we will stick with the **mean** (mean, averages) and **std** (standard deviation)

###activity_labels
Links the activity ids with the activity names.

###X_train and X_test
Datasets containing measurements of all features.

###y_train and y_test
Datasets containing just the activity ids.

###subject_test and subject_train
Datasets containing the subject (participant) ids.
  
test participant ids are as follows: 2,4,9,10,12,13,18,20,24.
  
train participant ids are as follows: 1,3,5,6,7,8,11,14,15,16,17,19,21,22,23,25,26,27,28,29,30.

###About the code:
1. Reads in all the required data (Please see files that were used for the assignment).
2. Assigns column names for all the files.
3. Replaces y_test and y_train activity ids with activity names.
4. Creates individual test and train data.
5. Combines the test and train data to form train_test.
6. Extracts variables only on mean and standard deviation measurements.
7. Creates the Mean_Std dataset with subjectid, activityname and all mean and std variables.
8. Groups the above dataset by subjectid and activityname.
9. Uses summarize_each funciton, to summarize each column to extract average (mean) values of data. This is the final **tidy dataset**.
  


