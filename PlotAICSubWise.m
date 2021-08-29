function PlotAICSubWise(file,NNN)
    tbl=readtable(file);
    tbl.Cat1=categorical(tbl.Cat1);
    tbl.Cat2=categorical(tbl.Cat2);
    tbl.RC=categorical(tbl.RC);
    tbl.subj_idx=categorical(tbl.subj_idx);
    modelspec1 = 'response ~ Cat1+Cat2+ AD +Cat1:Cat2+Cat1:AD+Cat2:AD+Cat1:Cat2:AD';
    mdl1 = fitglm(tbl,modelspec1,'Distribution','binomial','link','logit' );
    aic1=mdl1.ModelCriterion.AIC;
    bic1=mdl1.ModelCriterion.BIC;
    modelspec2 = 'response ~ Cat1+Cat2+ AD +Cat1:Cat2+Cat1:AD+Cat2:AD';
    mdl2 = fitglm(tbl,modelspec2,'Distribution','binomial','link','logit');
    aic2=mdl2.ModelCriterion.AIC;
    bic2=mdl2.ModelCriterion.BIC;
    modelspec3 = 'response ~ Cat1+Cat2+ AD +Cat1:Cat2+Cat1:AD';
    mdl3 = fitglm(tbl,modelspec3,'Distribution','binomial','link','logit');
    aic3=mdl3.ModelCriterion.AIC;
    bic3=mdl3.ModelCriterion.BIC;
    modelspec4 = 'response ~ Cat1+Cat2+ AD +Cat1:Cat2+Cat2:AD';
    mdl4 = fitglm(tbl,modelspec4,'Distribution','binomial','link','logit');
    aic4=mdl4.ModelCriterion.AIC;
    bic4=mdl4.ModelCriterion.BIC;
    modelspec5 = 'response ~ Cat1+Cat2+ AD +Cat1:AD+Cat2:AD+Cat1:Cat2:AD';
    mdl5 = fitglm(tbl,modelspec5,'Distribution','binomial','link','logit');
    aic5=mdl5.ModelCriterion.AIC;
    bic5=mdl5.ModelCriterion.BIC;
    modelspec6 = 'response ~ Cat1+Cat2+ AD +Cat1:Cat2';
    mdl6 = fitglm(tbl,modelspec6,'Distribution','binomial','link','logit');
    aic6=mdl6.ModelCriterion.AIC;
    bic6=mdl6.ModelCriterion.BIC;
    modelspec7 = 'response ~ Cat1+Cat2+ AD +Cat1:AD';
    mdl7 = fitglm(tbl,modelspec7,'Distribution','binomial','link','logit');
    aic7=mdl7.ModelCriterion.AIC;
    bic7=mdl7.ModelCriterion.BIC;
    modelspec8 = 'response ~ Cat1+Cat2+ AD +Cat2:AD';
    mdl8 = fitglm(tbl,modelspec8,'Distribution','binomial','link','logit');
    aic8=mdl8.ModelCriterion.AIC;
    bic8=mdl8.ModelCriterion.BIC;
    modelspec9 = 'response ~ Cat1+Cat2+ AD';
    mdl9 = fitglm(tbl,modelspec9,'Distribution','binomial','link','logit');
    aic9=mdl9.ModelCriterion.AIC;
    bic9=mdl9.ModelCriterion.BIC;
    modelspec10 = 'response ~ Cat1+Cat2+ AD';
    mdl10 = fitglm(tbl,modelspec10,'Distribution','binomial','link','logit');
    aic10=mdl10.ModelCriterion.AIC;
    bic10=mdl10.ModelCriterion.BIC;
    modelspec11 = 'response ~ Cat1+Cat2';
    mdl11 = fitglm(tbl,modelspec11,'Distribution','binomial','link','logit');
    aic11=mdl11.ModelCriterion.AIC;
    bic11=mdl11.ModelCriterion.BIC;
    modelspec12 = 'response ~ Cat2+ AD ';
    mdl12 = fitglm(tbl,modelspec12,'Distribution','binomial','link','logit');
    aic12=mdl12.ModelCriterion.AIC;
    bic12=mdl12.ModelCriterion.BIC;
    modelspec13 = 'response ~ Cat1+AD';
    mdl13 = fitglm(tbl,modelspec13,'Distribution','binomial','link','logit');
    aic13=mdl13.ModelCriterion.AIC;
    bic13=mdl13.ModelCriterion.BIC;

    modelspec14 = 'response ~ Cat1';
    mdl14 = fitglm(tbl,modelspec14,'Distribution','binomial','link','logit');
    aic14=mdl14.ModelCriterion.AIC;
    bic14=mdl14.ModelCriterion.BIC;
    modelspec15 = 'response ~ Cat2';
    mdl15 = fitglm(tbl,modelspec15,'Distribution','binomial','link','logit');
    aic15=mdl15.ModelCriterion.AIC;
    bic15=mdl15.ModelCriterion.BIC;
    modelspec16 = 'response ~ AD ';
    mdl16 = fitglm(tbl,modelspec16,'Distribution','binomial','link','logit');
    aic16=mdl16.ModelCriterion.AIC;
    bic16=mdl16.ModelCriterion.BIC;
    %modelspec23 = 'response ~ (1|Session)';
    %mdl23 = fitglme(tbl,modelspec23,'Distribution','binomial','link','logit','FitMethod','Laplace');
    %value23=mdl23.ModelCriterion.AIC;
    AICV=[aic1 aic2 aic3 aic4 aic5 aic6 aic7 aic8 aic9 aic10 aic11 aic12 aic13 aic14 aic15 aic16];
    BICV=[bic1 bic2 bic3 bic4 bic5 bic6 bic7 bic8 bic9 bic10 bic11 bic12 bic13 bic14 bic15 bic16];
    Names=categorical({modelspec1, modelspec2, modelspec3, modelspec4, modelspec5, modelspec6, modelspec7, modelspec8, modelspec9, modelspec10, modelspec11, modelspec12, modelspec13, modelspec14, modelspec15, modelspec16});
    NM=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16];
    title('AIC Scores for Different Models for binary response(logistic models)')
    ylabel('AIC value')
    view([90 -90])
    set(gca,'FontSize',5)
    Selected=NM(AICV==min(AICV));
    disp(Selected)
    Order=NM';
    AICVT=AICV';
    BICVT=BICV';
    Formulation={modelspec1, modelspec2, modelspec3, modelspec4, modelspec5, modelspec6, modelspec7, modelspec8, modelspec9, modelspec10, modelspec11, modelspec12, modelspec13, modelspec14, modelspec15, modelspec16};
    Formulation=Formulation';
    mlist={mdl1,mdl2,mdl3,mdl4,mdl5,mdl6,mdl7,mdl8,mdl9,mdl10,mdl11,mdl12,mdl13,mdl14,mdl15,mdl16};
    %disp(mlist{1,1})
    %disp(Order(1,1))
    OFname1='Subject'+string(NNN)+'Individual_summaryGLMResponse.csv';
    SaveStatsSubjWise(mlist,Order,OFname1)
    Total=table(Order,Formulation,AICVT,BICVT);
    Total.Properties.VariableNames={'Model(Number)','Formulation','AIC values','BIC values'};
    OFname2='Subject'+string(NNN)+'Individual_Model_Formula_AIC_BIC_Response.csv';
    writetable(Total,OFname2)
    
end