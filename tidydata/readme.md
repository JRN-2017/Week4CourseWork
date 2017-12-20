# Getting and Cleaning Data - Course Project
## The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
## The goal is to prepare tidy data that can be used for later analysis.
Item 1 Merges the training and the test sets to create one data set.
* Load the training datasets
* Merge the training data
* Load testing datasets 
* Merge the testing data
* Step 1 Merges the training and the test sets to create one data set 

Item 2 Extracts only the measurements on the mean and standard deviation for each measurement.
* Load activity labels 
* Load feature labels  
* get labels of needed varibles -  mean and standard deviation 
* Extracts only the measurements on the mean and standard deviation for each measurement of the needed variables from above.

Item 3 Uses descriptive activity names to name the activities in the data sets
* do step 4 by assigning the appropriate labels for variable names
* assign activity name to an activity code

Item 4 Appropriately labels the data set with descriptive variable names.

Item 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* use the write.table() to write into the text file tidy.txt


