function Final_Response_Selection
Y=FinalModelResponse;
tbl=readtable('RTFilteredPlaceboSampleData2Categorywithout5050trials.csv');
tbl.Cat1=categorical(tbl.Cat1);
tbl.Cat2=categorical(tbl.Cat2);
tbl.LT=categorical(tbl.LT);
tbl.JP=categorical(tbl.JP);
tbl.AD=categorical(tbl.AD);
tbl.MC=categorical(tbl.MC);
[N,~]=size(Y);
MODEL=[];
AIC=[];
BIC=[];
MList={};
for k=1:N
    MODEL=[MODEL;k];
    MSpec=string(Y{k,1})
    mdl = fitglme(tbl,MSpec,'Distribution','Binomial','link','logit',"FitMethod",'Laplace');
    aic=mdl.ModelCriterion.AIC;
    bic=mdl.ModelCriterion.BIC;
    MList{end+1,1}=mdl;
    AIC=[AIC;aic];
    BIC=[BIC;bic];
end
% Now we are interested in selecting the first 50 models based on AIC score
[VAL,I]=sort(AIC);

%I=I(1:50,:);
[NUM2,~]=size(I);
AICL=AIC(I);
BICL=BIC(I);
MODELS=MODEL(I);
mdlList={};
Formulation={};
for kk=1:NUM2
    Formulation{kk,1}=string(Y{I(kk,1),1});
    mdlList{kk}=MList{I(kk,1),1};
end

Total=table(MODELS,Formulation,AICL,BICL);
OFname='Final_Models_Response_Summary.csv';
writetable(Total,OFname)
Outputfile='Final_Model_Response.csv';
SaveStats(mdlList,MODELS,Outputfile)

end