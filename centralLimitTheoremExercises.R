library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- na.omit( read.csv(filename) )
pnorm(1) - pnorm(-1)
pnorm(3) - pnorm(-3)

library(rafalib)
library(dplyr)

mean <- mean(unlist(select(dat, Bodyweight)))
sd <-popsd(unlist(select(dat, Bodyweight)))

head(dat)
y <- unlist(select(filter(dat, Diet == "chow", Sex == "M"), Bodyweight))
mean <- mean(y)
sd <- popsd(y)
mean(y < mean + sd) - mean(y < mean - sd)

mean(y < mean + 2 * sd) - mean(y < mean - 2 *sd)

mean(y < mean + 3 * sd) - mean(y < mean - 3 * sd)

qqnorm(y)
abline(0,1)

mypar(2,2)
y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)
y <- filter(dat, Sex=="F" & Diet=="chow") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)
y <- filter(dat, Sex=="M" & Diet=="hf") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)
y <- filter(dat, Sex=="F" & Diet=="hf") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)

y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
avgs <- replicate(10000, mean( sample(y, 25)))
mypar(1,2)
hist(avgs)
qqnorm(avgs)
qqline(avgs)

mean(avgs)
popsd(avgs)
