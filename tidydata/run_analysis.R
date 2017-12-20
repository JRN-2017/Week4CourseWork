library(dplyr)
library(datasets)
library(reshape2)

fileName <- "getdata_dataset.zip"

# Download  the zip file dataset
if (!file.exists(fileName)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, mode='wb')
}  
# Extract the datasets by unzipping
if (!file.exists("UCI HAR Dataset")) { 
  unzip(fileName) 
}

# Load the training datasets
xTrainData <- read.table("UCI HAR Dataset/train/X_train.txt")
yTraindata <- read.table("UCI HAR Dataset/train/y_train.txt")
subTrainData <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Merge the training data
trainData <- cbind(subTrainData, yTrainData, xTrainData)

# Load testing datasets
xTestData <- read.table("UCI HAR Dataset/test/X_test.txt")
yTestData <- read.table("UCI HAR Dataset/test/Y_test.txt")
subTestData <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge the testing data
testData <- cbind(subTestData, yTestData, xTestData)

#----------------------------------------------------------------------------------------------------------

# Step 1 Merges the training and the test sets to create one data set
allData <- rbind(trainData, testData)
str(allData)
#----------------------------------------------------------------------------------------------------------

# prep for step 2 to selected specific features.

# Load activity labels 
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])

# Load feature labels 
featureLabels <- read.table("UCI HAR Dataset/features.txt")
featureLabels[,2] <- as.character(features[,2])

# get labels of needed varbles -  mean and standard deviation
featuresWanted <- grep(".*mean.*|.*std.*", featureLabels[,2])
featuresWanted.names <- featureLabels[featuresWanted,2]
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)

#----------------------------------------------------------------------------------------------------------

# step 2 Extracts only the measurements on the mean and standard deviation for each measurement
allMeanStdData <- allData[featuresWanted]

#----------------------------------------------------------------------------------------------------------

# Step 4 Appropriately labels the data set with descriptive variable names
colnames(allData) <- c("subject", "activity", featuresWanted.names)

#----------------------------------------------------------------------------------------------------------

# Step 3 Uses descriptive activity names to name the activities in the data set
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
allData$subject <- as.factor(allData$subject)

#----------------------------------------------------------------------------------------------------------

# Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.
allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)

#----------------------------------------------------------------------------------------------------------
