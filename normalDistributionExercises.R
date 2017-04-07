library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

library(dplyr)
set.seed(1)
n <- 1000
nulls1 <- vector("numeric", n)
for(i in 1:n)
{
  nulls1[i] <- mean(sample(x, 5))
}

set.seed(1)
o <- 1000
nulls2 <- vector("numeric", o)
for(i in 1:o)
{
  nulls2[i] <- mean(sample(x, 50))
}
hist(nulls1)
hist(nulls2)

mean(nulls2 < 25) - mean(nulls2 < 23)


set.seed(1)
o <- 1000
nulls2 <- vector("numeric", o)
for(i in 1:o)
{
  nulls2[i] <- mean(sample(x, 50))
}

mean = 23.9
sd = .43



