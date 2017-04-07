head(InsectSprays)
?split
class(InsectSprays$spray)

boxplot(split(InsectSprays$count, InsectSprays$spray))
boxplot(InsectSprays$count ~ InsectSprays$spray)

library(dplyr)
install.packages("UsingR")
library(UsingR)
data(nym.2002, package="UsingR")

head(nym.2002)
boxplot(split(nym.2002$place, nym.2002$gender))

males <- filter(nym.2002, gender == "Male")
hist(males$time)
mean(males$time)

females <- filter(nym.2002, gender == "Female")
hist(females$time)
mean(females$time)

plot(nym.2002$time,nym.2002$age, main="Plot of age vs. runners' times in nym.2002 database")
hist(nym.2002$time, main="Times historgram nym.2002 database" ) 
mean(males
  
)
