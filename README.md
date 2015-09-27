# Getting-and-Cleaning-Data
Coursera Course project assignment
This repository contains the script (only one script) for run_analysi.R per the requirements of the Course project assignment

**Provided data:** https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
**Full data:** http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#What the code does:
1. The code reads in all the required data: X_test, X_train, y_test, y_train, subject_test, subject_train, features and activity_info files. All are text files.
2. After reading in the files, suitable column names are assigned to all the tables.
3. Test and train data are merged - along with sbjectid and activityname
4. Measurements on mean and standard deviation only are extracted - which is named as final data
5. A tidy data set is obtained from this final data with the mean of all variables per subject per activity and is written to a text files named averages (included in this repository)

