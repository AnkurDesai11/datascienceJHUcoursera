#STEP 0 - Reading Test and Train data
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)

subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)


#STEP 1 - Merging data into one dataset
Subject_merged <- rbind(subjectTrain, subjectTest)
y_merged<- rbind(y_train, y_test)
X_merged<- rbind(X_train, X_test)

names(Subject_merged)<-c("subject")
names(y_merged)<- c("activity")
featureNames <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
names(X_merged)<- featureNames$V2
data_merged <- cbind(Subject_merged, y_merged)
mergeddataset <- cbind(X_merged, data_merged)

#STEP 2 - Extract only the measurements on the mean and standard deviation for each measurement
sapply(Subject_merged, mean, na.rm=TRUE)  
sapply(Subject_merged, sd, na.rm=TRUE) 
sapply(y_merged, mean, na.rm=TRUE)  
sapply(y_merged, sd, na.rm=TRUE)
sapply(X_merged, mean, na.rm=TRUE)  
sapply(X_merged, sd, na.rm=TRUE)  

#STEP 3 - Uses descriptive activity names to name the activities in the data set
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
for(i in 1:6){
  mergeddataset$activity[mergeddataset$activity==i] <- activitylabels[i,2]
}

#STEP 4 - Appropriately labels the data set with descriptive variable names
names(mergeddataset)<-gsub("^t", "time", names(mergeddataset))
names(mergeddataset)<-gsub("^f", "frequency", names(mergeddataset))
names(mergeddataset)<-gsub("Acc", "Accelerometer", names(mergeddataset))
names(mergeddataset)<-gsub("Gyro", "Gyroscope", names(mergeddataset))
names(mergeddataset)<-gsub("Mag", "Magnitude", names(mergeddataset))
names(mergeddataset)<-gsub("BodyBody", "Body", names(mergeddataset))

#STEP 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
library(plyr)
tidydataset<-aggregate(. ~subject + activity, mergeddataset, mean)
tidydataset<-tidydataset[order(tidydataset$subject,tidydataset$activity),]
write.table(tidydataset, file = "tidydataset.txt",row.name=FALSE)
tidydataset