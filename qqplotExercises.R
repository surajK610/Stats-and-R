load("skew.RData")
dim(dat)
dat
par(mfrow = c(3,3))
for (i in 1:9) {
  qqnorm(dat[,i], main = i)
  qqline(dat[,i])
  abline(0, 1)
  #par(mfrow=c(1,1))
}