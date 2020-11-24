# Getting-Cleaning-Data-Week-4-Assignment
### Description for "run analysis.R" code

Hello! This README.md contains the description for the code I used to obtain the tidy dataset! :)

**Step 1** simply loads in the relevant packages containing the functions used in this code.

**Steps 2 & 3** read in the text files for each set (training or test) and combines the text files into one big dataset.

**Step 4** accomplishes several things. First, we must understand that the rows in features.txt (i.e. the variables) correspond to the columns in the big datasets obtained above. 
By knowing this, we then understand how to extract the relevant columns from the big datasets. 
To begin, the columns containing the required variables (mean and standard deviation) are filtered from the features dataset using grep(). Note that grep(mean()) also subsets 
variables containing meanFreq(), so these were removed subsequently via an additional subset step. These were saved as lists and concatenated, then unlisted and 3 was added to 
each value (this is because in the big dataset, there are 3 columns before the variable columns - data type, subject ID and activity type). The data was then ordered to facilitate
downstream formatting.
Additionally, the variable names were subsetted in a similar fashion and saved as characters.

**Step 5** if where we get our big, combined dataset. The datasets from steps 2 & 3 are first combined and subsetted according to the columns that we require (that's where the 
output from step 4 comes in). Similarly, the names of the subsetted dataset are edited, and the dataset is arranged based on data type, subject ID and activity type. Finally, the data for the activity type is changed from numbers to something more descriptive using a for-loop. 

