## Week 4 Programming Assignment Code Book


## Project Description
This project downloaded data provided from activity information gathered from the Samsung Galaxy S smartphone. The site where the data can be obtained is http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Study design and data processing
### Collection of the raw data
According to the README.txt file provided in the UCI HAR Dataset, it mentions that the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

### Dataset
The dataset included the following files: 

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.


### Guide to create the tidy data file
1. Download from the web and extract the zip file into a folder named UCI HAR Dataset
2. Read the files including those in the test folder and train folder using read.table() function.

Assignment Guidelines:

- Merge data using the rbind() function merge subject test and subject train files, x_test and x_train files, and lastly y_test and y_train files.

- rename columns

- final merge of the data using cbind() function to combine previously merged subject, x , and y files

- Extracts just the mean and standard deviation for each measurement

- Use descriptive names to name the activities and replace the labels with descriptive variable names. Switched the columns names of the merged Y data with the activity labels and switch the column names of the merged X data with the features labels

- Create an independent data set with the average of each variable

- Get the mean for the activity and subject

- Export the final tidy data that set that was produced into a text file under "tidy_data.txt"

### Cleaning of the data

The zip file containing the source data is located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The collection and cleaning of the data above were made in to R sript named run_analysis.R. README.md provides additional information on the dataset and project guidelines.
