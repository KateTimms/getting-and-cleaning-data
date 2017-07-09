# Code Book for Getting and Cleaning Data Course Project

This codebook will describe the variables, the tidy data table and how it was produced.

The experiments  to produce the data were carried out with a group of 30 volunteers (numbered 1-30) within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer (Acc) and gyroscope (Gyro), the experimenters captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually.

## Variables
In the tidy data table, 81 column variables.
1. subject - column containing the subject numbers
2. activityname - column containing, for each subject, the activity names as follows
...* LAYING
...* Sitting
...* STANDING
...* WALKING
...* WALKING_DOWNSTAIRS
...* WALKING_UPSTAIRS
3-81. For each of the following, there are three six columns. They consist of the mean and standard deviation for each movement, on each of the X, Y and Z directions (e.g. tBodyAcc-mean()-X) where appropriate. Each column consists of the mean of the values for that varable for each subject, broken down by activity:
...1. tBodyAcc-XYZ
...2. tGravityAcc-XYZ
...3. tBodyAccJerk-XYZ
...4. tBodyGyro-XYZ
...5. tBodyGyroJerk-XYZ
...6. tBodyAccMag
...7. tGravityAccMag
...8. tBodyAccJerkMag
...9. tBodyGyroMag
...10. tBodyGyroJerkMag
...11. fBodyAcc-XYZ
...12. fBodyAccJerk-XYZ
...13. fBodyGyro-XYZ
...14. fBodyAccMag
...16. fBodyAccJerkMag
...17. fBodyGyroMag
...18. fBodyGyroJerkMag

## The Tidy Data Table
The tidy data table breaks down each movement measurement (variables 3-81) by subject and activity, giving the mean value for each. This summarises the data in a tidy, easy to read/analyse format.

## How the Tidy Data Table was Created
All of the following steps were conducted in RStudio, useing R 3.4.0.

The data was first downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip as a zip file, which was then unzipped. Next, the features which described the variable column names were imported from features.txt. The same was done for activity names from activity_labels.txt. Next the subject numbers (subject_train.txt or subject_test.txt), feature measurements (X_train.txt or X_test.txt), and activity numbers (Y_train.txt or Y_test.txt) were impored useing read.delim. Tables were then created usieng cbind for each of the training and test datasets (i.e. for test, the tables created from importing subject_test.txt, X_test.txt and Y_test.txt were bound together into one table). 

Next descriptive names were given to the columns/variables (see Variables above). The train and test tables were then bound together useing rbind. Next, the activity lables were assigned to the activityname variable by merging with the activity labels table previously imported. After being used to match with the activityname column, the column containing the activity numbers was removed.

To select just the mean and standard deviation measurements for each feature variable, grepl was used.

Finally, the table was melted to a long, thin table containing subject and activityname as ids and all other previous columns (the features) as measuremnt variables. Next the final summary table was created useing dcast for the ids subject and activityname, where the mean was mean was calculated for each measurement variable. The table was then written to TidyDataTable.txt.

Finally, the