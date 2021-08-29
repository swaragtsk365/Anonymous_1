function PlotAICRT_LTincl(file)
    tbl=readtable(file);
    tbl.Cat1=categorical(tbl.Cat1);
    tbl.Cat2=categorical(tbl.Cat2);
    tbl.RC=categorical(tbl.RC);
    tbl.subj_idx=categorical(tbl.subj_idx);
    tbl.LT=categorical(tbl.LT);
    modelspec1 = 'RT ~ Cat1+Cat2+ AD +Cat1:Cat2+Cat1:AD+Cat2:AD+Cat1:Cat2:AD+ (1|subj_idx)';
    mdl1 = fitglme(tbl,modelspec1,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic1=mdl1.ModelCriterion.AIC;
    bic1=mdl1.ModelCriterion.BIC;
    modelspec2 = 'RT ~ Cat1+Cat2+ AD +Cat1:Cat2+Cat1:AD+Cat2:AD+ (1|subj_idx)';
    mdl2 = fitglme(tbl,modelspec2,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic2=mdl2.ModelCriterion.AIC;
    bic2=mdl2.ModelCriterion.BIC;
    modelspec3 = 'RT ~ Cat1+Cat2+ AD +Cat1:Cat2+Cat1:AD+ (1|subj_idx)';
    mdl3 = fitglme(tbl,modelspec3,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic3=mdl3.ModelCriterion.AIC;
    bic3=mdl3.ModelCriterion.BIC;
    modelspec4 = 'RT ~ Cat1+Cat2+ AD +Cat1:Cat2+Cat2:AD+ (1|subj_idx)';
    mdl4 = fitglme(tbl,modelspec4,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic4=mdl4.ModelCriterion.AIC;
    bic4=mdl4.ModelCriterion.BIC;
    modelspec5 = 'RT ~ Cat1+Cat2+ AD +Cat1:AD+Cat2:AD+Cat1:Cat2:AD+ (1|subj_idx)';
    mdl5 = fitglme(tbl,modelspec5,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic5=mdl5.ModelCriterion.AIC;
    bic5=mdl5.ModelCriterion.BIC;
    modelspec6 = 'RT ~ Cat1+Cat2+ AD +Cat1:Cat2+ (1|subj_idx)';
    mdl6 = fitglme(tbl,modelspec6,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic6=mdl6.ModelCriterion.AIC;
    bic6=mdl6.ModelCriterion.BIC;
    modelspec7 = 'RT ~ Cat1+Cat2+ AD +Cat1:AD+ (1|subj_idx)';
    mdl7 = fitglme(tbl,modelspec7,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic7=mdl7.ModelCriterion.AIC;
    bic7=mdl7.ModelCriterion.BIC;
    modelspec8 = 'RT ~ Cat1+Cat2+ AD +Cat2:AD+ (1|subj_idx)';
    mdl8 = fitglme(tbl,modelspec8,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic8=mdl8.ModelCriterion.AIC;
    bic8=mdl8.ModelCriterion.BIC;
    modelspec9 = 'RT ~ Cat1+Cat2+ AD + (1|subj_idx)';
    mdl9 = fitglme(tbl,modelspec9,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic9=mdl9.ModelCriterion.AIC;
    bic9=mdl9.ModelCriterion.BIC;
    modelspec10 = 'RT ~ Cat1+Cat2+ AD';
    mdl10 = fitglme(tbl,modelspec10,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic10=mdl10.ModelCriterion.AIC;
    bic10=mdl10.ModelCriterion.BIC;
    modelspec11 = 'RT ~ Cat1+Cat2';
    mdl11 = fitglme(tbl,modelspec11,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic11=mdl11.ModelCriterion.AIC;
    bic11=mdl11.ModelCriterion.BIC;
    modelspec12 = 'RT ~ Cat2+ AD ';
    mdl12 = fitglme(tbl,modelspec12,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic12=mdl12.ModelCriterion.AIC;
    bic12=mdl12.ModelCriterion.BIC;
    modelspec13 = 'RT ~ Cat1+AD';
    mdl13 = fitglme(tbl,modelspec13,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic13=mdl13.ModelCriterion.AIC;
    bic13=mdl13.ModelCriterion.BIC;
    modelspec14 = 'RT ~ Cat1+Cat2+  (1|subj_idx)';
    mdl14 = fitglme(tbl,modelspec14,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic14=mdl14.ModelCriterion.AIC;
    bic14=mdl14.ModelCriterion.BIC;
    modelspec15 = 'RT ~  Cat1 + (1|subj_idx)';
    mdl15 = fitglme(tbl,modelspec15,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic15=mdl15.ModelCriterion.AIC;
    bic15=mdl15.ModelCriterion.BIC;
    modelspec16 = 'RT ~ Cat2+ (1|subj_idx)';
    mdl16 = fitglme(tbl,modelspec16,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic16=mdl16.ModelCriterion.AIC;
    bic16=mdl16.ModelCriterion.BIC;
    modelspec17 = 'RT ~ Cat1+ AD + (1|subj_idx)';
    mdl17 = fitglme(tbl,modelspec17,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic17=mdl17.ModelCriterion.AIC;
    bic17=mdl17.ModelCriterion.BIC;
    modelspec18 = 'RT ~ AD + (1|subj_idx)';
    mdl18 = fitglme(tbl,modelspec18,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic18=mdl18.ModelCriterion.AIC;
    bic18=mdl18.ModelCriterion.BIC;
    modelspec19 = 'RT ~ Cat2+ AD + (1|subj_idx)';
    mdl19 = fitglme(tbl,modelspec19,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic19=mdl19.ModelCriterion.AIC;
    bic19=mdl19.ModelCriterion.BIC;
    modelspec20 = 'RT ~ Cat1';
    mdl20 = fitglme(tbl,modelspec20,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic20=mdl20.ModelCriterion.AIC;
    bic20=mdl20.ModelCriterion.BIC;
    modelspec21 = 'RT ~ Cat2';
    mdl21 = fitglme(tbl,modelspec21,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic21=mdl21.ModelCriterion.AIC;
    bic21=mdl21.ModelCriterion.BIC;
    modelspec22 = 'RT ~ AD ';
    mdl22 = fitglme(tbl,modelspec22,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic22=mdl22.ModelCriterion.AIC;
    bic22=mdl22.ModelCriterion.BIC;
    modelspec23 = 'RT ~ Cat1+Cat2+ AD+ LT +Cat1:LT+Cat2:LT+AD:LT+Cat1:Cat2+Cat1:AD+Cat2:AD+Cat1:Cat2:AD+Cat1:Cat2:LT+Cat1:AD:LT+Cat2:AD:LT+Cat1:Cat2:AD:LT+ (1|subj_idx)';
    mdl23 = fitglme(tbl,modelspec23,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic23=mdl23.ModelCriterion.AIC;
    bic23=mdl23.ModelCriterion.BIC;
    modelspec24 = 'RT ~ Cat1+Cat2+ AD+ LT +Cat1:LT+Cat2:LT+AD:LT+Cat1:Cat2+Cat1:AD+Cat2:AD+Cat1:Cat2:AD+Cat1:Cat2:LT+Cat1:AD:LT+Cat2:AD:LT+ (1|subj_idx)';
    mdl24 = fitglme(tbl,modelspec24,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic24=mdl24.ModelCriterion.AIC;
    bic24=mdl24.ModelCriterion.BIC;
    modelspec25 = 'RT ~ Cat1+Cat2+ AD+ LT +Cat1:LT+Cat2:LT+AD:LT+Cat1:Cat2+Cat1:AD+Cat2:AD+Cat1:Cat2:LT+Cat1:AD:LT+Cat2:AD:LT+ (1|subj_idx)';
    mdl25 = fitglme(tbl,modelspec25,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic25=mdl25.ModelCriterion.AIC;
    bic25=mdl25.ModelCriterion.BIC;
    modelspec26 = 'RT ~ Cat1+Cat2+ AD+ LT +Cat1:LT+Cat2:LT+AD:LT+Cat1:Cat2+Cat1:AD+Cat2:AD+Cat1:Cat2:AD+Cat1:Cat2:LT+Cat1:AD:LT+ (1|subj_idx)';
    mdl26 = fitglme(tbl,modelspec26,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic26=mdl26.ModelCriterion.AIC;
    bic26=mdl26.ModelCriterion.BIC;
    modelspec27 = 'RT ~ Cat1+Cat2+ AD+ LT +Cat1:LT+Cat2:LT+AD:LT+Cat1:Cat2+Cat1:AD+Cat2:AD+Cat1:Cat2:AD+Cat1:Cat2:LT+Cat2:AD:LT+ (1|subj_idx)';
    mdl27 = fitglme(tbl,modelspec27,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic27=mdl27.ModelCriterion.AIC;
    bic27=mdl27.ModelCriterion.BIC;
    modelspec28 = 'RT ~ Cat1+Cat2+ AD+ LT +Cat1:LT+Cat2:LT+AD:LT+Cat1:Cat2+Cat1:AD+Cat2:AD+Cat1:Cat2:AD+Cat1:AD:LT+Cat2:AD:LT+ (1|subj_idx)';
    mdl28 = fitglme(tbl,modelspec28,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic28=mdl28.ModelCriterion.AIC;
    bic28=mdl28.ModelCriterion.BIC;
    modelspec29 = 'RT ~ Cat1+Cat2+ AD+ LT +Cat1:LT+Cat2:LT+AD:LT+Cat1:Cat2+Cat1:AD+Cat2:AD+ (1|subj_idx)';
    mdl29 = fitglme(tbl,modelspec29,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic29=mdl29.ModelCriterion.AIC;
    bic29=mdl29.ModelCriterion.BIC;
    modelspec30 = 'RT ~ Cat1+Cat2+ AD+ LT +Cat1:LT+Cat2:LT+AD:LT+ (1|subj_idx)';
    mdl30 = fitglme(tbl,modelspec30,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic30=mdl30.ModelCriterion.AIC;
    bic30=mdl30.ModelCriterion.BIC;
    modelspec31 = 'RT ~ Cat1+Cat2+ AD+ LT +Cat2:LT+AD:LT+ (1|subj_idx)';
    mdl31 = fitglme(tbl,modelspec31,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic31=mdl31.ModelCriterion.AIC;
    bic31=mdl31.ModelCriterion.BIC;
    modelspec32 = 'RT ~ Cat1+Cat2+ AD+ LT +Cat1:LT+AD:LT+ (1|subj_idx)';
    mdl32 = fitglme(tbl,modelspec32,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic32=mdl32.ModelCriterion.AIC;
    bic32=mdl32.ModelCriterion.BIC;
    modelspec33 = 'RT ~ Cat1+Cat2+ AD+ LT +Cat1:LT+Cat2:LT+ (1|subj_idx)';
    mdl33 = fitglme(tbl,modelspec33,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic33=mdl33.ModelCriterion.AIC;
    bic33=mdl33.ModelCriterion.BIC;
    modelspec34 = 'RT ~ Cat1+Cat2+ AD+ LT +Cat1:LT+ (1|subj_idx)';
    mdl34 = fitglme(tbl,modelspec34,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic34=mdl34.ModelCriterion.AIC;
    bic34=mdl34.ModelCriterion.BIC;
    modelspec35 = 'RT ~ Cat1+Cat2+ AD+ LT +Cat2:LT+ (1|subj_idx)';
    mdl35 = fitglme(tbl,modelspec35,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic35=mdl35.ModelCriterion.AIC;
    bic35=mdl35.ModelCriterion.BIC;
    modelspec36 = 'RT ~ Cat1+Cat2+ AD+ LT +AD:LT+ (1|subj_idx)';
    mdl36 = fitglme(tbl,modelspec36,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic36=mdl36.ModelCriterion.AIC;
    bic36=mdl36.ModelCriterion.BIC;
    modelspec37 = 'RT ~ Cat1+Cat2+ AD+ LT + (1|subj_idx)';
    mdl37 = fitglme(tbl,modelspec37,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic37=mdl37.ModelCriterion.AIC;
    bic37=mdl37.ModelCriterion.BIC;
    modelspec38 = 'RT ~ Cat2+ AD+ LT + (1|subj_idx)';
    mdl38 = fitglme(tbl,modelspec38,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic38=mdl38.ModelCriterion.AIC;
    bic38=mdl38.ModelCriterion.BIC;
    modelspec39 = 'RT ~ Cat1+ AD+ LT + (1|subj_idx)';
    mdl39 = fitglme(tbl,modelspec39,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic39=mdl39.ModelCriterion.AIC;
    bic39=mdl39.ModelCriterion.BIC;
    modelspec40 = 'RT ~ Cat1+Cat2+ LT + (1|subj_idx)';
    mdl40 = fitglme(tbl,modelspec40,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic40=mdl40.ModelCriterion.AIC;
    bic40=mdl40.ModelCriterion.BIC;
    modelspec41 = 'RT ~ Cat1+LT +Cat1:LT+ (1|subj_idx)';
    mdl41 = fitglme(tbl,modelspec41,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic41=mdl41.ModelCriterion.AIC;
    bic41=mdl41.ModelCriterion.BIC;
    modelspec42 = 'RT ~ Cat2+LT +Cat2:LT+ (1|subj_idx)';
    mdl42 = fitglme(tbl,modelspec42,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic42=mdl42.ModelCriterion.AIC;
    bic42=mdl42.ModelCriterion.BIC;
    modelspec43 = 'RT ~ AD+LT +AD:LT +(1|subj_idx)';
    mdl43 = fitglme(tbl,modelspec43,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic43=mdl43.ModelCriterion.AIC;
    bic43=mdl43.ModelCriterion.BIC;
    modelspec44 = 'RT ~ Cat1+LT + (1|subj_idx)';
    mdl44 = fitglme(tbl,modelspec44,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic44=mdl44.ModelCriterion.AIC;
    bic44=mdl44.ModelCriterion.BIC;
    modelspec45 = 'RT ~ Cat2+LT + (1|subj_idx)';
    mdl45 = fitglme(tbl,modelspec45,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic45=mdl45.ModelCriterion.AIC;
    bic45=mdl45.ModelCriterion.BIC;
    modelspec46 = 'RT ~ AD+LT + (1|subj_idx)';
    mdl46 = fitglme(tbl,modelspec46,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic46=mdl46.ModelCriterion.AIC;
    bic46=mdl46.ModelCriterion.BIC;
    modelspec47 = 'RT ~ LT + (1|subj_idx)';
    mdl47 = fitglme(tbl,modelspec47,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic47=mdl47.ModelCriterion.AIC;
    bic47=mdl47.ModelCriterion.BIC;
    modelspec48 = 'RT ~ LT ';
    mdl48 = fitglme(tbl,modelspec48,'Distribution','Normal','link','identity','FitMethod','MPL');
    aic48=mdl48.ModelCriterion.AIC;
    bic48=mdl48.ModelCriterion.BIC;
    %modelspec23 = 'response ~ (1|Session)';
    %mdl23 = fitglme(tbl,modelspec23,'Distribution','binomial','link','logit','FitMethod','Laplace');
    %value23=mdl23.ModelCriterion.AIC;
    AICV=[aic1 aic2 aic3 aic4 aic5 aic6 aic7 aic8 aic9 aic10 aic11 aic12 aic13 aic14 aic15 aic16 aic17 aic18 aic19 aic20 aic21 aic22 aic23 aic24 aic25 aic26 aic27 aic28 aic29 aic30 aic31 aic32 aic33 aic34 aic35 aic36 aic37 aic38 aic39 aic40 aic41 aic42 aic43 aic44 aic45 aic46 aic47 aic48 ];
    BICV=[bic1 bic2 bic3 bic4 bic5 bic6 bic7 bic8 bic9 bic10 bic11 bic12 bic13 bic14 bic15 bic16 bic17 bic18 bic19 bic20 bic21 bic22 bic23 bic24 bic25 bic26 bic27 bic28 bic29 bic30 bic31 bic32 bic33 bic34 bic35 bic36 bic37 bic38 bic39 bic40 bic41 bic42 bic43 bic44 bic45 bic46 bic47 bic48];
    Names=categorical({modelspec1, modelspec2, modelspec3, modelspec4, modelspec5, modelspec6, modelspec7, modelspec8, modelspec9, modelspec10, modelspec11, modelspec12, modelspec13, modelspec14, modelspec15, modelspec16, modelspec17, modelspec18, modelspec19, modelspec20, modelspec21, modelspec22, modelspec23, modelspec24,modelspec25, modelspec26, modelspec27, modelspec28, modelspec29, modelspec30, modelspec31, modelspec32, modelspec33, modelspec34, modelspec35, modelspec36, modelspec37, modelspec38, modelspec39, modelspec40, modelspec41, modelspec42, modelspec43, modelspec44, modelspec45, modelspec46, modelspec47, modelspec48});
    NM=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48];
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
    Formulation={modelspec1, modelspec2, modelspec3, modelspec4, modelspec5, modelspec6, modelspec7, modelspec8, modelspec9, modelspec10, modelspec11, modelspec12, modelspec13, modelspec14, modelspec15, modelspec16, modelspec17, modelspec18, modelspec19, modelspec20, modelspec21, modelspec22, modelspec23, modelspec24,modelspec25, modelspec26, modelspec27, modelspec28, modelspec29, modelspec30, modelspec31, modelspec32, modelspec33, modelspec34, modelspec35, modelspec36, modelspec37, modelspec38, modelspec39, modelspec40, modelspec41, modelspec42, modelspec43, modelspec44, modelspec45, modelspec46, modelspec47, modelspec48};
    Formulation=Formulation';
    mlist={mdl1,mdl2,mdl3,mdl4,mdl5,mdl6,mdl7,mdl8,mdl9,mdl10,mdl11,mdl12,mdl13,mdl14,mdl15,mdl16,mdl17,mdl18,mdl19,mdl20,mdl21,mdl22,mdl23,mdl24,mdl25, mdl26, mdl27, mdl28, mdl29, mdl30, mdl31, mdl32, mdl33, mdl34, mdl35, mdl36, mdl37, mdl38, mdl39, mdl40, mdl41, mdl42, mdl43, mdl44, mdl45, mdl46, mdl47, mdl48 };
    %disp(mlist{1,1})
    %disp(Order(1,1))
    SaveStats(mlist,Order,'summaryGLMRT(LT_incl_N_Sub8Only).csv')
    Total=table(Order,Formulation,AICVT,BICVT);
    Total.Properties.VariableNames={'Model(Number)','Formulation','AIC values','BIC values'};
    writetable(Total,'Model_Formula_AIC_BIC_RT(LT_incl_N_Sub8Only).csv')
    
    
end