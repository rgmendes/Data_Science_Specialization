## 1 - Check if the directory exists and downloads the project dataset.

if(!file.exists("UCI HAR Dataset")){
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./dataset_project.zip", mode="wb")
unzip("./dataset_project.zip")
file.remove("./dataset_project.zip")
}

## 2 - Load the required libraries for the project

library(dplyr)
library(plyr)
library(data.table)

## 3 - Assignment of identifiers

features <- fread("./UCI HAR Dataset/features.txt")
activity_labels <- fread("./UCI HAR Dataset/activity_labels.txt", col.names = c("codeActivity", "labelActivity"))

## 4- Assignment of test data for the field "test"

X_test <- fread("./UCI HAR Dataset/test/X_test.txt")
y_test <- fread("./UCI HAR Dataset/test/y_test.txt", col.names = "Activity")
subject_test <- fread("./UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
test <- bind_cols(subject_test, y_test, X_test)

## 5 - Assignment of train data for the field "train"

X_train <- fread("./UCI HAR Dataset/train/X_train.txt")
y_train <- fread("./UCI HAR Dataset/train/y_train.txt", col.names = "Activity")
subject_train <- fread("./UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
train <- bind_cols(subject_train, y_train, X_train)

## 6 - Merge the data fields "test" and "train" a new field "merge"

merge <- as.data.frame(bind_rows(train, test))

## 7 - Add dataset name tags descriptive variables in the "features"

names(merge)[c(3:length(merge))] <- features$V2

## 8 - Filter only the columns containing "mean" and "std" and cleaning values column

merge <- bind_cols(merge[,c(1:2)], merge[grepl("mean|std",names(merge))])
names(merge) <- gsub('[-()]', '', names(merge))
names(merge) <- gsub('-std', 'Std', names(merge))
names(merge) <- gsub('-mean', 'Mean', names(merge))

## 9 - Uses descriptive activity names to name the activities in the data set

merge$Activity <- activity_labels$labelActivity[match(merge$Activity, activity_labels$codeActivity)]

## 10 - Create a new dataset with the average of each variable for each unique values of "Subject" and "Activity". The result is saved in the file "tidy_data.txt"

merge$Subject <- as.factor(merge$Subject)
merge$Activity <- as.factor(merge$Activity)

tidy_data <- ddply(merge,.(Subject,Activity), function(x) colMeans(x[, 3:length(x)]))
tidy_data <- arrange(tidy_data, Subject)
write.table(tidy_data, "./tidy_data.txt", row.names = FALSE)
