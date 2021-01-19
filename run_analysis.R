library(dplyr)

## download files from coursera
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile="./data/Dataset.zip", method = "curl")

## check if file exists and unzip file
if (!file.exists("UCI HAR Dataset")) {
  unzip(zipfile="./data/Dataset.zip",exdir="./data")
}

##read files
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")

## read files in test folder
subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")

##read files in train folder
subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

## Part 1
## Merges the training and the test sets to create one data set.
mergedSubject <- rbind(subjectTest, subjectTrain)
mergedX <-rbind(x_test, x_train)
mergedY <-rbind(y_test, y_train)


##name columns
colnames(mergedSubject) <- "subject"
colnames(mergedX) <- "x label"
colnames(mergedY) <- "y label"

##final merge of all the data
finalMerge <- cbind(mergedSubject, mergedX, mergedY)

## Part 2
## extract the mean and standard deviation for each measurement
mean_std <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]

## Part 3
## use descriptive names to name the activities
## Switch the column names for mergedY data to the activity labels
colnames(mergedY) <- "activity"
mergedY$activityName <- factor(mergedY$activity, labels = as.character(activities[,2]))
activityName <- mergedY[,-1]

## Part 4
## Appropriately labels the data set with descriptive variable names.
## Switch the columns names for mergedX data into the features labels
colnames(mergedX) <- features[selected_var[,1],2]

## Part 5
## Creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.
total <- cbind(mergedX, activityName, mergedSubject)
meanOfData <- total %>% 
  group_by(activityName, subject) %>% 
  summarise_each(tibble::lst(mean))
write.table(total, file = "./tidy_data.txt", row.names = FALSE)
