#Use this file to organize and re-code the data. The initial commands here come
#with the GSS extract itself and will load the data into R, but all data will
#have simple numeric codes. Categorical variables will not be coded as
#categories and missing values will not be coded as NA.

#### Read in Raw Data #####
#reads the data extract into a data frame called GSS
setwd("input/gss_extract/")
source("GSS.r")
setwd("../..")
#just to check if its here
head(GSS)

#### Re-organize and Re-Code the Data ####
#TODO: do this. Main README has details on what variables you need.


#### Save the Data ####
#save the final GSS dataset to the output directory
save(GSS, file="output/gss_analytical_data.RData")
