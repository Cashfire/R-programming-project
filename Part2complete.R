setwd("~/Documents/R/Rcourses/Rprogramming")
complete <- function(directory, id = 1:332){
  nobs = numeric()
  for (i in id){
    file = file.path(directory, sprintf("%03d.csv", i))
    data <- read.csv(file, header = TRUE)
    nobs = c(nobs, sum(complete.cases(data[, 2:3])))
  }
  return(data.frame(id, nobs))
}
#complete("specdata", c(2,4,8,10,12))
#complete("specdata", 30:25)
#complete("specdata", 3)
# Alternative way: paste and lapply
complete <- function(directory, id = 1:332){
  cases <- function(i){
    path = paste(directory, '/', formatC(i, width = 3, flag = "0"), ".csv", sep = "")
    data = read.csv(path)
    sum(complete.cases(data))
  }
  nobs = sapply(id, cases)
  return(data.frame(id, nobs))
}