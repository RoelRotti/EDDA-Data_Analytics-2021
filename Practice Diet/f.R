## f) Which of the two approaches, c) or e), do you prefer? Why? 
# For the preferred model, 
# predict the lost weight for all three types of diet for an average person.


# In e) we found there is no interaction. So we use the additive model
mod5=lm(weight.lost~diet+height,data=diet)
drop1(mod5,test="F") # factor diet is significant, variable height is not

## not asked: also summary(mod5) 
# confirms what we had in c)
# Hence the approach from c) is preferable (with only factor diet): 
# no reason to include variable height that has no effect whatsoever. 

# Prediction of the lost weight for all 3 types of diet for an average person:
# the characteristics of a person do not matter as they are not included in our preferred model (just one-way anova with factor diet)

summary(mod1) # and compute the group means: 3.3000kg, 3.3000-0.2741=3.0259kg, 
# 3.3000+1.8481=5.1481kg are expected to loose as result of diets 1,2,3
# Alternatively, by predict command:
newdata=data.frame(diet=c("1","2","3"))
predict(mod1,newdata) # 3.300000kg 3.025926kg 5.148148kg 
