library(dplyr)
install.packages("gapminder")

library(gapminder)
data(gapminder)
head(gapminder)

x <- filter(gapminder, year == 1952)%>% select(lifeExp) %>% unlist
x
hist(x)
mean(x<=40)

mean(x<=60) - mean(x <=40)
ecdf()

#function to calculate the probabity if less than or equal to this age for countries
prop = function(q) {
  mean(x <= q)
}

qs <- seq(from=min(x), to=max(x), length=20)
qs

?sapply
props <- sapply(qs, prop)
plot(qs, props)


plot(ecdf(x))
