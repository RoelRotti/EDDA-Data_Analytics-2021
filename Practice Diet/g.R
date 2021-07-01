
## g) 

# Test in b) is impossible to implement

# Test in c) for lost.4kg and diet can be done in two ways:  
# either by contingency table test; or by using logistic regression.
# Any of the two is ok. We use logistic regression for the test in c).

# Test in c) by logistic regression lost.4kg~diet
lr1=glm(lost.4kg~diet,family=binomial,data=diet)
anova(lr1,test="Chisq") # diet is significant

# Tests in d) and e) can be addressed by the logistic regression
## Test in d) by logistic regression lost.4kg~diet*gender
lr3=glm(lost.4kg~gender*diet,family=binomial,data=diet)
anova(lr3,test="Chisq") # there is an interaction between diet and gender

# Test in e) by logistic regression lost.4kg~diet*height
lr5=glm(lost.4kg~diet*height,family=binomial,data=diet)
anova(lr5,test="Chisq") # no interaction between diet and height
lr6=glm(lost.4kg~diet+height,family=binomial,data=diet) # additive model
drop1(lr6,test="Chisq") # diet is significant, height is not
# or: anova(lr1,lr6,test="Chisq")
