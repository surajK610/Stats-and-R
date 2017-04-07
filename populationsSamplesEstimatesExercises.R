library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename) 
dat <- na.omit( dat )

#MALES
library(dplyr)
x <- filter(dat, Diet == "chow", Sex == "M")
x <- unlist(select(x, Bodyweight))
MX <- mean(x)

install.packages("rafalib")
library(rafalib)
popsd(x)

set.seed(1)
mX <- mean(sample(x, 25))

y <- filter(dat, Diet == "hf", Sex == "M")
y <- unlist(select(y, Bodyweight))
y
MY <- mean(y)

popsd(y)

set.seed(1)
mY <- mean(sample(y, 25))
abs((MY -MX) - (mY - mX))


#FEMALES
x <- filter(dat, Diet == "chow", Sex == "F")
x <- unlist(select(x, Bodyweight))
MX <- mean(x)


popsd(x)

set.seed(1)
mX <- mean(sample(x, 25))

y <- filter(dat, Diet == "hf", Sex == "F")
y <- unlist(select(y, Bodyweight))
y
MY <- mean(y)

popsd(y)

set.seed(1)
mY <- mean(sample(y, 25))
abs((MY -MX) - (mY - mX))
