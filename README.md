# README.md file#

This file sums up the work performed as part of completing the main course project for the Coursera [Getting and Cleaning Data](Getting%20and%20Cleaning%20Data) online course.

The project uses data from this project:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The main dataset can also be downloaded here:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip)

The steps performed as part of this analysis is summarized in these sections below:

 1. Overview of analysis
 2. Included files
 3. Further notes

Section 1: Overview of analysis
-------

The course project asks for the following steps to be performed:

**You should create one R script called run_analysis.R that does the following:**

**1. Merges the training and the test sets to create one data set:**

Explanation: The data is contained in a top directory named "*UCI HAR Dataset*". This directory contains four single files, "*activity_labels.txt*", "*features.txt*", "*features_info.txt*" and a "*README.txt*" file. It also contains two sub-directories named "*test*" and "*train*". These two folders contains the actual data. Each folders contains three files and another directory named "*Inertial signals*". The first three files from each library are used while the  "*Inertial signals*" directory is ignored.

A total of eight files are read in and combined in the following fashion:

The file "*features.txt*" was read in and used as an initial header for the variable names in the files "*X_test.txt*" and "*X_train.txt*".

From the "*train*" folder: "*subject_test.txt*", "*y_test.txt*" and "*X_test.txt*" was read in and bound together horizontally (column wise) in the given order. This was then repeated for the corresponding files in the "*test*" folder.

These two datasets where then bound together vertically with the data from the train folder on the top and the data from the test folder below.

Furthermore the "*activity_labels.txt*" file was also read in but used further down (Step 3) 

**2. Extracts only the measurements on the mean and standard deviation for each measurement:**

All columns containing data (column 3 and forward) that included the word (exact match), "std", "mean" or "Mean" in the column name was retained while the rest were discarded (the exception being the first two column that contains descriptive information).

**3. Uses descriptive activity names to name the activities in the data set:**

The activites (numeric 1-6) was exchanged for the actual activity labels from the "*activity_labels.txt*" file without any other changes to the naming.

**4. Appropriately labels the data set with descriptive variable names:**

See the code book for a detailed description of the variables and the renaming. 

**5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject:**

The data was sorted based on subject then activity label. All data observations within each category (same subject and activity) was then averaged such that each single data column was summarised as the average.

The data file contains a total of 30 subjects with 6 activities per subject. This gives a total of 180 averaged observations. This data was then combined into a new "tidy" dataset using the original column headers and the averaged data.

Finally the data was written to a text file.

Section 2: Included files
-------

 **1. "run_analysis.R"**

This file contains the actual script that performs the automated analysis as per description.
 
 **2. "CodeBook.md"**

This file contains the notes that explains the naming of the variables and any data manipulation performed while running the scripts.

 **3. "README.md"**

This file (that you are currently reading) give an overview of the project and the analysis.

Section 3: Further notes
-------

- The data in the "tidy" dataset was kept in it's original wide data format with no attempt performed to transform it into a "long" format.

- For details about the variables please see the code book.

- If you got this far you deserve a break and a big hug :-)


## Thank you! ##
