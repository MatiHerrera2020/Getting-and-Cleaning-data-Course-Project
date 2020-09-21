# Getting-and-Cleaning-data-Course-Project

## About the Repo
This repository contains: 
i) a CODEBOOK.MD file that allows to recognize the variables that compose the final file and with which it is possible to make the analysis, 
(ii) a RUN_ANALYSIS.R file that allows you to download and apply the functions needed to obtain the final simplified table,
(iii) a TIDYDATA.TXT file corresponding to the final simplified table through which the analysis is made, and
iv) this README.MD file in which the steps carried out in the RUN_ANALYSIS.R file are described

## Files used from the unzip documentation
The following files were used:

1. features.txt - includes the descriptions for features measured
2. train/X_train.txt - includes the measurements of the features in train set (one row - 1 measurement of 561 features)
3. test/X_test.txt - includes the measurements of the features in test set
4. train/subject_train.txt - subject for each measurement from the train set
5. test/subject_test.txt - subject for each measurement from the test set
6. train/y_train.txt - activity (from 1 to 6) for each measurement from the train set
7. test/y_test.txt - activity (from 1 to 6) for each measurement from the test set

## About the script
The idea of script is made the following steps in order to answer to project instructions:
1. First, download the data from the source and store it, then read the necessary files.

2. Secondly, we load the features.txt file to assign its values as the column names of the table we will create, which makes the work easier.

3. We load separately each one of the TEST and TRAIN files and then we add important columns to them, which will be $activity and $subject to the data, because they will be useful to us later and also to fulfill the instruction 4.

4. Both sets of data are merged to create a complete table that stores both samples. With this we fulfill the instruction 1.

5. Fifth, we extract a subset of data containing only the mean() or std() values, using the grep() function. We create a filtered table containing those columns. With this we fulfill the instruction 2.

6. We created a new column whose name will be $activitylabel that allows us to give values and levels to the column of activities, but as text. With this we fulfill the instruction 3.

7. Finally, we create a final simplified table that contains the averages of all the variables for each activity and individual using the dcast() function, thus responding to instruction 5.

