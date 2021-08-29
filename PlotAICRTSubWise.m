function PlotAICRTSubWise(file,NNN)
    tbl=readtable(file);
    tbl.Cat1=categorical(tbl.Cat1);
    tbl.Cat2=categorical(tbl.Cat2);
    tbl.RC=categorical(tbl.RC);
    tbl.subj_idx=categorical(tbl.subj_idx);
    modelspec1 = 'RT ~ Cat1+Cat2+ AD +Cat1:Cat2+Cat1:AD+Cat2:AD+Cat1:Cat2:AD+ (1|subj_idx)';
    mdl1 = fitglm(tbl,modelspec1,'Distribution','Normal','link','identity');
    aic1=mdl1.ModelCriterion.AIC;
    bic1=mdl1.ModelCriterion.BIC;
    modelspec2 = 'RT ~ Cat1+Cat2+ AD +Cat1:Cat2+Cat1:AD+Cat2:AD+ (1|subj_idx)';
    mdl2 = fitglm(tbl,modelspec2,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic2=mdl2.ModelCriterion.AIC;
    bic2=mdl2.ModelCriterion.BIC;
    modelspec3 = 'RT ~ Cat1+Cat2+ AD +Cat1:Cat2+Cat1:AD+ (1|subj_idx)';
    mdl3 = fitglm(tbl,modelspec3,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic3=mdl3.ModelCriterion.AIC;
    bic3=mdl3.ModelCriterion.BIC;
    modelspec4 = 'RT ~ Cat1+Cat2+ AD +Cat1:Cat2+Cat2:AD+ (1|subj_idx)';
    mdl4 = fitglm(tbl,modelspec4,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic4=mdl4.ModelCriterion.AIC;
    bic4=mdl4.ModelCriterion.BIC;
    modelspec5 = 'RT ~ Cat1+Cat2+ AD +Cat1:AD+Cat2:AD+Cat1:Cat2:AD+ (1|subj_idx)';
    mdl5 = fitglm(tbl,modelspec5,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic5=mdl5.ModelCriterion.AIC;
    bic5=mdl5.ModelCriterion.BIC;
    modelspec6 = 'RT ~ Cat1+Cat2+ AD +Cat1:Cat2+ (1|subj_idx)';
    mdl6 = fitglm(tbl,modelspec6,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic6=mdl6.ModelCriterion.AIC;
    bic6=mdl6.ModelCriterion.BIC;
    modelspec7 = 'RT ~ Cat1+Cat2+ AD +Cat1:AD+ (1|subj_idx)';
    mdl7 = fitglm(tbl,modelspec7,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic7=mdl7.ModelCriterion.AIC;
    bic7=mdl7.ModelCriterion.BIC;
    modelspec8 = 'RT ~ Cat1+Cat2+ AD +Cat2:AD+ (1|subj_idx)';
    mdl8 = fitglm(tbl,modelspec8,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic8=mdl8.ModelCriterion.AIC;
    bic8=mdl8.ModelCriterion.BIC;
    modelspec9 = 'RT ~ Cat1+Cat2+ AD + (1|subj_idx)';
    mdl9 = fitglm(tbl,modelspec9,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic9=mdl9.ModelCriterion.AIC;
    bic9=mdl9.ModelCriterion.BIC;
    modelspec10 = 'RT ~ Cat1+Cat2+ AD';
    mdl10 = fitglm(tbl,modelspec10,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic10=mdl10.ModelCriterion.AIC;
    bic10=mdl10.ModelCriterion.BIC;
    modelspec11 = 'RT ~ Cat1+Cat2';
    mdl11 = fitglm(tbl,modelspec11,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic11=mdl11.ModelCriterion.AIC;
    bic11=mdl11.ModelCriterion.BIC;
    modelspec12 = 'RT ~ Cat2+ AD ';
    mdl12 = fitglm(tbl,modelspec12,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic12=mdl12.ModelCriterion.AIC;
    bic12=mdl12.ModelCriterion.BIC;
    modelspec13 = 'RT ~ Cat1+AD';
    mdl13 = fitglm(tbl,modelspec13,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic13=mdl13.ModelCriterion.AIC;
    bic13=mdl13.ModelCriterion.BIC;
    modelspec14 = 'RT ~ Cat1+Cat2+  (1|subj_idx)';
    mdl14 = fitglm(tbl,modelspec14,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic14=mdl14.ModelCriterion.AIC;
    bic14=mdl14.ModelCriterion.BIC;
    modelspec15 = 'RT ~  Cat1 + (1|subj_idx)';
    mdl15 = fitglm(tbl,modelspec15,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic15=mdl15.ModelCriterion.AIC;
    bic15=mdl15.ModelCriterion.BIC;
    modelspec16 = 'RT ~ Cat2+ (1|subj_idx)';
    mdl16 = fitglm(tbl,modelspec16,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic16=mdl16.ModelCriterion.AIC;
    bic16=mdl16.ModelCriterion.BIC;
    modelspec17 = 'RT ~ Cat1+ AD + (1|subj_idx)';
    mdl17 = fitglm(tbl,modelspec17,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic17=mdl17.ModelCriterion.AIC;
    bic17=mdl17.ModelCriterion.BIC;
    modelspec18 = 'RT ~ AD + (1|subj_idx)';
    mdl18 = fitglm(tbl,modelspec18,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic18=mdl18.ModelCriterion.AIC;
    bic18=mdl18.ModelCriterion.BIC;
    modelspec19 = 'RT ~ Cat2+ AD + (1|subj_idx)';
    mdl19 = fitglm(tbl,modelspec19,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic19=mdl19.ModelCriterion.AIC;
    bic19=mdl19.ModelCriterion.BIC;
    modelspec20 = 'RT ~ Cat1';
    mdl20 = fitglm(tbl,modelspec20,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic20=mdl20.ModelCriterion.AIC;
    bic20=mdl20.ModelCriterion.BIC;
    modelspec21 = 'RT ~ Cat2';
    mdl21 = fitglm(tbl,modelspec21,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic21=mdl21.ModelCriterion.AIC;
    bic21=mdl21.ModelCriterion.BIC;
    modelspec22 = 'RT ~ AD ';
    mdl22 = fitglm(tbl,modelspec22,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic22=mdl22.ModelCriterion.AIC;
    bic22=mdl22.ModelCriterion.BIC;
    %modelspec23 = 'response ~ (1|Session)';
    %mdl23 = fitglme(tbl,modelspec23,'Distribution','binomial','link','logit','FitMethod','Laplace');
    %value23=mdl23.ModelCriterion.AIC;
    AICV=[aic1 aic2 aic3 aic4 aic5 aic6 aic7 aic8 aic9 aic10 aic11 aic12 aic13 aic14 aic15 aic16 aic17 aic18 aic19 aic20 aic21 aic22 ];
    BICV=[bic1 bic2 bic3 bic4 bic5 bic6 bic7 bic8 bic9 bic10 bic11 bic12 bic13 bic14 bic15 bic16 bic17 bic18 bic19 bic20 bic21 bic22 ];
    Names=categorical({modelspec1, modelspec2, modelspec3, modelspec4, modelspec5, modelspec6, modelspec7, modelspec8, modelspec9, modelspec10, modelspec11, modelspec12, modelspec13, modelspec14, modelspec15, modelspec16, modelspec17, modelspec18, modelspec19, modelspec20, modelspec21, modelspec22});
    NM=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22];
    bar(Names, AICV)
    title('AIC Scores for Different Models for RT(linear models)')
    ylabel('AIC value')
    view([90 -90])
    set(gca,'FontSize',5)
    Selected=NM(AICV==min(AICV));
    %disp(size(mdl1.Coefficients.Name))
    Order=NM';
    AICVT=AICV';
    BICVT=BICV';
    Formulation={modelspec1, modelspec2, modelspec3, modelspec4, modelspec5, modelspec6, modelspec7, modelspec8, modelspec9, modelspec10, modelspec11, modelspec12, modelspec13, modelspec14, modelspec15, modelspec16, modelspec17, modelspec18, modelspec19, modelspec20, modelspec21, modelspec22};
    Formulation=Formulation';
    mlist={mdl1,mdl2,mdl3,mdl4,mdl5,mdl6,mdl7,mdl8,mdl9,mdl10,mdl11,mdl12,mdl13,mdl14,mdl15,mdl16,mdl17,mdl18,mdl19,mdl20,mdl21,mdl22};
    %disp(mlist{1,1})
    %disp(Order(1,1))
    OFname1='Subject'+string(NNN)+'Individual_summaryGLMRT.csv';
    SaveStats(mlist,Order,OFname1)
    Total=table(Order,Formulation,AICVT,BICVT);
    Total.Properties.VariableNames={'Model(Number)','Formulation','AIC values','BIC values'};
    OFname2='Subject'+string(NNN)+'Individual_Model_Formula_AIC_BIC_RT.csv';
    writetable(Total,OFname2)
    
    
end