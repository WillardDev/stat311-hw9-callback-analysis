# STAT311 - Homework 9
# Name:

# Students who intend to use the predict(...) function for these
#  problems are advised to consult the documentation in
#  ?predict.glm to determine how it is used for different types of 
#  predictions in the context of logistic regression.

# Do not edit the following
BerkeleyData<-read.csv("BerkeleyData.csv")
# Do not edit the above

# ============================================================================
# QUESTION 1: Logistic regression predicting acceptance based on sex only
# ============================================================================

# Fit a logistic regression model that predicts acceptance
#  based on the sex of the applicant.
# Save the model as model.q1.
# Note for autograder: You must fit this model using the format
#  glm(var1~var2+..., data=BerkeleyData); do not rename variables in
#  the data frame.
model.q1<-glm(accepted~female, data=BerkeleyData, family='binomial')

# What are the log-odds of being accepted for a male applicant?
# For males, female=FALSE, so we use the intercept only
# Save your answer in the variable q1.a
q1.a<-coef(model.q1)[1]  # Intercept (log-odds for males)

# What are the odds of being accepted for a female applicant?
# For females, female=TRUE, so log-odds = intercept + femaleTRUE coefficient
# Odds = exp(log-odds)
# Save your answer in the variable q1.b
log_odds_female <- coef(model.q1)[1] + coef(model.q1)[2]
q1.b<-exp(log_odds_female)

# What is the probability of being accepted for a male applicant?
# Probability = exp(log-odds) / (1 + exp(log-odds))
# Save your answer in the variable q1.c
q1.c<-exp(q1.a) / (1 + exp(q1.a))

# What is the probability of being accepted for a female applicant?
# Save your answer in the variable q1.d
q1.d<-exp(log_odds_female) / (1 + exp(log_odds_female))

# (Hidden answer) Based on this model, without considering other variables, 
#  does it appear that there is a statistically significant gender disparity 
#  in the admissions of Berkeley?
# Answer TRUE or FALSE
# Save your answer in the variable q1.e
# Check p-value of the female coefficient
summary_q1 <- summary(model.q1)
p_value_q1 <- summary_q1$coefficients["femaleTRUE", "Pr(>|z|)"]
q1.e<-p_value_q1 < 0.05

# ============================================================================
# QUESTION 2: Logistic regression with sex and department, no interactions
# ============================================================================

# Fit a logistic regression model that predicts acceptance
#  based on the sex of the applicant and department, with no interactions.
# Save the model as model.q2.
# Note for autograder: You must fit this model using the format
#  glm(var1~var2+..., data=BerkeleyData); do not rename variables in
#  the data frame.
model.q2<-glm(accepted~female+department, data=BerkeleyData, family='binomial')

# What is the change in log-odds of being accepted for someone applying to
#  department E?
# This is the coefficient for departmentE
# Save your answer in the variable q2.a
q2.a<-coef(model.q2)["departmentE"]

# What is the log-odds of a female applicant being accepted into department C?
# log-odds = intercept + femaleTRUE + departmentC
# Save your answer in the variable q2.b
q2.b<-coef(model.q2)[1] + coef(model.q2)["femaleTRUE"] + coef(model.q2)["departmentC"]

# What is the multiplicative change in odds for a female applicant?
# This is exp(coefficient for femaleTRUE)
# Save your answer in the variable q2.c
q2.c<-exp(coef(model.q2)["femaleTRUE"])

# What is the probability of being accepted to department A for a male applicant?
# For dept A (reference level) and male (female=FALSE): log-odds = intercept
# Save your answer in the variable q2.d
log_odds_male_A <- coef(model.q2)[1]
q2.d<-exp(log_odds_male_A) / (1 + exp(log_odds_male_A))

# What is the probability of being accepted to department A for a female applicant?
# For dept A and female: log-odds = intercept + femaleTRUE
# Save your answer in the variable q2.e
log_odds_female_A <- coef(model.q2)[1] + coef(model.q2)["femaleTRUE"]
q2.e<-exp(log_odds_female_A) / (1 + exp(log_odds_female_A))

# (Hidden answer) Which department appears to be the most difficult to 
# be admitted to? Your answer should be in the form "A", "B", ..., or "F"
# Save your answer in the variable q2.f
# Most difficult = most negative coefficient (or A if it's the reference)
dept_coeffs <- coef(model.q2)[grep("department", names(coef(model.q2)))]
if(length(dept_coeffs) == 0 || min(dept_coeffs) > 0) {
  q2.f <- "A"  # Reference category is most difficult
} else {
  most_difficult_dept <- names(dept_coeffs)[which.min(dept_coeffs)]
  q2.f <- substr(most_difficult_dept, nchar(most_difficult_dept), nchar(most_difficult_dept))
}

