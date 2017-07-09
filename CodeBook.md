# Code Book for Getting and Cleaning Data Course Project

This codebook will describe the variables, the tidy data table and how it was produced.

The experiments  to produce the data were carried out with a group of 30 volunteers (numbered 1-30) within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer (Acc) and gyroscope (Gyro), the experimenters captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually.

## Variables
In the tidy data table, 81 column variables.
1. subject - column containing the subject numbers
2. activityname - column containing, for each subject, the activity names as follows: LAYING, Sitting, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
3. Variables 3-81. For each of the following, there are three six columns. They consist of the mean and standard deviation for each movement, on each of the X, Y and Z directions (e.g. tBodyAcc-mean()-X) where appropriate. Each column consists of the mean of the values for that varable for each subject, broken down by activity:
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

## The Tidy Data Table
The tidy data table breaks down each movement measurement (variables 3-81) by subject and activity, giving the mean value for each. This summarises the data in a tidy, easy to read/analyse format.

## How the Tidy Data Table was Created
See [README.md](https://github.com/KateTimms/getting-and-cleaning-data/blob/master/README.md) for explaination of the script for creating the analysis ([run_analysis.R](https://github.com/KateTimms/getting-and-cleaning-data/blob/master/run_analysis.R)).