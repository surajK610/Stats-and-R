dat <- read.csv("femaleMiceWeights.csv")
#install.packages("dplyr")
library(dplyr)

controls<- filter(dat, Diet=="chow") %>% 
  select(Bodyweight) %>% unlist

treatment<- filter(dat, Diet=="hf") %>% 
  select(Bodyweight) %>% unlist

obs <- mean(treatment) - mean(controls)

population <- read.csv("femaleControlsPopulation.csv")
population <- unlist(population)

mean(sample(population, 12))

n <- 1000
nulls <- vector("numeric", n)
for(i in 1:n)
{
  controls <- sample(population, 12)
  treatment <- sample(population, 12)
  nulls[i] <- mean(treatment) - mean(controls)
}

mean(abs(nulls) > obs)

?mypar

se <- sqrt(var(treatment)/12 + var(control)/12)

?t.test

head(InsectSprays)
?split
class(InsectSprays)

boxplot(split(InsectSprays, InsectSprays[,2]))
boxplot(InsectSprays ~ InsectSprays[,2])

