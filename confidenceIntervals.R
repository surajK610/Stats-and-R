url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

library(dplyr)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)

set.seed(1)
dat.ns <- sample(bwt.nonsmoke, 25)
dat.s <- sample(bwt.smoke, 25)

tval <- (mean(dat.ns) - mean(dat.s))/sqrt(var(dat.ns)/25 + var(dat.s)/25)
tval

N <- 25
qt(.995, 2*N-2) * sqrt(var(dat.ns)/N + var(dat.s)/25)


set.seed(1)
dat.ns <- sample(bwt.nonsmoke, 5)
dat.s <- sample(bwt.smoke, 5)
t.test(dat.ns, dat.s)

