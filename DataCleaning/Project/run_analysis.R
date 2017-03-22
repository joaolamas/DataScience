library(data.table)

# set current file location as working directory (the file must be placed one level up from the dataset folder):
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# data folder directories
folder_data_set <- "UCI HAR Dataset"
folder_data_train <- "UCI HAR Dataset/train"
folder_data_test <- "UCI HAR Dataset/test"

# 'activity_labels.txt': Links the class labels with their activity name:
activity <- read.table(file.path(folder_data_set, 'activity_labels.txt'), col.names=c('id', 'activity'))
# 'features.txt': List of all features:
features <- read.table(file.path(folder_data_set, 'features.txt'), col.names=c('id', 'feature'))

# 2.Appropriately labels the data set with descriptive variable names.
# Clean features names - tidy set:
features$feature <- gsub("-", "", features$feature)
features$feature <- gsub("^t", "Time", features$feature)
features$feature <- gsub("^f", "Frequency", features$feature)
features$feature <- gsub("mean", "Mean", features$feature)
features$feature <- gsub("std", "Std", features$feature)
features$feature <- gsub("min", "Min", features$feature)
features$feature <- gsub("max", "Max", features$feature)
features$feature <- gsub("energy", "Energy", features$feature)
features$feature <- gsub("entropy", "Entropy", features$feature)
features$feature <- gsub("gravity", "Gravity", features$feature)
features$feature <- gsub("sma", "Sma", features$feature)
features$feature <- gsub("mad", "Mad", features$feature)
features$feature <- gsub("iqr", "Iqr", features$feature)
features$feature <- gsub("correlation", "Correlation", features$feature)
features$feature <- gsub("skewness", "Skewness", features$feature)
features$feature <- gsub("kurtosis", "Kurtosis", features$feature)
features$feature <- gsub("bands", "Bands", features$feature)
features$feature <- gsub("angle", "Angle", features$feature)
features$feature <- gsub("\\(\\)", "", features$feature)
features$feature <- gsub("\\(", "", features$feature)
features$feature <- gsub("\\)", "", features$feature)
features$feature <- gsub("tBody", "TimeBody", features$feature)
features$feature <- gsub(",([0-9])", ".\\1", features$feature)
features$feature <- gsub(",([a-z])", "\\1", features$feature)
features$feature <- gsub(",([a-z])", "\\1", features$feature)
features$feature <- gsub(",", "", features$feature)

# Train
# 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30:
train_subject <- read.table(file.path(folder_data_train, 'subject_train.txt'), col.names=c('Subject') )
# 'train/y_train.txt': Training labels:
train_label <- read.table(file.path(folder_data_train, 'y_train.txt'), col.names=c('id'))
#'train/X_train.txt': Training set:
train_set <- read.table(file.path(folder_data_train, 'X_train.txt'))

# Test
# 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30:
test_subject <- read.table(file.path(folder_data_test, 'subject_test.txt'),  col.names=c('Subject'))
# 'test/y_test.txt': Testing labels:
test_label <- read.table(file.path(folder_data_test, 'y_test.txt'), col.names=c('id'))
# 'test/X_test.txt': Testing set:
test_set <- read.table(file.path(folder_data_test, 'X_test.txt'))

# 1.Merges the training and the test sets to create one data set.
# Merge both datasets:
set <- rbind(train_set, test_set)
# Merge labels:
labels <- rbind(train_label, test_label)
# Merge subjects:
subjects <- rbind(train_subject, test_subject)

# Column names:
colnames(set) <- features$feature

# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
new_cols <- c()
for (i in features$feature){
  if (any(grep('Mean', i))){
    #print(i)
    new_cols <- c(new_cols,  i)
  }
  if (any(grep('Std',i))){
    #print(i)
    new_cols <- c(new_cols,  i)
  }
}
set <- set[, new_cols]

# 3.Uses descriptive activity names to name the activities in the data set
# define the descriptive activity:
set_activity <- data.frame(Activity=as.character(factor(labels$id, label=activity$activity)))
set <- cbind(subjects, set_activity, set)

# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
set <- data.table(set)
final_set <- set[,lapply(.SD, mean), by=c('Subject', 'Activity')]

write.table(final_set, file="set.txt", row.names=FALSE ) 

