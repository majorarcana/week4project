train_set <- read.table("./dataset/train/X_train.txt")
train_label <- read.table("./dataset/train/y_train.txt")
train_subject <- read.table("./dataset/train/subject_train.txt")
test_set <- read.table("./dataset/test/X_test.txt")
test_label <- read.table("./dataset/test/y_test.txt")
test_subject <- read.table("./dataset/test/subject_test.txt")
joined_set <- rbind(train_set, test_set)
joined_label <- rbind(train_label, test_label)
joined_subject <- rbind(train_subject, test_subject)

features <- read.table("./dataset/features.txt")
mean_standard <- grep("mean\\(\\)|std\\(\\)", features[, 2])
joined_set <- joined_set[, mean_standard]
names(joined_set) <- gsub("\\(\\)", "", features[mean_standard, 2])
names(joined_set) <- gsub("mean", "Mean", names(joined_set))
names(joined_set) <- gsub("std", "Std", names(joined_set))
names(joined_set) <- gsub("-", "", names(joined_set)

activity <- read.table("./dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activity_label <- activity[joined_label[, 1], 2]
joined_label[, 1] <- activity_label

names(joined_label) <- "activity"
names(joined_subject) <- "subject"

clean_data <- cbind(joined_subject, joined_label, joined_set)
write.table(clean_data, "merged_data.txt")

subject_length <- length(table(joined_subject))
activity_length <- dim(activity)[1] 
column_length <- dim(clean_data)[2]
result <- matrix(NA, nrow=subject_length*activity_length, ncol=column_length) 
result <- as.data.frame(result)
colnames(result) <- colnames(clean_data)
row <- 1
for(i in 1:subject_length) {
    for(j in 1:activity_length) {
        result[row, 1] <- sort(unique(joined_subject)[, 1])[i]
        result[row, 2] <- activity[j, 2]
        bool1 <- i == clean_data$subject
        bool2 <- activity[j, 2] == clean_data$activity
        result[row, 3:column_length] <- colMeans(clean_data[bool1&bool2, 3:column_length])
        row <- row + 1
    }
}
write.table(result, "data_with_means.txt")



