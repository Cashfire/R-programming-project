# cacluate the correlation between sulfate and nitrate.
# for monitors whoes complete case > treshold requirment.

corr <- function(directory, threshold = 0){
  result <- numeric()
  for (i in 1:332){
    path <- file.path(directory, sprintf("%03d.csv", i))
    data <- read.csv(path, header = TRUE)
    nobs <- sum(complete.cases(data[ ,2:3]))
    if (nobs>threshold){
      result <- c(result, cor(data[,2], data[,3], use="complete.obs"))
    }
  }
  result
}

# cr <- corr("specdata", 150)
# head(cr)
# summary(cr)
# cr <- corr('specdata', 400)
# head(cr)
# summary(cr)
# cr <- corr('specdata', 5000)
# summary(cr)
# length(cr)
# cr <- corr("specdata")
# summary(cr)
# length(cr)
# Alternative
setwd("~/Documents/R/Rcourses/Rprogramming")
data <- lapply(dir(), read.csv)