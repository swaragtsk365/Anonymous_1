function SubjectIncluder(data,subj1) % Function to remove a particular subject
A=readtable(data);
Session=table2array(A(:,{'subj_idx'}));
RC=table2array(A(:,{'RC'}));
Cat1=table2array(A(:,{'Cat1'}));
Cat2=table2array(A(:,{'Cat2'}));
RT=table2array(A(:,{'RT'}));
MC=table2array(A(:,{'MC'}));
LT=table2array(A(:,{'LT'}));
JP=table2array(A(:,{'JP'}));
AD=table2array(A(:,{'AD'}));
Volume=table2array(A(:,10));
response=table2array(A(:,{'response'}));
Idx=unique(Session);
IDX1=Session==subj1;

subj_idx1=Session(IDX1);
RCR1=RC(IDX1);
Cat1R1=Cat1(IDX1);
Cat2R1=Cat2(IDX1);
RTR1=RT(IDX1);
MCR1=MC(IDX1);
LTR1=LT(IDX1);
JPR1=JP(IDX1);
ADR1=AD(IDX1);
VolumeR1=Volume(IDX1);
responseR1=response(IDX1);


Total=table(subj_idx1,RCR1,Cat1R1,Cat2R1,RTR1,MCR1,LTR1,JPR1,ADR1,VolumeR1,responseR1);
Total.Properties.VariableNames={'subj_idx','RC','Cat1','Cat2','RT','MC','LT','JP','AD','Volume(%)','response'};
OFname='RTFiltered_PlaceboSampleData2Categorywith5050trials'+string(subj1)+'_only.csv';
writetable(Total,OFname);
end

