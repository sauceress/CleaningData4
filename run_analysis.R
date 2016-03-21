#Clean up workspace
rm(list=ls())

#import needed libraries

library(data.table)
library(dplyr)
#setwd = "data_cleaning_4/"
##Assume dataset is downloaded and unzipped

##STEP 1: Merges the training and the test sets to create one data set


featureNames <- read.table("UCI HAR Dataset/features.txt")
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activityTrain <- read.table("UCI HAR Dataset/train/Y_train.txt", header = FALSE)
featuresTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activityTest <- read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE)
featuresTest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

colnames(features) <- t(featureNames[2])

colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
completeData <- cbind(features,activity,subject)

## Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.

columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*", names(completeData), ignore.case=TRUE)

requiredColumns <- c(columnsWithMeanSTD, 562, 563)
dim(completeData)

descData <- completeData[,requiredColumns]
dim(descData)

## Step 3 Uses descriptive activity names to name the activities in the data set

descData$Activity <- as.character(descData$Activity)
for (i in 1:6){
  descData$Activity[descData$Activity == i] <- as.character(activityLabels[i,2])
}

descData$Activity <- as.factor(descData$Activity)

names(descData)

#3 Step 4 Appropriately labels the data set with descriptive variable names.

names(descData)<-gsub("Acc", "Accelerometer", names(descData))
names(descData)<-gsub("Gyro", "Gyroscope", names(descData))
names(descData)<-gsub("BodyBody", "Body", names(descData))
names(descData)<-gsub("Mag", "Magnitude", names(descData))
names(descData)<-gsub("^t", "Time", names(descData))
names(descData)<-gsub("^f", "Frequency", names(descData))
names(descData)<-gsub("tBody", "TimeBody", names(descData))
names(descData)<-gsub("-mean()", "Mean", names(descData), ignore.case = TRUE)
names(descData)<-gsub("-std()", "STD", names(descData), ignore.case = TRUE)
names(descData)<-gsub("-freq()", "Frequency", names(descData), ignore.case = TRUE)
names(descData)<-gsub("angle", "Angle", names(descData))
names(descData)<-gsub("gravity", "Gravity", names(descData))

names(descData)

descData$Subject <- as.factor(descData$Subject)
descData <- data.table(descData)


## Step 4 creates a second, independent tidy data set with the average of each variable for 
## each activity and each subject.

tidyData <- aggregate(. ~Subject + Activity, descData, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
write.csv(tidyData, file = "Tidy.csv", row.names = FALSE)

library(knitr)
knit2html("codebook.md")