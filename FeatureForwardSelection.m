function TA1=FeatureForwardSelection(Data,k)
A=readtable(Data);
Cat1=categorical(table2array(A(:,{'Cat1'})));
Cat2=categorical(table2array(A(:,{'Cat2'})));
LT=categorical(table2array(A(:,{'LT'})));
JP=categorical(table2array(A(:,{'JP'})));
AD=categorical(table2array(A(:,{'AD'})));
X=[Cat1, Cat2, LT, JP, AD];
Y=table2array(A(:,{'RT'}));
B=table(Cat1, Cat2, LT, JP, AD,Y);
mdl=stepwiseglm(B,"linear","Distribution","inverse gaussian",'CategoricalVars',[1 1 1 1 1],'Criterion',"aic",'PEnter',0,'Lower','linear');
TA1=mdl.Coefficients;
TA2=mdl.Coefficients.Properties.RowNames;
Names=TA2(:,1);
Estimate=table2array(TA1(:,{'Estimate'}));
SE=table2array(TA1(:,{'SE'}));
tStat=table2array(TA1(:,{'tStat'}));
pValue=table2array(TA1(:,{'pValue'}));
Total=table(Names,Estimate,SE,tStat,pValue);
Name1='Criterion_AIC_WithAllVariablesSubj'+string(k)+'SWGLM_Report.csv';
writetable(Total,Name1)
mdl2=stepwiseglm(B,"linear","Distribution","inverse gaussian",'CategoricalVars',[1 1 1 1 1],'Criterion',"bic",'PEnter',0,'Lower','linear');
TA12=mdl2.Coefficients;
TA22=mdl2.Coefficients.Properties.RowNames;
Names2=TA22(:,1);
Estimate2=table2array(TA12(:,{'Estimate'}));
SE2=table2array(TA12(:,{'SE'}));
tStat2=table2array(TA12(:,{'tStat'}));
pValue2=table2array(TA12(:,{'pValue'}));
Total2=table(Names2,Estimate2,SE2,tStat2,pValue2);
Name2='Criterion_BIC_WithAllVariablesSubj'+string(k)+'SWGLM_Report.csv';
writetable(Total2,Name2)
C=table(Cat1, Cat2,AD,Y);
mdl3=stepwiseglm(C,"linear","Distribution","inverse gaussian",'CategoricalVars',[1 1 1 1 1],'Criterion',"aic",'PEnter',0,'Lower','linear');
TA13=mdl3.Coefficients;
TA23=mdl3.Coefficients.Properties.RowNames;
Names3=TA23(:,1);
Estimate3=table2array(TA13(:,{'Estimate'}));
SE3=table2array(TA13(:,{'SE'}));
tStat3=table2array(TA13(:,{'tStat'}));
pValue3=table2array(TA13(:,{'pValue'}));
Total3=table(Names3,Estimate3,SE3,tStat3,pValue3);
Name3='Criterion_AIC_WithWantedVariablesSubj'+string(k)+'SWGLM_Report.csv';
writetable(Total3,Name3)
mdl4=stepwiseglm(C,"linear","Distribution","inverse gaussian",'CategoricalVars',[1 1 1 1 1],'Criterion',"bic",'PEnter',0,'Lower','linear');
TA14=mdl4.Coefficients;
TA24=mdl4.Coefficients.Properties.RowNames;
Names4=TA24(:,1);
Estimate4=table2array(TA14(:,{'Estimate'}));
SE4=table2array(TA14(:,{'SE'}));
tStat4=table2array(TA14(:,{'tStat'}));
pValue4=table2array(TA14(:,{'pValue'}));
Total4=table(Names4,Estimate4,SE4,tStat4,pValue4);
Name4='Criterion_BIC_WithWantedVariablesSubj'+string(k)+'SWGLM_Report.csv';
writetable(Total4,Name4)
end