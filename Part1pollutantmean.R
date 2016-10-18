'''
Write a function named ‘pollutantmean’ that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. 
The function ‘pollutantmean’ takes three arguments: ‘directory’, ‘pollutant’, and ‘id’. 
Given a vector monitor ID numbers, ‘pollutantmean’ reads that monitors’ PM data from 
the directory specified in the ‘directory’ argument and returns the mean of the pollutant across all of the monitors, 
ignoring any missing values coded as NA.
'''
setwd("~/Documents/R/Rcourses/Rprogramming")
pollutantmean <- function(directory, pollutant, id = 1:332) {
  files_list <- list.files(directory, full.names = TRUE)
  data <- data.frame()
  for (i in id) {
    data <- rbind(data, read.csv(files_list[i]))
  }
  mean(data[[pollutant]], na.rm = TRUE)
}
# Frist draft:sprintf function which is derived from the C programming language.
# %d: substitute in an interger
# "%d03", i:to add leading zeros, like 00i
#(http://www.cookbook-r.com/Strings/Creating_strings_from_variables/)
filesname <- function(directory, i){
  changeanem <- sprintf("%03.csv", i)
  filedir <- file.path(directory, changeanem)
  data <- read.csv(fildir, header = TRUE)
  data
}
