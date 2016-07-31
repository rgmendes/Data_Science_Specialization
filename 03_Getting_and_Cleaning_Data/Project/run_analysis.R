## Check and download dataset

if(!file.exists("UCI HAR Dataset")){
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./db_project.zip", mode="wb")
unzip("./db_project.zip")
file.remove("./db_project.zip")
list.files("./")
list.files("./UCI HAR Dataset")
}

library(dplyr)
library(plyr)
library(data.table)

features <- fread("./UCI HAR Dataset/features.txt")
activity_labels <- fread("./UCI HAR Dataset/activity_labels.txt", col.names = c("codeActivity", "labelActivity"))

# Test
X_test <- fread("./UCI HAR Dataset/test/X_test.txt")
y_test <- fread("./UCI HAR Dataset/test/y_test.txt", col.names = "Activity")
subject_test <- fread("./UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
test <- bind_cols(subject_test, y_test, X_test)
dim(test)
names(test)

# Train
X_train <- fread("./UCI HAR Dataset/train/X_train.txt")
y_train <- fread("./UCI HAR Dataset/train/y_train.txt", col.names = "Activity")
subject_train <- fread("./UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
train <- bind_cols(subject_train, y_train, X_train)
dim(train)

# Merge Test and Train

merge <- as.data.frame(bind_rows(train, test))

# Add labels the data set with descriptive variable names

names(merge)[c(3:length(merge))] <- features$V2
names(merge) <- gsub('-mean', 'Mean', names(merge))
names(merge) <- gsub('-std', 'Std', names(merge))
names(merge) <- gsub('[-()]', '', names(merge))

# Extracts only the measurements on the mean and standard deviation for each measurement

merge <- bind_cols(merge[,c(1:2)], merge[grepl("Mean|Std",names(merge))])

# Uses descriptive activity names to name the activities in the data set

merge$Activity <- activity_labels$labelActivity[match(merge$Activity, activity_labels$codeActivity)]


# Calcule 
# Transform values em Factor

merge$Subject <- as.factor(merge$Subject)
merge$Activity <- as.factor(merge$Activity)

tidy_data <- ddply(merge,.(Subject,Activity), function(x) colMeans(x[, 3:length(x)]))
write.table(tidy_data, "./tidy_data.txt", row.names = FALSE)
