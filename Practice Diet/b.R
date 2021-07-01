## b) Compute and add to the data frame the variable weight.lost 
## expressing the lost weight.
## Test the claim that the median lost weight is bigger than 3 kg.


# compute and add weight.lost
diet$weight.lost=diet$preweight-diet$weight6weeks

# We reduce the testing problem to a binomial test, 
# let X be the lost weight.  

# Notice that...
# H0: med(X)<= 3 
# H1: med(X)>3

# ... is the same as... 

# H0: p=P(X>3)<=0.5
# H1: p>0.5  


# The latter is a binomal test. So, 

#n = observed values
#w = sum of all >3 values
n=length(diet$weight.lost); w=sum(diet$weight.lost>3)


binom.test(w,n,0.5,alt="g") # p-value=0.04439<0.05, 
#we reject H0, hence the claim med(X)>3 is correct.

