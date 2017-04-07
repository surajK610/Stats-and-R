d = read.csv("assoctest.csv")
tab <- table(d$allele, d$case)
tab
chisq.test(tab)
fisher.test(tab)
