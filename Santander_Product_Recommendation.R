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
partialData <- read.csv(con, nrows=1000)
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

# aggregate of 'age' and sum of 'ind_nomina_ult1'
aggdata <-aggregate(data_age_payroll$ind_nomina_ult1, by=list(data_age_payroll$age), FUN=sum)
aggdata

#----------------------------------------
# plot of 'int_nomina_ult1' of each age 
# Density curve
plot(data_age_payroll$age, data_age_payroll$ind_nomina_ult1, type="l", xlab="Age", ylab="Hold Payroll Account" ) 

#---------------------------
# close connection to file
close(con)

