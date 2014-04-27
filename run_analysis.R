setwd("/Users/Hegazy1/Documents/R/Data Computing - Coursera/Project")

Features <- read.table(file="./UCI HAR Dataset/features.txt")
Features <- Features$V2

Activity_labels <- read.table(file="./UCI HAR Dataset/activity_labels.txt")
Activity_labels <- Activity_labels$V2

    ## Read in test Data
Test <- read.table(file="./UCI HAR Dataset/test/X_test.txt", col.names=Features, row.names=NULL)
#rownames(Test) = 1:nrow(Test)
Subject_Test <- read.table(file="./UCI HAR Dataset/test/subject_test.txt")
Test$Subject <- Subject_Test$V1
Activity_Labels_test <- read.table(file="./UCI HAR Dataset/test/y_test.txt")
Test$Activity <- Activity_Labels_test$V1

    ## Read in Training Data
Train <- read.table(file="./UCI HAR Dataset/train/X_train.txt", col.names=Features, row.names=NULL)
#rownames(Train) = (nrow(Test)+1):(nrow(Test)+nrow(Train))
Subject_Train <- read.table(file="./UCI HAR Dataset/train/subject_train.txt")
Train$Subject <- Subject_Train$V1
Activity_Labels_Train <- read.table(file="./UCI HAR Dataset/train/y_train.txt")
Train$Activity <- Activity_Labels_Train$V1

    ## Combine Test & Data
Data <- rbind(Train, Test)
?merge


