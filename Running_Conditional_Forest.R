library(caret)
library(party)

set.seed(123)

#Data Import and Type Adjustment
cf_data<-MPA_Indo_Gov_CF_Input_Data
cf_data$Type.of.Zone<-as.factor(cf_data$Type.of.Zone)

#Conditional Random Forest
mpa_indo_cf<-cforest(mpa_eff~., data=cf_data, controls = cforest_unbiased(mtry = 6, ntree = 10000))
caret::cforestStats(mpa_indo_cf)

#Variable Importance Measurements with Conditional Importance
cf.imp.full<-data.frame(varimp(mpa_indo_cf, conditional = T))
