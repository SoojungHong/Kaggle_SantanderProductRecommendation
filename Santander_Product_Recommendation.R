#---------------
# library 
library(ggplot2)

#---------------------------------------
# Set training data and connect to it 
# 
trainingData <- '/Users/soojunghong/Documents/kaggle/data/train_ver2.csv'
con = file(trainingData, "r")

#----------------
# Read 20 rows
partialData <- read.csv(con, nrows=200)
partialData
str(partialData)

#----------------------
# 'age' and 'payroll' 
data_age_payroll <- partialData[, c("ncodpers","age", "ind_nomina_ult1")]
data_age_payroll

# get the range for the x and y axis
ageRange <- range(partialData$age)
payrollRange <- range(partialData$ind_nomina_ult1)
ageRange
payrollRange

# Density curve
ggplot(data_age_payroll, aes(x=age, y=ind_nomina_ult1)) + geom_density()


#---------------------------
# close connection to file
close(con)

