# Description

This data set is derived from the **Human Activity Recognition Using Smartphones Data Set** located at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  

# Data Source

*Data source description adapted from the original data set description.  See reference [1] for additional details.*

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals.

# Transformation Steps

1. Download source data from original URL
2. Process feature labels
   * Drop features with function other than mean or standard deviation
   * Expand various abbreviations to create verbose feature names
   * Fix typos and remove special characters
3. Process Test Data
   * Load measurements from X_test.txt, and drop columns corresponding to unneeded features
   * Load data from subject_test.txt and y_train.txt
   * Merge data loaded in previous two steps to form a single test data set
   * Replace activity codes with descriptions
4. Process Training Data
   * Load measurements from X_train.txt, and drop columns corresponding to unneeded features
   * Load data from subject_train.txt and Y_train.txt
   * Merge data loaded in previous two steps to form a single train data set
   * Replace activity codes with descriptions
5. Merge Test and Training data set to a single data set
6. Pivot combined data set to create a single tall/narrow data set
7. Calculated a summarized data set with the average of each variable for each activity and each subject


# Key Variables

| Variable     | Description                                            | Type                                                                          |
|--------------|--------------------------------------------------------|-------------------------------------------------------------------------------|
| ActivityName | Name of the activity being performed                   | set: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING |
| SubjectId    | Unique identifier of the subject performing the action | Integer                                                                       |


# Measurement Variables

**Units:** Measurement variables are normalized and bounded within [-1,1].

| Variable                                    | Domain    | Source  | Measurement                  | Function           |
|---------------------------------------------|-----------|---------|------------------------------|--------------------|
| timeBodyAccelerometerMean{X,Y,Z}            | time      | Body    | Accelerometer Vector         | Mean               |
| timeBodyAccelerometerStd{X,Y,Z}             | time      | Body    | Accelerometer Vector         | Standard Deviation |
| timeGravityAccelerometerMean{X,Y,Z}         | time      | Gravity | Accelerometer Vector         | Mean               |
| timeGravityAccelerometerStd{X,Y,Z}          | time      | Gravity | Accelerometer Vector         | Standard Deviation |
| timeBodyAccelerometerJerkMean{X,Y,Z}        | time      | Body    | Accelerometer Jerk Vector    | Mean               |
| timeBodyAccelerometerJerkStd{X,Y,Z}         | time      | Body    | Accelerometer Jerk Vector    | Standard Deviation |
| timeBodyGyroscopeMean{X,Y,Z}                | time      | Body    | Gyroscope Vector             | Mean               |
| timeBodyGyroscopeStd{X,Y,Z}                 | time      | Body    | Gyroscope Vector             | Standard Deviation |
| timeBodyGyroscopeJerkMean{X,Y,Z}            | time      | Body    | Gyroscope Jerk Vector        | Mean               |
| timeBodyGyroscopeJerkStd{X,Y,Z}             | time      | Body    | Gyroscope Jerk Vector        | Standard Deviation |
| timeBodyAccelerometerMagnitudeMean          | time      | Body    | Accelerometer Magnitude      | Mean               |
| timeBodyAccelerometerMagnitudeStd           | time      | Body    | Accelerometer Magnitude      | Standard Deviation |
| timeGravityAccelerometerMagnitudeMean       | time      | Gravity | Accelerometer Magnitude      | Mean               |
| timeGravityAccelerometerMagnitudeStd        | time      | Gravity | Accelerometer Magnitude      | Standard Deviation |
| timeBodyAccelerometerJerkMagnitudeMean      | time      | Body    | Accelerometer Jerk Magnitude | Mean               |
| timeBodyAccelerometerJerkMagnitudeStd       | time      | Body    | Accelerometer Jerk Magnitude | Standard Deviation |
| timeBodyGyroscopeMagnitudeMean              | time      | Body    | Gyroscope Magnitude          | Mean               |
| timeBodyGyroscopeMagnitudeStd               | time      | Body    | Gyroscope Magnitude          | Standard Deviation |
| timeBodyGyroscopeJerkMagnitudeMean          | time      | Body    | Gyroscope Jerk Magnitude     | Mean               |
| timeBodyGyroscopeJerkMagnitudeStd           | time      | Body    | Gyroscope Jerk Magnitude     | Standard Deviation |
| frequencyBodyAccelerometerMean{X,Y,Z}       | frequency | Body    | Accelerometer Vector         | Mean               |
| frequencyBodyAccelerometerStd{X,Y,Z}        | frequency | Body    | Accelerometer Vector         | Standard Deviation |
| frequencyBodyAccelerometerJerkMean{X,Y,Z}   | frequency | Body    | Accelerometer Jerk Vector    | Mean               |
| frequencyBodyAccelerometerJerkStd{X,Y,Z}    | frequency | Body    | Accelerometer Jerk Vector    | Standard Deviation |
| frequencyBodyGyroscopeMean{X,Y,Z}           | frequency | Body    | Gyroscope Vector             | Mean               |
| frequencyBodyGyroscopeStd{X,Y,Z}            | frequency | Body    | Gyroscope Vector             | Standard Deviation |
| frequencyBodyAccelerometerMagnitudeMean     | frequency | Body    | Accelerometer Magnitude      | Mean               |
| frequencyBodyAccelerometerMagnitudeStd      | frequency | Body    | Accelerometer Magnitude      | Standard Deviation |
| frequencyBodyAccelerometerJerkMagnitudeMean | frequency | Body    | Accelerometer Magnitude      | Mean               |
| frequencyBodyAccelerometerJerkMagnitudeStd  | frequency | Body    | Accelerometer Magnitude      | Standard Deviation |
| frequencyBodyGyroscopeMagnitudeMean         | frequency | Body    | Gryoscope Magnitude          | Mean               |
| frequencyBodyGyroscopeMagnitudeStd          | frequency | Body    | Gryoscope Magnitude          | Standard Deviation |
| frequencyBodyGyroscopeJerkMagnitudeMean     | frequency | Body    | Gyroscope Jerk Magnitude     | Mean               |
| frequencyBodyGyroscopeJerkMagnitudeStd      | frequency | Body    | Gyroscope Jerk Magnitude     | Standard Deviation |

# Summarized output

A summarized data set is calculated from the raw data with the average of each variable for each activity and each subject.

# References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
