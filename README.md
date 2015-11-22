Getting & Cleaning Data Course Project
Author: Borbala Tasnadi

# README

## Introduction

This project is about cleaning and summarizing the data set available under the following link

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .

For information about the data, please read the README file contained in the above zip file.


## Project Content:
run-analysis.R:	R-code to process the above data


## Summary
The whole process can be summarized in five steps:
* Merging the training and the test sets to create one data set.
* Using descriptive activity names to name the activities in the data set
* Labeling the data set with descriptive variable names.
* Extracting only the measurements on the mean and standard deviation for each measurement. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Steps 1-3

Both for the training and for the test set we had three seperate data files available:
* x_train.txt / x_test.txt: containing measurment outcome of the training/ test data;
* subject_train.txt/ subjecr_test.txt: containing a vector of subject ID mapping each observation to the subject it was made about;
* y_train.txt/ y_test.txt: containing a vector integers indicating the activity for each observation.
First, we read in each text file one by one and and follow steps 2 and 3. Eventually, we merge all the data into one big data set.

For more information about the proceess, see the commented 'run_analysis.R' file.


## Running the project

To o run the project, place the downloaded data in you working directory. Then open the 'run_analysis.R' file and change the working directory to your own. After that, you can run the code.



