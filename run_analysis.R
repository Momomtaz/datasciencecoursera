Features <- read.table(file="./UCI HAR Dataset/features.txt")
Features <- Features$V2

Activity_labels <- read.table(file="./UCI HAR Dataset/activity_labels.txt")
Activity_labels <- Activity_labels$V2

    ## Read in test Data
Test <- read.table(file="./UCI HAR Dataset/test/X_test.txt", col.names=Features, row.names=NULL)
Subject_Test <- read.table(file="./UCI HAR Dataset/test/subject_test.txt")
Test$Subject <- Subject_Test$V1
Activity_Labels_test <- read.table(file="./UCI HAR Dataset/test/y_test.txt")
Test$Activity <- factor(Activity_Labels_test$V1, levels=1:6,labels= Activity_labels)

    ## Read in Training Data
Train <- read.table(file="./UCI HAR Dataset/train/X_train.txt", col.names=Features, row.names=NULL)
Subject_Train <- read.table(file="./UCI HAR Dataset/train/subject_train.txt")
Train$Subject <- Subject_Train$V1
Activity_Labels_Train <- read.table(file="./UCI HAR Dataset/train/y_train.txt")
Train$Activity <- factor(Activity_Labels_Train$V1, levels=1:6,labels= Activity_labels)

    ## Combine Test & Data
Data <- rbind(Train, Test)

    ## Extracts Means & Standard Deviation
toMatch <- c("mean()", "std()")
matches <- grep(paste(toMatch,collapse="|"), Features, value=F)

    ## Save Tidy Data
write.table(x=Data, file='./Tidy Data.csv', sep=",", row.names=F)

    ## Means & SD
Means <- colMeans(Data[,1:(ncol(Data) - 2) ])
Standard.Deviation <- apply( Data[,1:(ncol(Data) - 2) ], 2, sd )

    ## New Dataframe with Means & Standard Deviations
DF <- data.frame(Means, stringsAsFactors=F)
DF <- cbind(DF, Standard.Deviation)
write.table(x=DF, file='./Means-SD Data.csv', sep=",", row.names=F)

