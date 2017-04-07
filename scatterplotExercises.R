data(nym.2002, package="UsingR")
library(dplyr)

males <- filter(nym.2002, gender == "Male") 
females <- filter(nym.2002, gender == "Female") 

cor(males$age, males$time)
cor(females$age, females$time)


mypar(2,2)
plot(females$age, females$time)
plot(males$age, males$time)
group <- floor(females$age/5) * 5
boxplot(females$time~group)
group <- floor(males$age/5) * 5
boxplot(males$time~group)