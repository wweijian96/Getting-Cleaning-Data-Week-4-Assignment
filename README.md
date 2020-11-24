# Getting-Cleaning-Data-Week-4-Assignment
### Description for "run analysis.R" code

Hello! This README.md contains the description for the code I used to obtain the tidy dataset! :)

Step 1 simply loads in the relevant packages containing the functions used in this code.

Steps 2 & 3 read in the text files for each set (training or test) and combines the text files into one big dataset.

Step 4 accomplishes several things. First, we must understand that the rows in features.txt (i.e. the variables) correspond to the columns in the big datasets obtained above. By 
knowing this, we then understand how to extract the relevant columns from the big datasets. 
To begin, the columns containing the required variables (mean and standard deviation) are filtered from the features dataset using grep(). Note that grep(mean()) also subsets 
variables containing meanFreq(), so these were removed subsequently via an additional subset step.
