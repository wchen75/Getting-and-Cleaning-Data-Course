
# read the files for both x_test and x_train then combine both 2 files into x_test_train 
x_test <- read.table("./test/X_test.txt")
x_train <- read.table("./train/X_train.txt")
x_test_train <- rbind(x_test,x_train)

# read column names from features then assign column name to x_test_train 
features <- read.table("features.txt")
colnames(x_test_train) <- features[,2]

# only select those std and mean columns
x_test_train <-x_test_train[,grepl("mean", names(x_test_train))|grepl("std", names(x_test_train))]

# read both subject_test and subject_train with column name "Subject_ID" then combine both records into subject_test_train 
subject_test <- read.table("./test/subject_test.txt", col.names = "Subject_ID")
subject_train <- read.table("./train/subject_train.txt", col.names = "Subject_ID")
subject_test_train <- rbind(subject_test,subject_train)

# read both y_train and y_test with column name "Activity_ID" then combine both records into y_test_train 
y_test <- read.table("./test/y_test.txt", col.names = "Activity_ID")
y_train <- read.table("./train/y_train.txt", col.names = "Activity_ID")
y_test_train <- rbind(y_test,y_train)

# combine all columns from subject_test_train, y_test_train and x_test_train 
all_test_train <- cbind(subject_test_train, y_test_train, x_test_train)

# read the activity_labels then merge with all_test_train to derive the new column "Activity_Name"
activity_labels <- read.table("./activity_labels.txt", col.names = c("Activity_ID","Activity_Name"))
my_data <- merge(all_test_train, activity_labels, by="Activity_ID", sort = F, all.x=TRUE)

# aggregate the mean by 3 columns Subject_ID + Activity_ID + Activity_Name
second_tidy_Data <- aggregate(. ~ Subject_ID + Activity_ID + Activity_Name, data=my_data, mean)

# Wrtie out second tidy data to TXT
write.table(second_tidy_data , "Second_Tidy_Data.txt", row.name=FALSE)