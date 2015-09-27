##Name: Nagateja Tadepalli
##Course: Getting and Cleaning Data Course Programming Assignment

##Provided data https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Create one R script run_analysis.R that does the following:
##Step 1. Merges the training and the test sets to create one data set.
##Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##Step 3. Uses descriptive activity names to name the activities in the data set
##Step 4. Appropriately labels the data set with descriptive variable names. 
##Step 5. From the data set in step 4, creates a second, independent tidy data set with the 
##    average of each variable for each activity and each subject.

library(dplyr)

##Reading in all the files
Xtest<-read.table("UCI HAR Dataset\\X_test.txt")
Xtrain<-read.table("UCI HAR Dataset\\X_train.txt")
Ytest<-read.table("UCI HAR Dataset\\y_test.txt")
Ytrain<-read.table("UCI HAR Dataset\\y_train.txt")
activity<-read.table("UCI HAR Dataset\\activity_labels.txt")
features<-read.table("UCI HAR Dataset\\features.txt")
subjectest<-read.table("UCI HAR Dataset\\subject_test.txt")
subjectrain<-read.table("UCI HAR Dataset\\subject_train.txt")

##Giving column names to activity table
colnames(activity)<-c("activityid", "activityname")

##Giving column names to subject test and train; Ytest and train; X test and train
colnames(subjectest)<-"subjectid"
colnames(subjectrain)<-"subjectid"
colnames(Ytest)<-"activityid"
colnames(Ytrain)<-"activityid"
colnames(Xtest)<-features[,2]
colnames(Xtrain)<-features[,2]

##Step3: Assigning descriptive activity names

##Replacing Ytrain and test activityid with activityname
Ytest[,1]<-activity[Ytest[,1],2]
Ytrain[,1]<-activity[Ytrain[,1],2]

##Renaming column names of Ytest and Ytrain or giving correct column names
colnames(Ytest)<-"activityname"
colnames(Ytrain)<-"activityname"

##Column binding Xtest, ytest and subjectest
test_data<-cbind(subjectest, Ytest, Xtest)

##Column binding Xtrain, ytrain and subjectrain
train_data<-cbind(subjectrain, Ytrain, Xtrain)

##Step1: Combine test and train data

##Row bind train and test data to form train_test
train_test<-rbind(train_data, test_data)

##Step2: Extract only mean and td variables

##Extracting all mean and std variables
indices<-grep("(mean|std)\\(\\)", colnames(train_test))

##Gathering required columns based on last step
Mean_Std<-train_test[,indices]

##Column binding required data
finaldata<-cbind(train_test[,1:2], Mean_Std)

##Step4: Appropriately labeling the dataset

##Cleaning variable names
colnames(finaldata)<-gsub("-", "", colnames(finaldata))
colnames(finaldata)<-gsub("mean", "Mean", colnames(finaldata))
colnames(finaldata)<-gsub("std", "Std", colnames(finaldata))
colnames(finaldata)<-gsub("\\()", "", colnames(finaldata))
colnames(finaldata)<-gsub("BodyBody", "Body", colnames(finaldata))

##Step5: Creating a tidy dataset with the means of all columns

#Grouping data and summarizing mean values of means and stds to create a tidy dataset
finaldata_grouped<-group_by(finaldata, subjectid, activityname)
tidydata<-summarize_each(finaldata_grouped, funs(mean))

##Writing tidydata to a text file
write.table(tidydata, "averages.txt", row.name=FALSE)
