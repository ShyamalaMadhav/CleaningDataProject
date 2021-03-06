CleaningDataProject
===================

Getting and Cleaning Data Assignment

	
##ReadMe

	The �Getting and Cleaning Data�Assignment required us to tidy the samsung data provided at the corsera wesite:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The original data is located at 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The UCI HAR Dataset  folder was downloaded from the above website. It contained the following folders and files

Files: - 
'README.txt'
'features_info.txt': Shows information about the variables used on the feature vector.
'features.txt': List of all features.
'activity_labels.txt': Links the class labels with their activity name.

Folders:-
	1. 'train' which contains
'X_train.txt': Training set.
'y_train.txt': Training labels.
subject_train.txt': The subject Code who performed the activity for each window sample. Its range is from 1 to 30. 
'Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
'Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
'Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
'Inertial Signals/total_acc_y_train.txt'
'Inertial Signals/body_acc_y_train.txt
'Inertial Signals/total_acc_y_train.txt'
'Inertial Signals/body_acc_z_train.txt
'Inertial Signals/body_gyro_z_train.txt'
'Inertial Signals/body_gyro_z_train.txt'

	2. 'test' which contains
'X_test.txt': Test set.
'y_test.txt': Test labels.
subject_test.txt': The subject Code who performed the activity for each window sample. Its range is from 1 to 30. 
'Inertial Signals/total_acc_x_test.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
'Inertial Signals/body_acc_x_test.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
'Inertial Signals/body_gyro_x_test.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
'Inertial Signals/total_acc_y_test.txt'
'Inertial Signals/body_acc_y_test.txt
'Inertial Signals/total_acc_y_test.txt'
'Inertial Signals/body_acc_z_test.txt
'Inertial Signals/body_gyro_z_test.txt'
'Inertial Signals/body_gyro_z_test.txt'

 The data in the above files represent the experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a
 smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,the  3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually.
 The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Our assignment required us to study the data and prepare a tidy dataset which could be used for later analysis. We were asked to do the below procedure
Merge the training and the test sets to create one data set.
Extract only the measurements on the mean and standard deviation for each measurement.� 
Use descriptive activity names to name the activities in the data set
Appropriately label the data set with descriptive activity names.
Create a second independent tidy dataset with the avaerage of each variable for each activity and each subject.

The following steps were performed which led to the tidy data �Final_data� in text format. R Programming was used for my Analysis.

1. Read files X_test,X_train.y_test,y_train,Subject_test,Subject_train,features and activity_lables text files into dataframes.
2. Column bind Dataframes y_test and subject_test and add column names Activity and Subject to it. ->A
3. Column bind Dataframes y_train and subject_train and add column names Activity and Subject to it. ->B
4. Merge A and B ->C (dimensions of C-10299*2) 
5. Merge X_train and X_test data -> D (dimensions of D-10299*561)
6. Change column names of D from features.txt
7. Eliminate columns from D which do not have "mean()" or "std()" in the column names. ->E (dimensions of E-10299*66)
8. Column bind C and E (dimensions -10299*68)
9. Take mean of observations per activity per subject. (dimensions -180*68). 
10. Replace activity numbers with Activity names from activity_lables.txt-> Final_Table
11. use write.table to get a text file from the above Data Frame.
12. Prepare code book
13. and Read me document
12. Upload output files to Github and Share the link.

The final output contained the following files:
Complete_data.txt: The complete data set for the 68 variables containing the Mean and Standard Deviation in the variable names/
Final_data.txt: a second independent tidy data set with the average of each variable for each activity and each subject.
Final_data.csv: csv copy of the Final data
Readme.md
Codebook: Detailed description of the variables, transformations and work performed to clean up the data
run_analysis.R: The R Script used for the process
run_analysis.rmd: The Html file which was knitted using the R Script.

All the above documents are located in my Github Repository
https://github/ShyamalaMadhav/CleaningDataProject

###Acknowledgements:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[2] https://class.coursera.org/

