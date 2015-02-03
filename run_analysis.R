## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

####INSTALL THE LIBRARIES REQUIRED####

library(dplyr)
library(reshape2)
library(data.table)

####DOWNLOAD THE DATA####

getdata<-function(fileUrl, dir, filename, ext){
        # create directory, if it is not already present
        dirName<-paste(dir, sep = "")
        if(!file.exists(dirName)){
                dir.create(path = dirName)
        }
        # Get the data, unless this step has already been done
        dest<-paste("./", dirName,"/", filename, ext, sep = "")
        if(!file.exists(dest)){
                download.file(url = fileUrl, destfile = dest) 
                datedownloaded<-date()
        }
        dest
}
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp<-getdata(fileUrl = fileURL, dir = "Fitness", 
              filename = "data", ext = ".zip")
alldata<-unzip(zipfile = temp)
alldata


####MERGES THE DATASETS INTO ONE####

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", strip.white=TRUE, stringsAsFactors=FALSE)


training_sensor_data <- cbind(cbind(x_train, subject_train), y_train)
test_sensor_data <- cbind(cbind(x_test, subject_test), y_test)
sensor_data <- rbind(training_sensor_data, test_sensor_data)

sensor_labels <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(sensor_data) <- sensor_labels

####EXTRACTS MEAN AND STD DEV FOR EACH MEASUREMENT####

extractdata<- sensor_data[,grepl("mean|std|Subject|ActivityId", names(sensor_data))]
                      

####NAME ACTIVITIES IN DATA SET (DESCRIPTIVE)####


extractdata <- join(extractdata, activity_labels, by = "ActivityId", match = "first")
extractdata <- extractdata[,-1]

names(extractdata) <- gsub('\\(|\\)',"",names(extractdata), perl = TRUE)
names(extractdata) <- make.names(names(extractdata))
names(extractdata) <- gsub('Acc',"Acceleration",names(extractdata))
names(extractdata) <- gsub('GyroJerk',"AngularAcceleration",names(extractdata))
names(extractdata) <- gsub('Gyro',"Gyroscope",names(extractdata))
names(extractdata) <- gsub('Mag',"Magnitude",names(extractdata))
names(extractdata) <- gsub('^t',"Time.",names(extractdata))
names(extractdata) <- gsub('^f',"FrequencyDomain.",names(extractdata))
names(extractdata) <- gsub('\\.mean',".Mean",names(extractdata))
names(extractdata) <- gsub('\\.std',".StandardDev.",names(extractdata))
names(extractdata) <- gsub('Freq\\.',"Frequency.",names(extractdata))
names(extractdata) <- gsub('Freq$',"Frequency",names(extractdata))


####CREATE NEW TIDY DATA SET####

NewtidyData <- ddply(extractdata, c("Subject","Activity"), numcolwise(mean))
write.table(NewtidyData, file = "NewtidyData.txt")

####CONFIRM OUTPUT####
data<-read.table(file = "./NewtidyData.txt", header = T)
View(data)

