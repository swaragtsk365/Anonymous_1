function PlotAICSubWiseSpecific(file)
    tbl=readtable(file);
    tbl.LT=categorical(tbl.LT);
    tbl.JP=categorical(tbl.JP);
    tbl.RC=categorical(tbl.RC);
    tbl.subj_idx=categorical(tbl.subj_idx);
    modelspec1 = 'response ~LT+JP';
    mdl1 = fitglm(tbl,modelspec1,'Distribution','binomial','link','logit' );
    aic1=mdl1.ModelCriterion.AIC;
    bic1=mdl1.ModelCriterion.BIC;
    modelspec2 = 'response ~ LT+JP+LT:JP';
    mdl2 = fitglm(tbl,modelspec2,'Distribution','binomial','link','logit');
    aic2=mdl2.ModelCriterion.AIC;
    bic2=mdl2.ModelCriterion.BIC;
    modelspec3 = 'response ~ LT:JP';
    mdl3 = fitglm(tbl,modelspec3,'Distribution','binomial','link','logit');
    aic3=mdl3.ModelCriterion.AIC;
    bic3=mdl3.ModelCriterion.BIC;
    
    modelspec4 = 'response ~ LT+LT:JP';
    mdl4 = fitglm(tbl,modelspec4,'Distribution','binomial','link','logit');
    aic4=mdl4.ModelCriterion.AIC;
    bic4=mdl4.ModelCriterion.BIC;
    modelspec5 = 'response ~ JP+LT:JP';
    mdl5 = fitglm(tbl,modelspec5,'Distribution','binomial','link','logit');
    aic5=mdl5.ModelCriterion.AIC;
    bic5=mdl5.ModelCriterion.BIC;
    AICV=[aic1 aic2 aic3 aic4 aic5 ];
    BICV=[bic1 bic2 bic3 bic4 bic5 ];
    Names=categorical({modelspec1, modelspec2, modelspec3, modelspec4, modelspec5});
    NM=[1 2 3 4 5];
   
    Selected=NM(AICV==min(AICV));
    disp(Selected)
    Order=NM';
    AICVT=AICV';
    BICVT=BICV';
    Formulation={modelspec1, modelspec2, modelspec3,modelspec4,modelspec5};
    Formulation=Formulation';
    mlist={mdl1,mdl2,mdl3, mdl4, mdl5};
    %disp(mlist{1,1})
    %disp(Order(1,1))
    OFname1='SpecificSubject5Individual_summaryGLMResponse.csv';
    SaveStatsSubjWise(mlist,Order,OFname1)
    Total=table(Order,Formulation,AICVT,BICVT);
    Total.Properties.VariableNames={'Model(Number)','Formulation','AIC values','BIC values'};
    OFname2='SpecificSubject5Individual_Model_Formula_AIC_BIC_Response.csv';
    writetable(Total,OFname2)
    
end