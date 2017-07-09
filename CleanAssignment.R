## Create directory for data
dir.create("cleandata")
setwd("cleandata")
## Download file into the created directory
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, "data.zip")
## Unzip and enter the directory inside
unzip("data.zip")
setwd("UCI HAR Dataset")
## Load required data packages
library(dplyr)
library(data.table)
library(reshape2)
## Read the features into R
features <- read.delim("./features.txt", sep = "", header = FALSE)
colnames(features) <- c("number", "feature")
columnnames <- c("subject", as.character(features$feature), "activity")
## Read activities into R
activities <- read.delim("./activity_labels.txt", sep = "", header = FALSE)
colnames(activities) <- c("number", "activityname")
## Read the training data into R and bind together in columns into traintable date frame
subject_train <- read.delim("./train/subject_train.txt", header = FALSE)
X_train <- read.delim("./train/x_train.txt", sep = "", header = FALSE)
Y_train <- read.delim("./train/Y_train.txt", header = FALSE)
traintable <- cbind(subject_train,X_train,Y_train)
colnames(traintable) <- columnnames
## Read the test data into R and bind together in columns into testtable date frame
subject_test <- read.delim("./test/subject_test.txt", header = FALSE)
X_test <- read.delim("./test/x_test.txt", sep = "", header = FALSE)
Y_test <- read.delim("./test/Y_test.txt", header = FALSE)
testtable <- cbind(subject_test,X_test,Y_test)
colnames(testtable) <- columnnames
## Bind two tables together, assign activity names and extract means and standard deviation
table <- rbind(traintable,testtable)
table <- merge(table,activities, by.x = "activity", by.y = "number")
table <- table[,grepl("subject|.mean.|.std.|activityname", names(table))]
## Summarise the table for each subject and activity
tablemelt <- melt(table, id=c("subject", "activityname"), measure.vars=c(names(table)[-c(1,81)]))
subjectsummary <- dcast(tablemelt, subject ~ variable, mean)
summary <- dcast(tablemelt, subject + activityname ~ variable, mean)
write.table(summary,"TidyDateTable.txt", row.name=FALSE, quote = FALSE)