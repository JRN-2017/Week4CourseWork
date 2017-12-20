# Getting and Cleaning Data - Course work
# This file explains what are the course work done sequentially
Item 1. Merges the training and the test sets to create one data set.
 * There were two data sets training and test data
 * Also there were labels and activities as data sets
 * All these were avialble in txt file format
 * First all training data are merged usuing cbind
 * Then all the test data are merged using cbind
 * Lastly both the traning and testing data are merged to one data set using rbind
Item 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 * Load activity labels 
 * Load feature label
 * Got labels of needed varbles -  mean and standard deviation 
 * Extracted only the measurements on the mean and standard deviation for each measurement 
Item 3. Uses descriptive activity names to name the activities in the data set 
 * To do this step 4 was done first and then followed Step 3. 
 * First the appropriate labels were assigned  
 * Then the activity name is assigned
Item 4. Appropriately labels the data set with descriptive variable names.
 * Appropriately labels the data set with descriptive variable names is done.
Item 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
 *  Melted the data with respect to subject and activity
 *  Then the mean is found out
 *  Then that outcome from above is write in to a text file tidy.txt using write.table
