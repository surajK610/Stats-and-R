dat <- read.csv("msleep_ggplot2.csv")
head(dat)
class(dat)
primates <- filter(dat, order =="Primates") %>% select(sleep_total)
primates
nrow(primates)
class(primates)
mean(unlist(primates))


?summarize
summarize(primates, mean(sleep_total))

