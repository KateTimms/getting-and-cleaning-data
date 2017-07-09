## ReadMe for Getting and Cleaning Data course assignment

The script for the creating the tidy dataset ([run_analysis.R](https://github.com/KateTimms/getting-and-cleaning-data/blob/master/run_analysis.R)) can be found in this repository.

## How the Tidy Data Table was Created
All of the following steps were conducted in RStudio, useing R 3.4.0.

The data was first downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip as a zip file, which was then unzipped. Next, the features which described the variable column names were imported from features.txt. The same was done for activity names from activity_labels.txt. Next the subject numbers (subject_train.txt or subject_test.txt), feature measurements (X_train.txt or X_test.txt), and activity numbers (Y_train.txt or Y_test.txt) were impored useing read.delim. Tables were then created usieng cbind for each of the training and test datasets (i.e. for test, the tables created from importing subject_test.txt, X_test.txt and Y_test.txt were bound together into one table). 

Next descriptive names were given to the columns/variables (see Variables above). The train and test tables were then bound together useing rbind. Next, the activity lables were assigned to the activityname variable by merging with the activity labels table previously imported. After being used to match with the activityname column, the column containing the activity numbers was removed.

To select just the mean and standard deviation measurements for each feature variable, grepl was used.

Finally, the table was melted to a long, thin table containing subject and activityname as ids and all other previous columns (the features) as measuremnt variables. Next the final summary table was created useing dcast for the ids subject and activityname, where the mean was mean was calculated for each measurement variable. The table was then written to TidyDataTable.txt.