##### ============= Getting and Cleaning Data Course Project ===================
##
##  This Program is intended to:
##      1.  Download the Human Activity Recognition Using Smartphones DataSet
##          from the source
##      2.  Prepare a tidy dataset that can be used for further analysis.
##
##
##  Load the libraries
library(plyr)
library(dplyr)
library(tidyr)

rm(list = ls())

## Download the data set
setwd("~\\Coursera\\GettingandCleaningData\\Assignment2")
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "dataset.zip")
unzip("dataset.zip", exdir=".")

##### ============================  Q1. ========================================
##  Merge the training and the test data together into one file
##  Read the data result tables into memory and bind them into one data set
##
train_x <- read.table("UCI HAR Dataset\\train\\X_train.txt", header = FALSE)
test_x <- read.table("UCI HAR Dataset\\test\\X_test.txt", header = FALSE)
mergedResultData <- rbind(train_x,test_x)

##  Use the features.txt file to name the columns of the data set (data table)
##  Read in the column names provided in the features.txt file
columnNames <- read.table("UCI HAR Dataset\\features.txt", header = FALSE)

## Replace the merged data column names with names read in from features.txt
colnames(mergedResultData) <- columnNames$V2

##### ============================  Q2. ========================================
##  Take a subset of the data, only keeping columns that contain the terms
##  mean or std (this is the extract data portion of the assignment)
##  find all the columns that contain either mean or std, and keep only those
##  columns
##
mean_std_colnames <- grep("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]"
                          , colnames(mergedResultData))
dataSubset <- mergedResultData[,mean_std_colnames]

##  Merge the Activity training and test data together into one file
train_activity_y <- read.table("UCI HAR Dataset\\train\\Y_train.txt"
                               , header = FALSE)
test_activity_y <- read.table("UCI HAR Dataset\\test\\Y_test.txt"
                              , header = FALSE)

##  Read the activity type tables in, and bind them into one data set
train_test_activity_y <- rbind(train_activity_y, test_activity_y)

##  Read in the activity labels provided by the data set
activityLabels <- read.table("UCI HAR Dataset\\activity_labels.txt"
                             , header=FALSE)

##### ============================  Q3. ========================================
##  Use descriptive activity names to name the activities in the data set
##
train_test_activityLabels <- merge(x=train_test_activity_y, y=activityLabels
                                   , by="V1", all.y = TRUE)
train_test_activityLabels <- subset(train_test_activityLabels, select=V2)
names(train_test_activityLabels) <- "Activity"

##### ============================  Q4. ========================================
##  Appropriately label the data set by binding the activity labels to the
##  numeric data frame
##
##  Column-wise bind the dataSubset dataset with the train_test_activity_y dataset
dataSubsetWithActivity <- cbind(train_test_activityLabels, dataSubset)

##### ============================  Q5. ========================================
##  Create an independent tidy data set with the average of each variable
##  for each variable for each activity and each subset.
##
##  Merge the training and test subject data into one data frame and bind it

##  Read in the training and test Subject Number data
train_subject <- read.table("UCI HAR Dataset\\train\\subject_train.txt"
                          , header = FALSE)
test_subject <- read.table("UCI HAR Dataset\\test\\subject_test.txt"
                         , header = FALSE)

##  Merge the training and test subject number data and rename the column
mergedSubjectNumbers <- rbind(train_subject, test_subject)
colnames(mergedSubjectNumbers) <-"TestSubjectNumber"

##  Bind the test subject number to the rest of the data
dataSubsetWithActivity_SubjectNumber <- cbind(mergedSubjectNumbers
                                              , dataSubsetWithActivity)

##  Re-order first and second columns to reflect how grouping will be done later
dataSubsetWithActivity_SubjectNumber <- dataSubsetWithActivity_SubjectNumber[c(2,1,3:88)]

##  Take the mean of each activity type, for all columns and generate output file
##  Aggregate the variables by the Activiy and Subject variables to evaluate the
##  mean of the columns first by Activity and second by Subject number
meanResults <- aggregate(. ~ Activity + TestSubjectNumber
                         , data=dataSubsetWithActivity_SubjectNumber, FUN=mean)
meanResults <- meanResults %>%
                                group_by( Activity) %>%
                                arrange(Activity) %>%
                                as.data.frame()

##  Rename the variables to reflect that they are now mean values (mean of
##  means or standard deviations)
colnames(meanResults) <- paste("MEAN_OF", colnames(meanResults), sep = "_")
colnames(meanResults)[1]<-"Activity_Type"
colnames(meanResults)[2]<-"Test_Subject_Number"

## Save the files in csv format
## Save the first, non-aggregated file
write.csv(dataSubsetWithActivity_SubjectNumber, file = "DataSet1.csv"
            , row.names = FALSE)

## Save the data set with the aggregated means and standard deviations w.r.t
## Activity and Groups
write.csv(meanResults, file = "MeanResults.csv", row.names = FALSE)
##### ==========================    END OF LINES    ============================
