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

#ncodpers 	Customer code
#ind_empleado 	Employee index: A active, B ex employed, F filial, N not employee, P pasive (is employee of bank)
#ind_cno_fin_ult1 	Payroll Account
#conyuemp  	Spouse index. 1 if the customer is spouse of an employee
#segmento  	segmentation: 01 - VIP, 02 - Individuals 03 - college graduated

#------------------------
#scatter plot matrics
pairs(partialData[,2:7])

customerNo <- partialData[, c("ncodpers")]
customerNo

segmentation <- partialData[, c("segmento")] 
segmentation 

age <- partialData[, c("age")]
age
payrollAccount <- partialData[,c("ind_cno_fin_ult1")]
payrollAccount

plot(segmentation, payrollAccount)
qplot(customerNo, age, data=partialData, geom="line")

dataForPCA <- partialData[, c("ncodpers", "age", "renta", "antiguedad")]  # ind_ahor_fin_ult1", "ind_tjcr_fin_ult1")]
dataForPCA[is.na(dataForPCA)] <- 0 #replace NA with zero
dataForPCA

#---------------------------------------
# PCA (Principle Component Analysis)
prin_comp <- prcomp(dataForPCA, scale. = T)
names(prin_comp)

biplot(prin_comp, scale = 0)

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

