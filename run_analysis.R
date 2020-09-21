#with this you can download and unzip the data

url_download<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url_download,destfile = "base4.zip")
unzip("base4.zip",exdir = "base4")

#reading features and activity data
features <- read.table("base4/UCI HAR Dataset/features.txt")
activities <- read.table("base4/UCI HAR Dataset/activity_labels.txt")

#now define the data that we want to merge
#first for TRAIN
train <- read.table("base4/UCI HAR Dataset/train/X_train.txt") #features data
colnames(train) <- features$V2 #descriptive column names for data (STEP 4)
ytrain <- read.table("base4/UCI HAR Dataset/train/y_train.txt") #activity labels
train$activity <- ytrain$V1
subject.train <- read.table("base4/UCI HAR Dataset/train/subject_train.txt") #subjects
train$subject <- factor(subject.train$V1)


#then, for TEST
test <- read.table("base4/UCI HAR Dataset/test/X_test.txt")
colnames(test) <- features$V2
ytest <- read.table("base4/UCI HAR Dataset/test/y_test.txt") 
test$activity <- ytest$V1
subject.test <- read.table("base4/UCI HAR Dataset/test/subject_test.txt")
test$subject <- factor(subject.test$V1)

#merging both, TEST and TRAIN
cuadro.completo <- rbind(test, train)
dim(cuadro.completo)

#now we can filter the column names for or purpose
nombre.columnas <- colnames(cuadro.completo)

columnas.filtradas <- grep("std\\(\\)|mean\\(\\)|activity|subject", 
          nombre.columnas, value=TRUE)
cuadro.filtrado <- cuadro.completo[, columnas.filtradas] 

#now, to add descriptive activity names to name the activities in the data set
cuadro.filtrado$activitylabel <- factor(cuadro.filtrado$activity, 
          labels= c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

#creating a tidy dataset with mean values for each subject and activity
columnas.features = grep("std\\(\\)|mean\\(\\)", nombre.columnas, value=TRUE)
cuadro.melt <-melt(cuadro.filtrado, id = c('activitylabel', 'subject'), 
          measure.vars = columnas.features)
cuadro.tidy <- dcast(cuadro.melt, activitylabel + subject ~ variable, mean)

#creating the final tidy dataset
write.table(cuadro.tidy, file = "tidydata.txt", row.names = FALSE)



