## CodeBook
This document describes the variable definition used in <b>run_analysis.R</b> script to generate the tidy data file (Tidy.csv).

## Data 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Merges the training and the test sets to create one data set.
<ul></ul>
  <li>featuresTrain stored data from X_train.txt</li>
  <li>activityTrain stored data from Y_train.txt</li>
  <li>subjectTrain stored data Data from subject_train.txt</li>
  <li>featuresTest stored data from X_test.txt</li>
  <li>activityTest stored data from Y_test.txt</li>
  <li>subjectTest stored data from subject_test.txt</li>
  <li>featureNames stored data from features.txt</li>
  <li>activityLabels stored data from activity_labels.txt</li>
  <li>subject is the combination of subjects in training and test data </li>
  <li>activity is the combination of activities in training and test data</li>
  <li>features is the combination of feature test and training data</li>


## The input data contains the following data files to be assigned to descriptive variable name:

<ul></ul>
  <li>featureNames is the features properties</li>
  <li>CompleteData is the combination of features, activity and subject</li>


## Extracts only the measurements on the mean and standard deviation for each measurement.
<ul></ul>

  <li>Index columns that contains std or mean and ignore case sensitive and assigned to requiredColumns</li>
  <li>create descData from columns from requiredColumns</li>
  <li>Update descriptive names for activity for Activity column in descData</li>
  <li>Acronyms in descData like 'Mag', 'f' and 't' being replaced with descriptive labels 'Magnitude', 'Frequency' and 'Time'</li>

## Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
<ul></ul>
  <li>tidyData is created based on activity and subjects from descData</li>
  <li>output data from tidyData was writte to a file named Tidy.csv</li>