# (Hidden answer) Which department appears to be the easiest to 
# be admitted to? Your answer should be in the form "A", "B", ..., or "F"
# Save your answer in the variable q2.g
# Easiest = most positive coefficient
if(length(dept_coeffs) == 0) {
  q2.g <- "A"  # Only reference category
} else {
  # Compare reference (0) with other departments
  max_coeff <- max(dept_coeffs)
  if(max_coeff < 0) {
    q2.g <- "A"  # Reference is easiest
  } else {
    easiest_dept <- names(dept_coeffs)[which.max(dept_coeffs)]
    q2.g <- substr(easiest_dept, nchar(easiest_dept), nchar(easiest_dept))
  }
}

# (Hidden answer) Based on this model, without considering other variables, 
#  does it appear that there is a statistically significant gender disparity 
#  in the admissions of Berkeley?
# Answer TRUE or FALSE
# Save your answer in the variable q2.h
summary_q2 <- summary(model.q2)
p_value_q2 <- summary_q2$coefficients["femaleTRUE", "Pr(>|z|)"]
q2.h<-p_value_q2 < 0.05

# ============================================================================
# QUESTION 3: Logistic regression with sex, department, and interaction
# ============================================================================

# Fit a logistic regression model that predicts acceptance
#  based on the sex of the applicant and department, including an interaction
#  between the two variables.
# Save the model as model.q3.
# Note for autograder: You must fit this model using the format
#  glm(var1~var2+..., data=BerkeleyData); do not rename variables in
#  the data frame.
model.q3<-glm(accepted~female*department, data=BerkeleyData, family='binomial')

# What is the multiplicative odds impact of a male applicant to department C
#  compared to a male applicant to department A?
# For males (female=FALSE), this is exp(departmentC coefficient)
# Save your answer in the variable q3.a
q3.a<-exp(coef(model.q3)["departmentC"])

# What is the multiplicative odds impact of a female applicant to department C
#  compared to a male applicant to department A?
# Female dept C vs Male dept A: exp(femaleTRUE + departmentC + femaleTRUE:departmentC)
# Save your answer in the variable q3.b
interaction_term <- ifelse("femaleTRUE:departmentC" %in% names(coef(model.q3)), 
                           coef(model.q3)["femaleTRUE:departmentC"], 0)
log_odds_change <- coef(model.q3)["femaleTRUE"] + coef(model.q3)["departmentC"] + interaction_term
q3.b<-exp(log_odds_change)

# What is the multiplicative odds impact of a female applicant to department E
#  compared to a male applicant to department E?
# This is the gender effect in dept E: exp(femaleTRUE + femaleTRUE:departmentE)
# Save your answer in the variable q3.c
interaction_E <- ifelse("femaleTRUE:departmentE" %in% names(coef(model.q3)), 
                        coef(model.q3)["femaleTRUE:departmentE"], 0)
q3.c<-exp(coef(model.q3)["femaleTRUE"] + interaction_E)

# What is the multiplicative odds impact of a female applicant to department F
#  compared to a male applicant to department F?
# Save your answer in the variable q3.d
interaction_F <- ifelse("femaleTRUE:departmentF" %in% names(coef(model.q3)), 
                        coef(model.q3)["femaleTRUE:departmentF"], 0)
q3.d<-exp(coef(model.q3)["femaleTRUE"] + interaction_F)

# What is the probability of acceptance for a male applicant to department B?
# Male dept B: log-odds = intercept + departmentB
# Save your answer in the variable q3.e
log_odds_male_B <- coef(model.q3)[1] + coef(model.q3)["departmentB"]
q3.e<-exp(log_odds_male_B) / (1 + exp(log_odds_male_B))

# What is the probability of acceptance for a female applicant to department B?
# Female dept B: log-odds = intercept + femaleTRUE + departmentB + femaleTRUE:departmentB
# Save your answer in the variable q3.f
interaction_B <- ifelse("femaleTRUE:departmentB" %in% names(coef(model.q3)), 
                        coef(model.q3)["femaleTRUE:departmentB"], 0)
log_odds_female_B <- coef(model.q3)[1] + coef(model.q3)["femaleTRUE"] + 
  coef(model.q3)["departmentB"] + interaction_B
q3.f<-exp(log_odds_female_B) / (1 + exp(log_odds_female_B))

# (Hidden answer) The model coefficient "femaleTRUE" has a p-value of 6.21x10-5.
#  (Assuming you fit things correctly, hint I guess) TRUE or FALSE: This 
#  indicates a statistically significant difference of admissions for female 
#  applicants to Berkeley.
# Answer TRUE or FALSE
# Save your answer in the variable q3.g
# A p-value of 6.21x10-5 = 0.0000621 is much less than 0.05
q3.g<-TRUE

