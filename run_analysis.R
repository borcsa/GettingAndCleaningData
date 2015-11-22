######################################
## Coursera - Getting & Cleaning Data
## Course Project
##************************************
## Author: Borbala Tasnadi
######################################


## Set source folder of "UCI HAR Dataset" 
## as your working directory
setwd("/home/bori/Desktop/Coursera/03_GCD/Project/UCI HAR Dataset")


######################################
##   STEP 1, 3, 4
######################################

######################################
##   Read Test Data
######################################

## Read in features 
featPath <- testPath <- paste(getwd(), "features.txt", sep = "/")
features <- unlist(read.table(featPath, colClasses = list(NULL, "character"), nrows = 600))
## Read in test data
testPath <- paste(getwd(), "test/X_test.txt", sep = "/")
test <- read.table(testPath, colClasses = "numeric", nrows = 3000)
## Set features as column names --> STEP 4
colnames(test) <- features

## Read in activity labes column
testLabPath <- paste(getwd(), "test/y_test.txt", sep = "/")
testActLabs <- read.table(testLabPath, colClasses = "numeric", nrows = 3000)
## Read in activity names
labelMapPath <- testLabPath <- paste(getwd(), "activity_labels.txt", sep = "/")
activities <- read.table(labelMapPath, colClasses = list(NULL, "character"))
## Factorize activity column --> STEP 3
Activity <- factor(unlist(testActLabs), labels = unlist(activities))

## Read in subject ID column
testSubjPath <- paste(getwd(), "test/subject_test.txt", sep = "/")
subjects <- read.table(testSubjPath, col.names = "SubjectID", colClasses = "numeric", nrows = 3000)

## Bind test data columns together
testTab <- cbind(subjects, Activity, test)

## Remove unnecessary data sets
rm(subjects, Activity, testActLabs, test)


###################################
##   1.2 Read Train Data
###################################

## Read in test data
trainPath <- paste(getwd(), "train/X_train.txt", sep = "/")
train <- read.table(trainPath, colClasses = "numeric", nrows = 3000)
## Set features as column names --> STEP 4
colnames(train) <- unlist(features)

## Read in activity labes column
trainLabPath <- paste(getwd(), "train/y_train.txt", sep = "/")
trainActLabs <- read.table(trainLabPath, colClasses = "numeric", nrows = 3000)
## Factorize activity column
Activity <- factor(unlist(trainActLabs), labels = unlist(activities))

## Read in subject ID column
trainSubjPath <- paste(getwd(), "train/subject_train.txt", sep = "/")
subjects <- read.table(trainSubjPath, col.names = "SubjectID", colClasses = "numeric", nrows = 3000)

## Bind test data columns together
trainTab <- cbind(subjects, Activity, train)

## Remove unnecessary data sets
rm(subjects, Activity, trainActLabs, train)


####################################
## 1.3  Merge Train & Test Data
####################################

allData <- rbind(testTab, trainTab)


####################################
## STEP 2: Extraxt Mean & Std Data
####################################

## Create list of columns to select:
selectedFeat <- features[grepl("mean()", features, fixed = TRUE) | grepl("std()", features, fixed = TRUE)]
colList <- append(c("SubjectID", "Activity"), selectedFeat)

meanStd <- allData[, colList]


####################################
## STEP 3: Descr. Activity Names
####################################

## See Step 1, line 61-65


####################################
## STEP 4: Descr. Variable Names
####################################

## See Step 1
## First two columns are named "SubjectID" and "Activity";
## the feature column names are descriptive.


####################################
## STEP 5: Summary
####################################

library(dplyr)

## Group the extracted data set from step 3
## by subject and activity
grouped <- group_by(meanStd, SubjectID, Activity)
## Take avarege of each feature column,
## for each subject and activity
averages <- summarize_each(grouped, funs(mean))
