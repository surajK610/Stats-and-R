library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

avg <- mean(x)

set.seed(1)
n <- 1000
nulls <- vector("numeric", n)

for(i in 1:n)
{
  nulls[i] <- mean(sample(x, 50)) 
}

mean(abs(nulls - avg) > 1)
hist(nulls)
