## d)
# Test for interaction between gender and diet
mod2=lm(weight.lost~gender*diet,data=diet)  
anova(mod2) # interaction between gender and diet is barely present 
## it seems that diet is certainly significant, 
# gender is present as well at least via interaction which is there  

# Why can we not apply the Friedman test? 
# One simple (but not full) answer is: 
# the Friedman test is not relevant 
# because there is no block factor involved here. 
# We can pretend that gender is a block, 
# the test still cannot be applied in view of 
# the wrong design

# Additional reasoning why the Friedman test is not relevant. If we try
friedman.test(diet$weight.lost,diet$diet,diet$gender) 
# we see the problems with NA's
diet2=diet[-c(25,26),] # but even if we remove the rows with NA's, there will 
# still be a problem with the wrong design: we do not have one observations 
# for all combinations of levels of the treatment and block factors
friedman.test(diet2$weight.lost,diet2$diet,diet2$gender) # wrong design
