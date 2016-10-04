# Data Set Information:

## Dataset 1:  'DataSet1.csv'

### Summary:

This file contains the non-aggregated experimental measurements for all test subjects, both
during the training phase and the actual test phase of the experiment, including all activity types
and repetitions.

Number of activity types = 6 (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
Number of participants = 30
Number of observations recorded including training and test = 10299
Number of variables measured in each repetition (kept) = 86, not including test subject number and Activity Label
Average number of reps included for each activity type and participant = 57
Number of files used to create data set = 8
    -   column name file (features.txt),
    -   activity type file (activity.txt), 
    -   training and test x & y data, (train/X_train.txt, train/y_train.txt, test/X_test.txt, test/y_test.txt),
    -   test subject for training and test

Column 1 = Activity, character, one row represents one rep of one test subject doing one activity
     (activity type was determined from linking the numeric value given to an activity to its name,
      as provided in the activity labels file provided with the dataset.)
      1. Walking
      2. Walking Upstairs
      3. Walking Downstairs
      4. Sitting
      5. Standing
      6. Laying
Column 2 = the participant number
Columns 3:8 = tbody acceleration means and std devs for x, y and z axes
Columns 9:14 = tbody Gravity acceleration means and std devs for x, y and z axes
Columns 15:20 = tbody Acceleration Jerk means and std devs for x, y and z axes
Columns 21:26 = tbody gyroscopic motion means and std devs for x, y and z axes
Columns 27:32 = tbody gyroscopic jerk means, std devs for x, y, z
Columns 33:34 = tbody magnitude of acceleration?? mean, std devs
Columns 35:36 = tbody gravity acceleration magnitude?? mean, std devs
Columns 37:38 = tbody acceleration jerk magnitude?? mean, std devs
Columns 39:40 = tbody gyroscopic magnitude?? mean, std devs
Columns 41:42 = Tbody gyroscopic jerk magnitude?? mean, std devs
Columns 43:48 = fbody acceleration means and std devs for x, y and z axes
Columns 49:51 = fbody acceleration mean frequency and std devs for x, y and z axes
Columns 52:57 = fbody Acceleration Jerk means and std devs for x, y and z axes
Columns 58:60 = fbody acceleration jerk mean frequencies x, y, z
Columns 61:66 = fbody gyroscopic motion means and std devs for x, y and z axes
Columns 67:69 = fbody gyroscopic mean frequencies x, y, z
Columns 70:72 = fbody acceleration magnitude mean, frequency and std dev
Columns 73:75 = fbody acceleration jerk magnitude mean, frequency and std dev
Columns 76:78 = fbody gyroscopic magnitude mean, frequency and std dev
Columns 79:81 = fbody gyroscopic jerk magnitude mean, frequency and std dev
Column 82 = angle of momentum tbody acceleration mean
Column 83 = angle of momentum tbody acceleration jerk gravity mean
Column 84 = angle of momentum tbody gyroscopic jerk mean
Column 85 = angle of momentum tbody gyroscopic jerk gravity mean
Column 86 = angle of momentum x axis gravity mean
Column 87 = angle of momentum y axis gravity mean
Column 88 = angle of momentum z axis gravity mean

### Units:
velocity = m/s
Acceleration = m/s^2
Angular Velocity = angle/s^2


## Dataset 2:  'MeanResults.csv'

### Summary:

This dataset is aggregated by activity type, then participant number.  The values in columns 3-88
are actually mean values of the repetitions that were included in the first dataset, so they end up being
means of means (of means, since the raw data is also meaned).

Number of activity types = 6
Number of participants = 30
Number of records recorded including training and test = 180
Number of variables measured in each repetition (kept) = 86, not including test subject # or Activity Label
Number of reps included for each activity type and participant = 1
Number of files used to create data set = 1, which is the first dataset

Columns represent the same as in DataSet1, except that each value under a column represents an average value
of that measurement for that activity and that client
