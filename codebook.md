#Getting and Cleaning Data Week 4 Projecy Codebook

##Data Source

*https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

**features.txt
**activity_labels.txt
**/train/X_train.txt
**/train/y_train.txt
**/train/subject_train.txt
**/test/X_test.txt
**/test/y_test.txt
**/test/subject_test.txt

##Transformations

*Read /train/y_train.txt, /train/subject_train.txt, /test/X_test.txt, /test/y_test.txt, /test/subject_test.txt and stored them in train_set, train_label, train_subjet, test_set, test_label, test_subjet
*combined train_set and test_set, train_label and test_label, train_subject and test_subject, and stored the results in joined_set, joined_label, joined_subject.
*Read features.txt and store as features
*
*Tidy column names - remve '()', '-', capitalise 'M' in mean and 'S' in std. 
*Read activity_labels.txt and store as activity
*Tidy activity names - make lowerrcase, remove underscores and capitalise first letter afterwards
*Change values of joined_label in accordance with activity
*Change column names to "activity" and "subject"
*combine joined_set, joined_label and joined_subject and store in clean_data
*write clean_data to merged_data.txt
*For each combination of unique subject and activity, calculate the mean measurement with corresponding combination and store in result.
*Write result to data_with_means.txt

##Output

*data_with_means.txt
*merged_data.txt 