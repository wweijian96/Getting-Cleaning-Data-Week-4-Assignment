# 1. Load packages
library(dplyr)

# 2. Combine data for training
train_subject_id = read.table("subject_train.txt", header = F)
train_activity = read.table("y_train.txt", header = F)
train_outputs = read.table("X_train.txt", head = F)
train_data = cbind(type = "train", train_subject_id, train_activity, train_outputs)

# 3. Combine data for test
test_subject_id = read.table("subject_test.txt", header = F)
test_activity = read.table("y_test.txt", header = F)
test_outputs = read.table("x_test.txt", header = F)
test_data = cbind(type = "test", test_subject_id, test_activity, test_outputs)

# 4. Find relevant columns containing mean() and std() values
features = read.table("features.txt", header = F)
columns_with_means = as.list(grep("mean()", features$V2))
columns_with_meanfreq = as.list(grep("meanFreq()", features$V2))
edited_columns_with_means = columns_with_means[!(columns_with_means %in% columns_with_meanfreq)]
columns_with_std = as.list(grep("std()", features$V2))
total_columns = unlist(c(edited_columns_with_means, columns_with_std)) + 3
ordered_total_columns = total_columns[order(total_columns)]
# 4a. Retrieve names of relevant columns
variable_names = features[(ordered_total_columns - 3),]
class(variable_names$V2)
names = as.character(variable_names$V2)

# 5. Combine both data sets
merged_data = rbind(train_data, test_data)
filtered_merged_data = merged_data[,c(1:3, ordered_total_columns)]
colnames(filtered_merged_data) = c("type", "id", "activity", names)
final_output = arrange(filtered_merged_data, type, id, activity)
for(i in 1:6) {
  list = c("walking", "walking upstairs", "walking downstairs",
           "sitting", "standing", "laying")
  final_output$activity[final_output$activity == i] <- list[i]
}

# 6. Create new data set
sp = split(final_output, list(final_output$activity, final_output$id, final_output$type))
average = sapply(sp, function(x) colMeans(x[, 4:69]))
average = as.data.frame(average)
average_edit = average %>% select_if(~ !any(is.nan(.)))

# 7. Save output
write.table(average_edit, file = "Week 4 Assignment.txt", row.names = F)
