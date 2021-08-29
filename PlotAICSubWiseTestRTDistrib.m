function PlotAICSubWiseTestRTDistrib(file,NNN)
    tbl=readtable(file);
    tbl.LT=categorical(tbl.LT);
    tbl.JP=categorical(tbl.JP);
    tbl.RC=categorical(tbl.RC);
    tbl.subj_idx=categorical(tbl.subj_idx);
    modelspec1 = 'RT ~LT';
    mdl1 = fitglm(tbl,modelspec1,'Distribution','Normal','link','identity' );
    aic1=mdl1.ModelCriterion.AIC;
    bic1=mdl1.ModelCriterion.BIC;
    modelspec2 = 'RT ~ JP';
    mdl2 = fitglm(tbl,modelspec2,'Distribution','Normal','link','identity');
    aic2=mdl2.ModelCriterion.AIC;
    bic2=mdl2.ModelCriterion.BIC;
    AICV=[aic1 aic2];
    BICV=[bic1 bic2];
    Names=categorical({modelspec1, modelspec2});
    NM=[1 2];
   
    Selected=NM(AICV==min(AICV));
    disp(Selected)
    Order=NM';
    AICVT=AICV';
    BICVT=BICV';
    Formulation={modelspec1, modelspec2};
    Formulation=Formulation';
    mlist={mdl1,mdl2};
    %disp(mlist{1,1})
    %disp(Order(1,1))
    OFname1='Bias_RT_Subject'+string(NNN)+'Individual_summaryGLMResponse.csv';
    SaveStatsSubjWiseRT(mlist,Order,OFname1)
    Total=table(Order,Formulation,AICVT,BICVT);
    Total.Properties.VariableNames={'Model(Number)','Formulation','AIC values','BIC values'};
    OFname2='Bias_RT_Subject'+string(NNN)+'Individual_Model_Formula_AIC_BIC_Response.csv';
    writetable(Total,OFname2)
    
end