library(tidyr)
library(dplyr)
library(digest)
library(utils)

### Configuration variables
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
expected_hash = "566456a9e02a23c2c0144674d9fa42a8b5390e71"

### Download the raw data
# Create directory to store data if it doesn't already exist
if (!dir.exists("data")) {
  dir.create("data")
}

## Download the source dataset if not already present locally
if (!file.exists("data/dataset.zip")) {
  download.file(url = url,destfile = "data/dataset.zip")
}

## Check the sha1 of the dataset to ensure it hasn't been modifyed/updated from the version used to build this script
if (expected_hash != digest("data/dataset.zip",algo="sha1",serialize = FALSE, file = TRUE)) {
  warning("dataset.zip did not match expected hash")  
}

## Unpack the raw data from the .zip file
if (dir.exists("unpack")) {
  unlink("unpack",recursive = TRUE)
}
unzip("data/dataset.zip",exdir="unpack")

### Process Activity label data
activityLabels <- read.table("unpack/UCI HAR Dataset/activity_labels.txt", col.names=c("ActivityId","ActivityName"))

### Process Feature names (will become column names for data read later)

# Read features from text file
features <- read.table("unpack/UCI HAR Dataset/features.txt", col.names=c("Position","FeatureName"))

# Keep only the standard deviation and mean features
features <- features[grep("(std|mean)\\(\\)(-|$)",features$FeatureName),]

# Expand various abbreviations in feature names
features$FeatureName <- sub("^f","frequency",features$FeatureName)
features$FeatureName <- sub("^t","time",features$FeatureName)
features$FeatureName <- sub("Acc","Accelerometer",features$FeatureName)
features$FeatureName <- sub("Gyro","Gyroscope",features$FeatureName)
features$FeatureName <- sub("Mag","Magnitude",features$FeatureName)

# Fix typo in feature name
features$FeatureName <- sub("BodyBody","Body",features$FeatureName)

# Remove '-' characters from feature names
features$FeatureName <- sub("-std","Std",features$FeatureName)
features$FeatureName <- sub("-mean","Mean",features$FeatureName)
features$FeatureName <- sub("-([XYZ])","\\1",features$FeatureName)

# Remove '(' and ')' from feature names
features$FeatureName <- sub("\\(\\)","",features$FeatureName)

### Process test dataset
# Read list of subjects
testSubject <- read.table(file="unpack/UCI HAR Dataset/test/subject_test.txt", col.names = c("SubjectId"))

# Read list of activities
testY <- read.table("unpack/UCI HAR Dataset/test/Y_test.txt", col.names = c("ActivityId"))

# Read list of measurements
testX <- read.table("unpack/UCI HAR Dataset/test/X_test.txt")

# Drop columns other than std/mean
testX <- testX[,features$Position]

# Apply names to the measurements
names(testX) <- features$FeatureName

# Combine subject, measurement, and activity data
testSet <- cbind(testSubject,testX,testY)

# Replace Activity codes with descriptions
testSet <- merge(activityLabels,testSet) %>% select(-c("ActivityId"))


### Process training dataset
# Read list of subjects
trainSubject <- read.table("unpack/UCI HAR Dataset/train/subject_train.txt", col.names = c("SubjectId"))

# Read list of activities
trainY <- read.table("unpack/UCI HAR Dataset/train/Y_train.txt", col.names = c("ActivityId"))

# Read list of measurements
trainX <- read.table("unpack/UCI HAR Dataset/train/X_train.txt")

# Drop columns other than std/mean
trainX <- trainX[,features$Position]

# Apply names to the measurements
names(trainX) <- features$FeatureName

# Combine subject, mesurement, and activity data
trainSet <- cbind(trainSubject,trainX,trainY)

# Replace Activity codes with descriptions
trainSet <- merge(activityLabels,trainSet) %>% select(-c("ActivityId"))

### Combine training and test datasets
output <- rbind(testSet,trainSet)

### Create tidy data set
tidySet <- output %>% 
  pivot_longer(-c("SubjectId","ActivityName"),names_to = "Feature")

### Calculate average for each Value for each Subject and Activity
avgSet <- tidySet %>%
  group_by(SubjectId,ActivityName,Feature) %>%
  summarize(AverageValue=mean(value))

write.table(avgSet, file = "output.txt", row.name = FALSE)