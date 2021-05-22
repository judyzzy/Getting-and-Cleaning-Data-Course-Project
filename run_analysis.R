# 1. Merges the training and the test sets to create one data set.
### Get data values
path <- "./UCI HAR Dataset/"
type <- c("train", "test")
subject <- c("subject", "X", "y")

df <- NULL
for (t in type){
    print(paste("reading folder", t))
    mydata <- list()
    for (s in subject){
        filename <- paste(path, t, "/", s, "_", t, ".txt", sep="")
        print(paste("reading table", filename))
        mydata[[s]] <- read.table(filename)
    }
    df_type <- data.frame(mydata)
    df <- rbind(df, df_type)
}

### Get data feature names
subject_name <- "subject"
X_features_names <- read.table("./UCI HAR Dataset/features.txt")$V2
y_name <- "activity_label"
colnames(df) <- c(subject_name, X_features_names, y_name)
print("Train and test dataframe merged")

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
