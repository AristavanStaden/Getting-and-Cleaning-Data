##Introduction:
This data  was recorded from a Samsung prototype smartphone with a built-in accelerometer. 
The purpose of the model was to recognize the type of activity (walking, walking upstairs, walking downstairs, sitting, standing, laying) the wearer of the device was performing based on their 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz, as recorded by the accelerometer and the additional gyroscope worn on the wrist.

##Methods:
The “Human Activity Recognition Using Smartphones Dataset” consists of recordings from 30 participants over specified time who wore a Samsung device on their waist. The dataset included 7352 observations with 563 variables. The data is drawn from the accelerometers of Samsung Galaxy S3 smartphones carried by 21 people numerically identified as subjects 1 3 5 6 7 8 11 14 15 16 17 19 21 22 23 25 26 27 28 29 30.  Six activities were identified: laying, sitting, standing, walk, walkdown, walkup.  There were no NAs in the initial dataset 
The variables can be summarized as:
•Accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix ‘t’ to denote time) were captured at a constant rate of 50 Hz. 
•Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ).
•Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also, the magnitude of these three-dimensional signals was calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

##Data Source:
•Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
•Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Data:
The dataset includes the following files:

##  [1] "./UCI HAR Dataset/activity_labels.txt"                         
##  [2] "./UCI HAR Dataset/features.txt"                                
##  [3] "./UCI HAR Dataset/features_info.txt"                           
##  [4] "./UCI HAR Dataset/README.txt"                                  
##  [5] "./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt"   
##  [6] "./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt"   
##  [7] "./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt"   
##  [8] "./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt"  
##  [9] "./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt"  
## [10] "./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt"  
## [11] "./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt"  
## [12] "./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt"  
## [13] "./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt"  
## [14] "./UCI HAR Dataset/test/subject_test.txt"                       
## [15] "./UCI HAR Dataset/test/X_test.txt"                             
## [16] "./UCI HAR Dataset/test/y_test.txt"                             
## [17] "./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt" 
## [18] "./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt" 
## [19] "./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt" 
## [20] "./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt"
## [21] "./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt"
## [22] "./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt"
## [23] "./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt"
## [24] "./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt"
## [25] "./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt"
## [26] "./UCI HAR Dataset/train/subject_train.txt"                     
## [27] "./UCI HAR Dataset/train/X_train.txt"                           
## [28] "./UCI HAR Dataset/train/y_train.txt"

##Data Manupilation:
5 Required steps according to Project outline:

Create one R script called run_analysis.R that does the following:
1.	Merges the training and the test sets to create one data set.
    a.	Install Required Libraries.
    b.	Check if data exists, if not, downloads the datasets & unzips into “alldata”.
    c.	Merges the training & test datasets into one using C bind & R bind respectively – “sensor_data”
    d.	Binds activity & subject labels to “sensor_data”
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
    a.	Extracts the Mean & Std Deviation from “sensor_data”.
3.	Uses descriptive activity names to name the activities in the data set
    a.	See 1d
4.	Appropriately labels the data set with descriptive activity names.
    a.	Acc changed to Acceleration
    b.	GyroJerk changed to AngularAcceleration
    c.	Gyro changed to Gyroscope
    d.	Mag changed to Magnitude
    e.	t changed to Time
    f.	f changed to Frequency Domain
    g.	mean changed to Mean
    h.	std changed to StandardDev
    i.	Freq change to Frequency
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    a.	New text file created: NewtidyData.txt
6.	(Non Project requirement), verify new dataset using View().
    a.	Resulting is data frame of 180 observations of 81 variables.





