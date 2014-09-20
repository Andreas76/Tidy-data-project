#Codebook.md#

This file contains information about the study design and the data variables used in this project.

For further information about the actual project, the main analysis and the data, please refer to the README.md file.

Sections in this document:

 1. Study design
 2. Code book
 
Section 1: Study design
-------

**Overview of the experiment:**

The original [project page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#) describes the experiment in the following way:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. "

**Original dataset:** 

The original dataset contains 10299 observations of 563 data variables in total. In addition two more category variables are included ("Subject" and "Activity").

**Summarized dataset:**

Only variables that included either the two categorical data variables or data with standard deviations or means as part of the variable name was retained for a total of 10299 observations and 86 data variables.

The data for each subject and activity was further summarized by calculating the mean for each data variable and subset.

The final dataset contains 180 observations (means) for 86 data variables as well as the two category variables (total 88 variables). 

Section 2: Code book
-------

Overview of variables:

**Categorical variables:**

"Subject": This numerical variable identifies the subject of the study (1 to 30);

"Activity": This originally numerical variable identifies the activity of the subject (1 to 6). The activities was changed from numerical to descriptive in the summarized final data set.

**Data variables:**

Column 3 to 88 contains the remaining data variables. The original data was normalized and bounded within -1 to 1. The presented data remains in this format.

The variables have been renamed in the following fashion in the final data set.

The following abbreviations were expanded or changed: "Acc" to "Acceleration", "Mag" to "Magnitude", "std" to "StandardDeviation",  "gravity" to "Gravity", "mean" to "Mean", "BodyBody" to "Body".  Words starting with "t" were changed to "Time", the same was done with words starting with "f" to "Frequency", "anglet" to "AngleTime" and "angle" to "Angle". In addition only alphabetic and numeric characters were retained.

