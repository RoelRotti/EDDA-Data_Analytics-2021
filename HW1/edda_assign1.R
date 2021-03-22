# Exercise 1. Birth weights
# before set working directory to folder containing data sets
# setwd("~/Artificial Intelligence Msc/Year1/Periode4/EDDA/EDDA_ASSIGN1")
data = read.table("birthweight.txt", header=TRUE)
# a
par(mfrow=c(1,3))
hist(data$birthweight, main='Birthweight')
boxplot(data$birthweight)
qqnorm(data$birthweight)

sample_mean = mean(data$birthweight)

sample_sd = sd(data$birthweight)
quantile = qnorm(0.05) # in range [0.05, 0.95]
margin_error = abs(quantile)*(sample_sd/sqrt(length(data$birthweight)))
sample_mean-margin_error #lower bound
sample_mean+margin_error #upper bound

# b
t.test(data$birthweight, mu=2847, alternative = "greater", conf.level = 0.90)
t.test(data$birthweight, mu=2800, alternative = "greater", conf.level = 0.95)

# Excercise 2. Power function of the t-test
#a
n=m=30; mu=180; sd=5; B=1000 

nu= seq(175,185,by=0.25)

power_ttest = numeric(length(nu))
for(i in 1:length(nu)){
  pttest= numeric(B)
  for(j in 1:B){
    x=rnorm(n,mu,sd)
    y=rnorm(m,nu[i],sd)
    pttest[j]=t.test(x,y)[[3]]
  }
  power_ttest[i] = sum(pttest<0.05)/length(pttest)
}
par(mfrow=c(1,1))
plot(nu, power_ttest)

# b
n=m=100; mu=180; sd=5; B=1000 

nu= seq(175,185,by=0.25)

power_ttest = numeric(length(nu))
for(i in 1:length(nu)){
  pttest= numeric(B)
  for(j in 1:B){
    x=rnorm(n,mu,sd)
    y=rnorm(m,nu[i],sd)
    pttest[j]=t.test(x,y)[[3]]
  }
  power_ttest[i] = sum(pttest<0.05)/length(pttest)
}
par(mfrow=c(1,1))
plot(nu, power_ttest)

# c
n=m=30; mu=180; sd=15; B=1000 

nu= seq(175,185,by=0.25)

power_ttest = numeric(length(nu))
for(i in 1:length(nu)){
  pttest= numeric(B)
  for(j in 1:B){
    x=rnorm(n,mu,sd)
    y=rnorm(m,nu[i],sd)
    pttest[j]=t.test(x,y)[[3]]
  }
  power_ttest[i] = sum(pttest<0.05)/length(pttest)
}
par(mfrow=c(1,1))
plot(nu, power_ttest)

# Exercise 3. Telecommunication company
# before set working directory to folder containing data sets
# setwd("~/Artificial Intelligence Msc/Year1/Periode4/EDDA/EDDA_ASSIGN1")
data = read.table("telephone.txt", header=TRUE) 
hist(data$Bills)
