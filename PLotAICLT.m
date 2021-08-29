function PLotAICLT(file)
    tbl=readtable(file);
    tbl.Cat1=categorical(tbl.Cat1);
    tbl.Cat2=categorical(tbl.Cat2);
    tbl.RC=categorical(tbl.RC);
    tbl.subj_idx=categorical(tbl.subj_idx);
    LTA=[];
    Lt=table2array(tbl(:,{'LT'}));
    [Nn,~]=size(Lt);
    for k=1:Nn
        Lta=Lt(k,1);
        LTA=[LTA;Lta{1}];
    end
    LT=LTA=='L';
    tbl.LT=LT;
    modelspec1 = 'LT ~ Cat1+Cat2+ AD +Cat1:Cat2+Cat1:AD+Cat2:AD+Cat1:Cat2:AD+ (1|subj_idx)';
    mdl1 = fitglme(tbl,modelspec1,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic1=mdl1.ModelCriterion.AIC;
    bic1=mdl1.ModelCriterion.BIC;
    modelspec2 = 'LT ~ Cat1+Cat2+ AD +Cat1:Cat2+Cat1:AD+Cat2:AD+ (1|subj_idx)';
    mdl2 = fitglme(tbl,modelspec2,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic2=mdl2.ModelCriterion.AIC;
    bic2=mdl2.ModelCriterion.BIC;
    modelspec3 = 'LT ~ Cat1+Cat2+ AD +Cat1:Cat2+Cat1:AD+ (1|subj_idx)';
    mdl3 = fitglme(tbl,modelspec3,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic3=mdl3.ModelCriterion.AIC;
    bic3=mdl3.ModelCriterion.BIC;
    modelspec4 = 'LT ~ Cat1+Cat2+ AD +Cat1:Cat2+Cat2:AD+ (1|subj_idx)';
    mdl4 = fitglme(tbl,modelspec4,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic4=mdl4.ModelCriterion.AIC;
    bic4=mdl4.ModelCriterion.BIC;
    modelspec5 = 'LT ~ Cat1+Cat2+ AD +Cat1:AD+Cat2:AD+Cat1:Cat2:AD+ (1|subj_idx)';
    mdl5 = fitglme(tbl,modelspec5,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic5=mdl5.ModelCriterion.AIC;
    bic5=mdl5.ModelCriterion.BIC;
    modelspec6 = 'LT ~ Cat1+Cat2+ AD +Cat1:Cat2+ (1|subj_idx)';
    mdl6 = fitglme(tbl,modelspec6,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic6=mdl6.ModelCriterion.AIC;
    bic6=mdl6.ModelCriterion.BIC;
    modelspec7 = 'LT ~ Cat1+Cat2+ AD +Cat1:AD+ (1|subj_idx)';
    mdl7 = fitglme(tbl,modelspec7,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic7=mdl7.ModelCriterion.AIC;
    bic7=mdl7.ModelCriterion.BIC;
    modelspec8 = 'LT ~ Cat1+Cat2+ AD +Cat2:AD+ (1|subj_idx)';
    mdl8 = fitglme(tbl,modelspec8,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic8=mdl8.ModelCriterion.AIC;
    bic8=mdl8.ModelCriterion.BIC;
    modelspec9 = 'LT ~ Cat1+Cat2+ AD + (1|subj_idx)';
    mdl9 = fitglme(tbl,modelspec9,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic9=mdl9.ModelCriterion.AIC;
    bic9=mdl9.ModelCriterion.BIC;
    modelspec10 = 'LT ~ Cat1+Cat2+ AD';
    mdl10 = fitglme(tbl,modelspec10,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic10=mdl10.ModelCriterion.AIC;
    bic10=mdl10.ModelCriterion.BIC;
    modelspec11 = 'LT ~ Cat1+Cat2';
    mdl11 = fitglme(tbl,modelspec11,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic11=mdl11.ModelCriterion.AIC;
    bic11=mdl11.ModelCriterion.BIC;
    modelspec12 = 'LT ~ Cat2+ AD ';
    mdl12 = fitglme(tbl,modelspec12,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic12=mdl12.ModelCriterion.AIC;
    bic12=mdl12.ModelCriterion.BIC;
    modelspec13 = 'LT ~ Cat1+AD';
    mdl13 = fitglme(tbl,modelspec13,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic13=mdl13.ModelCriterion.AIC;
    bic13=mdl13.ModelCriterion.BIC;
    modelspec14 = 'LT ~ Cat1+Cat2+  (1|subj_idx)';
    mdl14 = fitglme(tbl,modelspec14,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic14=mdl14.ModelCriterion.AIC;
    bic14=mdl14.ModelCriterion.BIC;
    modelspec15 = 'LT ~  Cat1 + (1|subj_idx)';
    mdl15 = fitglme(tbl,modelspec15,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic15=mdl15.ModelCriterion.AIC;
    bic15=mdl15.ModelCriterion.BIC;
    modelspec16 = 'LT ~ Cat2+ (1|subj_idx)';
    mdl16 = fitglme(tbl,modelspec16,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic16=mdl16.ModelCriterion.AIC;
    bic16=mdl16.ModelCriterion.BIC;
    modelspec17 = 'LT ~ Cat1+ AD + (1|subj_idx)';
    mdl17 = fitglme(tbl,modelspec17,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic17=mdl17.ModelCriterion.AIC;
    bic17=mdl17.ModelCriterion.BIC;
    modelspec18 = 'LT ~ AD + (1|subj_idx)';
    mdl18 = fitglme(tbl,modelspec18,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic18=mdl18.ModelCriterion.AIC;
    bic18=mdl18.ModelCriterion.BIC;
    modelspec19 = 'LT ~ Cat2+ AD + (1|subj_idx)';
    mdl19 = fitglme(tbl,modelspec19,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic19=mdl19.ModelCriterion.AIC;
    bic19=mdl19.ModelCriterion.BIC;
    modelspec20 = 'LT ~ Cat1';
    mdl20 = fitglme(tbl,modelspec20,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic20=mdl20.ModelCriterion.AIC;
    bic20=mdl20.ModelCriterion.BIC;
    modelspec21 = 'LT ~ Cat2';
    mdl21 = fitglme(tbl,modelspec21,'Distribution','binomial','link','logit','FitMethod','Laplace');
    aic21=mdl21.ModelCriterion.AIC;
    bic21=mdl21.ModelCriterion.BIC;
    modelspec22 = 'LT ~ AD ';
    mdl22 = fitglme(tbl,modelspec22,'Distribution','binomial','link','logit','FitMethod','Laplace');
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
    title('AIC Scores for Different Models for binary response(logistic models)')
    ylabel('AIC value')
    view([90 -90])
    set(gca,'FontSize',5)
    Selected=NM(AICV==min(AICV));
    disp(Selected)
    Order=NM';
    AICVT=AICV';
    BICVT=BICV';
    Formulation={modelspec1, modelspec2, modelspec3, modelspec4, modelspec5, modelspec6, modelspec7, modelspec8, modelspec9, modelspec10, modelspec11, modelspec12, modelspec13, modelspec14, modelspec15, modelspec16, modelspec17, modelspec18, modelspec19, modelspec20, modelspec21, modelspec22};
    Formulation=Formulation';
    mlist={mdl1,mdl2,mdl3,mdl4,mdl5,mdl6,mdl7,mdl8,mdl9,mdl10,mdl11,mdl12,mdl13,mdl14,mdl15,mdl16,mdl17,mdl18,mdl19,mdl20,mdl21,mdl22};
    %disp(mlist{1,1})
    %disp(Order(1,1))
    SaveStats(mlist,Order,'summaryGLMLT_5050excl.csv')
    Total=table(Order,Formulation,AICVT,BICVT);
    Total.Properties.VariableNames={'Model(Number)','Formulation','AIC values','BIC values'};
    writetable(Total,'Model_Formula_AIC_BIC_LT_5050excl.csv')
    
end