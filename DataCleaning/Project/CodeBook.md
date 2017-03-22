# Codebook

The file set.txt came from the analysis done with run_analysis.R and is an example of the output of the script

The features selected for this database come from the average accelerometer and gyroscope 3-axial signals.

Here are presented the description of the variables.

#### Suject
Id of the Subject: integer [1:30]
#### Activity
Type of Activity: string[LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS]
#### TimeBodyAcc[TOKEN1][TOKEN2]
Average accelerometer of the Body: normalized float [-1:1]
#### TimeGravityAcc[TOKEN1][TOKEN2]
Average gravity values: normalized float [-1:1]
#### TimeBodyAccJerk[TOKEN1][TOKEN2]
Average jerk values: normalized float [-1:1]
#### TimeBodyGyro[TOKEN1][TOKEN2]
Average gyroscope values: normalized float [-1:1]
#### TimeBodyGyroJerk[TOKEN1][TOKEN2]
Average Gyroscope jerk: normalized float [-1:1]
#### TimeBodyAccMag[TOKEN1]
Average Accelerometer Magnitude: normalized float [-1:1]
#### TimeGravityAccMag[TOKEN1]
Average Gravity Acc Magnitude: normalized float [-1:1]
#### TimeBodyAccJerkMag[TOKEN1]
Average Acc Jerk Magnitude: normalized float [-1:1]
#### TimeBodyGyroMag[TOKEN1]
Average Gyroscope Magnitude: normalized float [-1:1]
#### TimeBodyGyroJerkMag[TOKEN1]
Average Gyroscope Jerk Magnitude: normalized float [-1:1]
#### FrequencyBodyAcc[TOKEN1][TOKEN2]
Frequency Accelerometer of the body: normalized float [-1:1]
#### FrequencyBodyAccJerk[TOKEN1][TOKEN2]
Frequency Acceleroemeter Jerk: normalized float [-1:1]
#### FrequencyBodyGyro[TOKEN1][TOKEN2]
Frequency Gyroscope: normalized float [-1:1]
#### FrequencyBodyAccMag[TOKEN1]
Frequency Accelerometer Magnitude: normalized float [-1:1]
#### FrequencyBodyAccJerkMag[TOKEN1]
Frequency Acceleroemeter Jerk Magnitude: normalized float [-1:1]
#### FrequencyBodyGyroMag[TOKEN1]
Frequency Gyroscope Magnitude: normalized float [-1:1]
#### FrequencyBodyGyroJerkMag[TOKEN1]
Frequency Gyroscope Jerk Magnitude: normalized float [-1:1]

### [TOKEN1] should be replaced by correspondent 'Mean'(average value), 'Std' (Standard Deviation value) according to the variable in the set.


### [TOKEN2] should be replaced by correspondent 'X'; 'Y; or 'Z' (axis direction) according to the variable in the set.

