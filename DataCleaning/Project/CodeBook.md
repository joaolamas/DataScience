# Codebook

The file set.txt came from the analysis done with run_analysis.R and is an example of the output of the script

The features selected for this database are retrieved and based in the average accelerometer and gyroscope 3-axial signals.

Here are presented the description of the variables.

#### 1. Suject
Id of the Subject: integer [1:30]
#### 2. Activity
Type of Activity: string[LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS]
#### 3-8. TimeBodyAcc[TOKEN1][TOKEN2]
Average in the activity of the accelerometer of the Body: normalized float [-1:1]
#### 9-14. TimeGravityAcc[TOKEN1][TOKEN2]
Average in the activity of the gravity values: normalized float [-1:1]
#### 15-20. TimeBodyAccJerk[TOKEN1][TOKEN2]
Average in the activity of the jerk values: normalized float [-1:1]
#### 21-26. TimeBodyGyro[TOKEN1][TOKEN2]
Average in the activity of the gyroscope values: normalized float [-1:1]
#### 27-32. TimeBodyGyroJerk[TOKEN1][TOKEN2]
Average in the activity of the Gyroscope jerk: normalized float [-1:1]
#### 33-34. TimeBodyAccMag[TOKEN1]
Average in the activity of the Accelerometer Magnitude: normalized float [-1:1]
#### 35-36. TimeGravityAccMag[TOKEN1]
Average in the activity of the Gravity Acc Magnitude: normalized float [-1:1]
#### 37-38. TimeBodyAccJerkMag[TOKEN1]
Average in the activity of the Acc Jerk Magnitude: normalized float [-1:1]
#### 39-40. TimeBodyGyroMag[TOKEN1]
Average in the activity of the Gyroscope Magnitude: normalized float [-1:1]
#### 41-42. TimeBodyGyroJerkMag[TOKEN1]
Average in the activity of the Gyroscope Jerk Magnitude: normalized float [-1:1]
#### 43-48. FrequencyBodyAcc[TOKEN1][TOKEN2]
Average in the activity of the Frequency Accelerometer of the body: normalized float [-1:1]
#### 49-51. FrequencyBodyAccMeanFreq[TOKEN2]
Average in the activity of the Frequency Accelerometer of the body mean Frequencies: normalized float [-1:1]
#### 52-57. FrequencyBodyAccJerk[TOKEN1][TOKEN2]
Average in the activity of the Frequency Acceleroemeter Jerk: normalized float [-1:1]
#### 58-60. FrequencyBodyAccJerkMeanFreq[TOKEN2]
Average in the activity of the Frequency Gyroscope: normalized float [-1:1]
#### 61-66. FrequencyBodyGyro[TOKEN1][TOKEN2]
Average in the activity of the Frequency Gyroscope of the body: normalized float [-1:1]
#### 67-69. FrequencyBodyGyroMeanFreq[TOKEN2]
Average in the activity of the Frequency Gyroscope of the body mean Frequencies: normalized float [-1:1]
#### 70-71. FrequencyBodyAccMag[TOKEN1]
Average in the activity of the Frequency Accelerometer Magnitude: normalized float [-1:1]
#### 72. FrequencyBodyAccMagMeanFreq
Average in the activity of the Frequency Accelerometer of the body Magnitude mean Frequencies: normalized float [-1:1]
#### 73-74. FrequencyBodyAccJerkMag[TOKEN1]
Average in the activity of the Frequency Acceleroemeter Jerk Magnitude: normalized float [-1:1]
#### 75. FrequencyBodyBodyAccJerkMagMeanFreq
Average in the activity of the Frequency Accelerometer of the body Jerk Magnitude mean Frequencies: normalized float [-1:1]
#### 76-77. FrequencyBodyGyroMag[TOKEN1]
Average in the activity of the Frequency Gyroscope Magnitude: normalized float [-1:1]
#### 78. FrequencyBodyBodyGyroMagMeanFreq
Average in the activity of the Frequency Gyroscope of the body Magnitude mean Frequencies: normalized float [-1:1]
#### 79-80. FrequencyBodyGyroJerkMag[TOKEN1]
Average in the activity of the Frequency Gyroscope Jerk Magnitude: normalized float [-1:1]
#### 81. FrequencyBodyBodyGyroJerkMagMeanFreq
Average in the activity of the Frequency Gyroscope of the body Jerk Magnitude mean Frequencies: normalized float [-1:1]
#### 82. AngleTimeBodyAccMeanGravity
Average in the activity of the Vectors obtained by averaging the signals in a signal window sample. Mean values Accelerometer and Gravity: normalized float [-1:1]
#### 83. AngleTimeBodyAccJerkMeanGravityMean
Average in the activity of the Vectors obtained by averaging the signals in a signal window sample. Jerk mean values Accelerometer and Gravity: normalized float [-1:1]
#### 84. AngleTimeBodyGyroMeanGravityMean
Average in the activity of the Vectors obtained by averaging the signals in a signal window sample. Mean values Gyroscope and Gravity: normalized float [-1:1]
#### 85. AngleTimeBodyGyroJerkMeanGravityMean
Average in the activity of the Vectors obtained by averaging the signals in a signal window sample. Jerk mean values Gyroscope and Gravity: normalized float [-1:1]
#### 86-88. Angle[TOKEN2]GravityMean
Average in the activity of the Vectors obtained by averaging the signals in a signal window sample. Mean values gravity: normalized float [-1:1]

----------------------


 [TOKEN1] should be replaced by correspondent 'Mean'(average value), 'Std' (Standard Deviation value) according to the variable in the set.

 [TOKEN2] should be replaced by correspondent 'X'; 'Y; or 'Z' (axis direction) according to the variable in the set.

