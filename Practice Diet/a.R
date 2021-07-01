diet=read.table("diet.txt",header=TRUE);

## a) By using only the columns preweight and weight6weeks, 
##test the claim that the diet affects
##the weight loss. Give and check the assumptions of the test(s) applied.

# x = preweight, y = postweight
x=diet$preweight;y=diet$weight6weeks

# we intend to use paired t-test, first check normality
# make space for 2 plots
par(mfrow=c(1,2))

#check normality assumption
qqnorm(x);hist(x) # does not look normal
qqnorm(y);hist(y) # does not look normal


qqnorm(y-x);hist(y-x) #shapiro.test(y-x) # but the difference is actually ok
t.test(x,y,alt="g",paired=T) # test says diet works, p < 0.05

## The samples x, y do not look normal, we can also use Mann-Whitney test

wilcox.test(x,y, alt = 'g', paired=T) # also this test says diet works 
# one can set in wilcoxon test alt="g", but it's fine without
