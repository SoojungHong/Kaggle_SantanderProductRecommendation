#---------------------------------------
# Set training data and connect to it 
# 
trainingData <- '/Users/soojunghong/Documents/kaggle_recommender/train_ver2.csv'
con = file(trainingData, "r")

#----------------
# Read 20 rows
partialData <- read.csv(con, nrows=20)
partialData
str(partialData)
