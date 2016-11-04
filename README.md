==================================================================
Peer-graded Assignment: Getting and Cleaning Data Course Project
==================================================================

The assignment includes the following files:
=========================================

- 'README.md' - this file

- 'Second_Tidy_Data.TXT': TXT file for the assignment - a tidy data set with the average of each variable for each activity and each subject.

- 'CodeBook.md': Code Book to list of all variables for Second_Tidy_Data.

- 'run_analysis.R': R script to create the tidy data Second_Tidy_Data.TXT

Note :

1. unload the file for the project, unzip the file to the woring directory. 

2. Run the R script under the working directory

Explanation:

1. read the files for both x_test and x_train then combine both 2 files into x_test_train 
2. read column names from features then assign column name to x_test_train 
3. only select those columns with column name has "mean" or "std" for x_test_train 
4. read both subject_test and subject_train with column name "Subject_ID" assigned then combine both records into subject_test_train 
5. read both y_train and y_test with column name "Activity_ID" assigned then combine both records into y_test_train 
6. combine all columns from subject_test_train, y_test_train and x_test_train 
7. read the activity_labels then merge with all_test_train to derive the new column "Activity_Name" into all_test_train
8. aggregate all_test_train to derive mean by 3 columns Subject_ID + Activity_ID + Activity_Name
9. Wrtie out the second tidy data with TXT format







