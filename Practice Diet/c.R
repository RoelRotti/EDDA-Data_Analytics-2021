## c) Using now weight.lost as response variable, 
## apply one-way ANOVA to test whether type of diet 
## has an effect on the lost weight. 
## Do all three types diets lead to weight loss? 
## Which diet was the best for losing weight?

diet$diet=factor(diet$diet) # make the variable diet factor
## is.factor(diet$diet) # just to check that it became factor
mod1=lm(weight.lost~diet,data=diet)
anova(mod1) ## p=0.003229, diet has an effect on the lost wight

par(mfrow=c(1,2)) # check the normality assumption
qqnorm(residuals(mod1)) # looks ok
plot(fitted(mod1),residuals(mod1)) # looks ok, remember there are just 3 fitted values

## Do all three types of diets lead to weight loss? 
# Yes, as all cell means mu+alpha_i>0 are positive.

# Which diet was best for losing weight?   
summary(mod1) # diet 3 is the best
