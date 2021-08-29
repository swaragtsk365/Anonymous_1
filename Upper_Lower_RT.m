function Upper_Lower_RT()
Data=readtable('RTFilteredPlaceboSampleData2Categorywithout5050trials.csv');
Data.response=categorical(Data.response)
Model='RT~response+(1|subj_idx)';
mdl1 = fitglme(Data,Model,'Distribution','Normal','link','identity','FitMethod','MPL');
aic1=mdl1.ModelCriterion.AIC;
bic1=mdl1.ModelCriterion.BIC;
anova(mdl1)
p=mdl1
end