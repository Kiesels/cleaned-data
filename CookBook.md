# cleaned-data
Course Project: Getting and Cleaning Data
## the zip file was previously downloaded from the web
## unzip the files unpacked to directories in the local machine
## load data from directories
Input tables:
        features,
        activity_label
        x_test 
        subject_test
        y_test
        x_train 
        subject_train
        y_train

## merge tables with header from features
        test: The table with test values
        train: The table with train values
        dataset: test + train with header from features

## add columns with mean or std in the features to "subject" and "activity" columns   
        msdataset: columns only with mean and std

## name the activities in the data set based on activity_labels
        msdataset: modified with the values from activity_labels
        
## write to file

