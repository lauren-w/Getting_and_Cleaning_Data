setwd("P:/Learning Materials/Getting and Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

## Part 1:  Merges the training and the test sets to create one data set
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/Y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/Y_test.txt")
subject_test <- read.table("test/subject_test.txt")

x_data <-rbind(x_test, x_train)
y_data <-rbind(y_test, y_train)
subject_data <- rbind(subject_test, subject_train)

## Part 2:  Extracts only the measurements on the mean and standard deviation 
##          for each measurement
features <- read.table("features.txt")

mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

x_data <- x_data[, mean_and_std_features] 

names(x_data) <- features[mean_and_std_features, 2]

## Part 3:   Uses descriptive activity names to name the activities in the data set\
activities <- read.table("activity_labels.txt")

y_data[, 1] <- activities[y_data[, 1], 2]

names(y_data) <- "activity"

## Part 4:  Appropriately labels the data set with descriptive variable names
names(subject_data) <- "subject"

complete_data <- cbind(subject_data, y_data, x_data)

## Part 5:  From the data set in step 4, creates a second, independent tidy 
##        data set with the average of each variable for each activity and 
##        each subject
library(plyr)
averages <- ddply(complete_data, .(subject, activity), function(x) colMeans(x[, 3:68]))

write.table(averages, "averages.txt", row.name=FALSE)
