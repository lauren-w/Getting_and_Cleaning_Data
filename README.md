#run_analysis.R:  
This R script first combines the test and training data sets from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

It then removes all variables except those that pertain to the average or standard deviation

The variables are more appropriately named, so it is clear what the data set contains.

Finally, a secondary data set is created that contains the average of each variable for each activity/subject combination.


