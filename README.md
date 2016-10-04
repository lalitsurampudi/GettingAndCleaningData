##  Getting and Cleaning Data Course Project

### Data Collection:

The data files were downloaded as a zip folder from the link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
    
The following are the files and their descriptions that were used in this assignment:

    - 'features.txt': List of all features.
    - 'activity_labels.txt': Links the class labels with their activity name.
    - 'train/X_train.txt': Training set.
    - 'train/y_train.txt': Training labels.
    - 'test/X_test.txt': Test set.
    - 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

'train/subject_train.txt':

Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

'train/X_train.txt and test/X_test.txt':

The training and testing data sets measured acceleration, movements in the x, y and z axes.  Each measurement was conducted over a specific period of time, with one time-period being 2.56 seconds.  128 readings were taken within each 2.56 second interval, and though the number of repetitions on these measuremments were about 54, the actual number of reps did vary slightly from subject-to-subject.

'activity_labels.txt':

The protocol of activities recorded in the training and testing data sets composed of six basic activities: three static postures (standing, sitting, lying) and three dynamic activities (walking, walking downstairs and walking upstairs).

'features_info.txt':

The measurements provided by the smartphone including the following types of data:
    1.   tri-axial acceleration (x, y and z directions) which is a rate determination of how fast a person increased or decreased speed in each of the spatial coordinates.
    2.  tri-axial angular velocity - basically how fast the body is changing position, say, turning left and up, or moving down and right

The authors determined means of these multiple different measurements, as well as standard deviations, 
and it was these that were used for the Getting and Cleaning Data exercise

'run_analysis.R':
The R script contains the commands which on serial execution load the libraries, source data sets, tidy data, merge, transform and aggregate the data in to a complete final data frame ready to perform analysis.

### Source:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 

2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws
