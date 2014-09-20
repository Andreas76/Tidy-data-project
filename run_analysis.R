############################# Step 1 ######################################
# Merges the training and the test sets to create one data set.

# Note! Please set your working directory to the folder "UCI HAR Dataset".

# Reading in files --------------------------------------------------------
features <- read.delim(file = "features.txt", sep = "", header = FALSE)

subject_test <- read.csv(file = "test/subject_test.txt", header = FALSE, colClasses = "factor", col.names = "Subject")
X_test <- read.table(file = "test/X_test.txt", header = FALSE, col.names = features[[2]])
y_test <- read.csv(file = "test/y_test.txt", header = FALSE, colClasses = "factor", col.names = "Activity")

subject_train <- read.csv(file = "train/subject_train.txt", header = FALSE, colClasses = "factor", col.names = "Subject")
X_train <- read.table(file = "train/X_train.txt", header = FALSE, col.names = features[[2]])
y_train <- read.csv(file = "train/y_train.txt", header = FALSE, colClasses = "factor", col.names = "Activity")

activity_levels <- read.delim(file = "activity_labels.txt", sep = "", header = FALSE)

# Paste together data -----------------------------------------------------
Data_test <- cbind(subject_test, y_test, X_test)
Data_train <- cbind(subject_train, y_train, X_train)
Data <- rbind(Data_test, Data_train)

############################# Step 2 ######################################
# Extracts only the measurements on the mean and standard deviation for each measurement.

# Search and save columns with mean or std data ---------------------------
cols <- numeric(0)

for (i in 3:length(Data)) {
  if (length(grep("std", colnames(Data[i]))) != 0 || length(grep("mean", colnames(Data[i]))) != 0 ||
      length(grep("Mean", colnames(Data[i]))) != 0) { 
    cols <- c(cols, i)
  }
  i =+ i
}

# Sort all remaining columns after re-adding the first two columns --------
cols <- c(cols, 1:2)
cols <- sort(cols)

# Retain columns of interest ----------------------------------------------
Data <- Data[,cols]

############################# Step 3 ######################################
# Uses descriptive activity names to name the activities in the data set.

# Rename the y data using the activity labels -----------------------------
levels(Data$Activity) <- activity_levels[[2]]

############################# Step 4 ######################################
# Appropriately labels the data set with descriptive variable names.

# Rename the remaining columns with descriptive names
for (i in 1:length(Data)) {
  names(Data)[i] <- gsub("..", "", names(Data)[i], fixed = TRUE)
  names(Data)[i] <- gsub(".", "", names(Data)[i], fixed = TRUE)
  names(Data)[i] <- gsub("Acc", "Acceleration", names(Data)[i])
  names(Data)[i] <- gsub("Mag", "Magnitude", names(Data)[i])
  names(Data)[i] <- gsub("^t", "Time", names(Data)[i])
  names(Data)[i] <- gsub("^f", "Frequency", names(Data)[i])
  names(Data)[i] <- gsub("^anglet", "AngleTime", names(Data)[i])
  names(Data)[i] <- gsub("^angle", "Angle", names(Data)[i])
  names(Data)[i] <- gsub("std", "StandardDeviation", names(Data)[i])
  names(Data)[i] <- gsub("gravity", "Gravity", names(Data)[i])
  names(Data)[i] <- gsub("mean", "Mean", names(Data)[i])
  names(Data)[i] <- gsub("BodyBody", "Body", names(Data)[i])
}

############################# Step 5 ######################################
# From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.

# Sort dataset based on each subject and activity -------------------------
levels(Data$Subject) <- c(1:length(levels(Data$Subject)))
Data_sort <- Data[order(Data$Subject, Data$Activity),]

# Calculate the means of each subset and create the tidy dataset ----------
tidy <- data.frame()

for(i in 1:length(levels(Data$Subject))) {
  for(j in 1:length(levels(Data$Activity))) {
    sub_Data <- subset(Data, Data$Subject == i)
    sub_Data <- subset(sub_Data, sub_Data$Activity == levels(sub_Data$Activity)[j])
    col_means <- c(i, j, colMeans(sub_Data[,3:length(colnames(Data))]))
    tidy <- rbind(tidy, col_means)
  } 
}

# Restore header and factors for columns ----------------------------------
colnames(tidy) <- colnames(Data)

tidy$Activity <- as.factor(tidy$Activity)
tidy$Subject <- as.factor(tidy$Subject)
levels(tidy$Activity) <- activity_levels[[2]]

# Write final tidy dataset to file ----------------------------------------
write.table(tidy, file = "Tidy_data.txt", row.names = FALSE)
