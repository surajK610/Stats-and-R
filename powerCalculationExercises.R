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
dat.ns <- sample(bwt.nonsmoke, 5)
dat.s <- sample(bwt.smoke, 5)

t.test(dat.ns, dat.s)
alpha <- .05

reject <- function(n, alpha)
{dat.ns <- sample(bwt.nonsmoke, n)
dat.s <- sample(bwt.smoke, n)
t.test(dat.ns, dat.s)$p.value < alpha}

timesPLessAlpha <- replicate(10000, reject(5, alpha))

power <- mean(timesPLessAlpha)
print(power)


mean(replicate(10000, reject(30, alpha)))
mean(replicate(10000, reject(60, alpha)))
mean(replicate(10000, reject(90, alpha)))
mean(replicate(10000, reject(120, alpha)))

alpha = .01
mean(replicate(10000, reject(30, alpha)))
mean(replicate(10000, reject(60, alpha)))
mean(replicate(10000, reject(90, alpha)))
mean(replicate(10000, reject(120, alpha)))
