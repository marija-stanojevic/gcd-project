<h2>Getting and Cleaning Data - coursera course - Project</h2>

In this document you can find more details on how the code run_analysis.R cleans data and brings it to form easy to work with.

Data is taken from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. It has some descriptions, but it is really hard to understand it and have overview of everything, since data is separated in many different files. Data from Inertial Signals subfolders in not used into this analysis.

Before you start using script, download and extract data and put that folder into your Rstudio root. In my case extracted data are in folder 'gcd project' folder which I put into my Rstudio root, so that I can use relative path.

In order to understand better script and anything related to this project, please first get to know data well.

First four lines of code are merging subjects from test and training data into one data frame and saving it into subjects.txt file.

Next eight code lines do the same for X and y data (X = measured data and y = labeled data, ie. expected output).

In line 16, I select all features from X that I want to keep and put them into Z (those are features which present mean and standard deviation of different variables measured).

Using for loop and ifelse statements I make column which contains names of activities, so that each row (activity name) represents activity of person while data in that row was measured (so, when person did activity[i], we got data X[i], ie. Z[i] (just some of the data from X[i])).

In next for loop, I add to activity, Z and subjects data frames one more column called index which represents index of current row. This is needed, so that I can merge those data by index, which is done in next two rows using function merge. Using these transformations, I get new Z data frame which contains indexes + all mean and standard deviation measures (69 columns) + activity type + subject - ie. person id (in total 72 columns)

In line 36, I just drop indexes from the Z dataframe and save data into K data frame (which now has 71 columns). I save K to a file and load it again. Now, I have K data frame which columns names are V1 to V71. In row 41, I rename all the columns, to be easier for the user to understand what is in each column and I write this to Final.txt.

In last step (lines 44 - 46) I aggregate data by finding average (mean) of all data for each activity and each subject. In K, I get aggregated data (still contains 71 columns, but now only 180 rows = 6 activities * 30 subjects - people). I just rename Group.1 and Group.2 rows back into activityType and subject (this was renamed during the aggregation) and save data into file 'FinalMean.txt'.
