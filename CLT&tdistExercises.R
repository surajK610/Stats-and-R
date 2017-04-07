library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
if(!file.exists("femaleMiceWeights.csv")) download(url,destfile=filename)
dat <- read.csv(filename)

?replicate
set.seed(1)

n <- 100
numTimes <- 0
for(i in 1:10000)
{
x <-  sample(1:6, n, replace = TRUE)
p=1/6
p*(1-p)/n
z  <- (mean(x==6) - p)/sqrt(p*(1-p)/n)
z
}
mean((abs(zs) >2))

set.seed(1)
n <- 100
sides <- 6
p <- .01
zs <- replicate(10000,{
  x <- sample(1:sides,n,replace=TRUE)
  (mean(x==6) - p) / sqrt(p*(1-p)/n)
}) 
qqnorm(zs)
abline(0,1)#confirm it's well approximated with normal distribution
mean(abs(zs) > 2)


X <- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist
Y <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% unlist
mean(X)
sd(X)

mu_hf <- mean(Y)
mu_control <- mean(X)
print(mu_hf - mu_control)

sd_control <- popsd(X)
sd_hf <- popsd(Y)

N <- 12
hf <- sample(hfPopulation, 12)
control <- sample(controlPopulation, 12)

2 * ( 1-pnorm(2/sd(X) * sqrt(12) ) )
2/sd(X) * sqrt(12)
sqrt(var(X)/12 + var(Y)/12)


(mean(Y) - mean(X))/(sqrt(var(X)/12 + var(Y)/12))
t.test(X, Y)

2 * (1 - pnorm(2.0552))
