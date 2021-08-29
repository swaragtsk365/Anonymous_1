function LLRT
RT=[];
Res=[];
LRRT=[];
LRRes=[];
PVRT=[];
PVRes=[];
for k=1:15
    RT=[RT;k];
    Res=[Res;k];
    Dl=readtable('RTFiltered_PlaceboSampleData2Categorywith5050trials'+string(k)+'_only.csv');
    DlCat1=categorical(dummyvar(categorical(Dl.Cat1)));
    DlCat2=categorical(dummyvar(categorical(Dl.Cat2)));
    DlLT=categorical(dummyvar(categorical(Dl.LT)));
    DlJP=categorical(dummyvar(categorical(Dl.JP)));
    DlAD=categorical(Dl.AD);
    D2=readtable('RTFiltered_PlaceboSampleData2Categorywithout5050trials'+string(k)+'_only.csv');
    D2Cat1=categorical(dummyvar(categorical(D2.Cat1)));
    D2Cat2=categorical(dummyvar(categorical(D2.Cat2)));
    D2LT=categorical(dummyvar(categorical(D2.LT)));
    D2JP=categorical(dummyvar(categorical(D2.JP)));
    D2AD=categorical(D2.AD);
    tbl1_1=table(DlCat1(:,1),DlCat2(:,1),DlAD(:,1),Dl.RT);
    tbl1_2=table(DlCat1(:,1),DlCat2(:,1),DlAD(:,1),DlLT(:,1), DlJP(:,1),Dl.RT);
    tbl2_1=table(D2Cat1(:,1),D2Cat2(:,1),D2AD(:,1),categorical(D2.response));
    tbl2_2=table(D2Cat1(:,1),D2Cat2(:,1),D2AD(:,1),D2LT(:,1), D2JP(:,1),categorical(D2.response));
    
    mdl1_1 = fitglm(tbl1_1,'Distribution','inverse gaussian','link',"identity",'Intercept',false);
    mdl1_2=fitglm(tbl1_2,'Distribution','inverse gaussian','link',"identity",'Intercept',false);
    mdl2_1=fitglm(tbl2_1,'Distribution',"Binomial",'link','logit','Intercept',false);
    mdl2_2=fitglm(tbl2_2,'Distribution',"Binomial",'link','logit','Intercept',false);
    LL1=mdl1_2.ModelCriterion.AIC
    LL2=mdl1_2.LogLikelihood
    LR1 = 2*(mdl1_2.LogLikelihood - mdl1_1.LogLikelihood)
    LR2= 2*(mdl2_2.LogLikelihood - mdl2_1.LogLikelihood);
    PV1= 1 - chi2cdf(LR1, 2);
    PV2= 1 - chi2cdf(LR2, 2);
    LRRT=[LRRT;LR1];
    LRRes=[LRRes;LR2];
    PVRT=[PVRT;PV1];
    PVRes=[PVRes;PV2];
end
Total=table(RT,LRRT,LRRes,PVRT,PVRes);
Total.Properties.VariableNames={'subj_idx','LR(RT_Model)','LR(Resp_Model','PVRT','PVRes'};
writetable(Total,'Likelihood_Ratio_Test.csv')