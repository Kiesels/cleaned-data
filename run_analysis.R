
run_analysis <- function() {

library(reshape2)
library(dplyr)
setwd("C:\\Users\\HP\\Documents\\Tibi\\R\\Getting_and_Cleaning\\UCI")
## the zip file was previously downloaded from the web
## unzip the files unpacked to directories in the local machine
## load data from directories
        features <- read.table("C:\\Users\\HP\\Documents\\Tibi\\R\\Getting_and_Cleaning\\UCI\\features.txt")
        activity_labels <- read.table("C:\\Users\\HP\\Documents\\Tibi\\R\\Getting_and_Cleaning\\UCI\\activity_labels.txt")

        x_test <- read.table("C:\\Users\\HP\\Documents\\Tibi\\R\\Getting_and_Cleaning\\UCI\\test\\X_test.txt")
        subject_test <- read.table("C:\\Users\\HP\\Documents\\Tibi\\R\\Getting_and_Cleaning\\UCI\\test\\subject_test.txt")
        y_test <- read.table("C:\\Users\\HP\\Documents\\Tibi\\R\\Getting_and_Cleaning\\UCI\\test\\y_test.txt")

        x_train <- read.table("C:\\Users\\HP\\Documents\\Tibi\\R\\Getting_and_Cleaning\\UCI\\train\\X_train.txt")
        subject_train <- read.table("C:\\Users\\HP\\Documents\\Tibi\\R\\Getting_and_Cleaning\\UCI\\train\\subject_train.txt")
        y_train <- read.table("C:\\Users\\HP\\Documents\\Tibi\\R\\Getting_and_Cleaning\\UCI\\train\\y_train.txt")

## merge tables with header from features
        test <- cbind(subject_test, y_test, x_test)
        train <- cbind(subject_train, y_train, x_train)
        dataset <- rbind(c("subject", "activity", as.character(features$V2)), test, train)

## add columns with mean or std in the features to "subject" and "activity" columns   
        msdataset <- dataset[, c(1, 2, (grep(("mean|std"), as.character(features$V2))+2))]

## name the activities in the data set based on activity_labels
        for(i in 2:length(msdataset[,2])) {
                msdataset[i, 2] <- as.character(activity_labels[msdataset[i, 2], 2])
        }

## write to file
        write.table(msdataset, file = "UCI.txt", row.name = FALSE)
}
