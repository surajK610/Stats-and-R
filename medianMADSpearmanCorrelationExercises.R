data(ChickWeight)

head(ChickWeight)
plot( ChickWeight$Time, ChickWeight$weight, col=ChickWeight$Diet)

chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time",
                direction="wide")

head(chick)

chick = na.omit(chick)
chick

outlier <- c(chick$weight.4, 3000)
mean(outlier)/ mean(chick$weight.4)
median(outlier)/ median(chick$weight.4)

sd(outlier)/ sd(chick$weight.4)
mad(outlier)/ mad(chick$weight.4)

plot(chick$weight.4, chick$weight.21)

cor <- cor(chick$weight.4, chick$weight.21)
corAO <- cor(c(chick$weight.4, 3000), c(chick$weight.21, 3000))
corAO/cor

cor(chick$weight.4, chick$weight.21,method="spearman")
