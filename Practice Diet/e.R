## e)
is.numeric(diet$height) # just to check height is numeric
mod4=lm(weight.lost~diet*height,data=diet)
anova(mod4) # no interaction between diet and height

## Is the effect of height the same for all 3 types of diet?
# Yes, because there is no interaction between diet and height. 
# Now we test for the main effects by using the additive model 
anova(lm(weight.lost~diet+height,data=diet))
# conclude that diet is significant and height is not. 
