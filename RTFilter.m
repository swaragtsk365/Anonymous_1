function RTFilter(data)
A=readtable(data);
%disp(A)
Session=table2array(A(:,{'Session'}));
TrialNumber=table2array(A(:,{'Trial_Number'}));
RC=table2array(A(:,{'RC'}));
Cat1=table2array(A(:,{'Cat1'}));
Cat2=table2array(A(:,{'Cat2'}));
RT=table2array(A(:,{'RT'}));
MC=table2array(A(:,{'MC'}));
LT=table2array(A(:,{'LT'}));
JP=table2array(A(:,{'JP'}));
AD=table2array(A(:,{'AD'}));
Volume=table2array(A(:,{'Volume___'}));
response=table2array(A(:,{'response'}));
Idx=unique(Session);
subj_idx=[];
rc=[];
cat1=[];
cat2=[];
rt=[];
mc=[];
lt=[];
jp=[];
ad=[];
vol=[];
Resp=[];
SI=[];
LB=[];
M3S=[];
NEP=[];
TRIALNumber=[];

[N,~]=size(Idx);
for k=1:N
    SI=[SI;k];
    TRNS=TrialNumber(Session==k);
    RTS=RT(Session==k);
    Sessions=Session(Session==k);
    RCS=RC(Session==k);
    Cat1s=Cat1(Session==k);
    Cat2s=Cat2(Session==k);
    MCs=MC(Session==k);
    LTs=LT(Session==k);
    JPs=JP(Session==k);
    ADs=AD(Session==k);
    Volumes=Volume(Session==k);
    responses=response(Session==k);
    R=egfit(RTS);
    %[mu,sigma,tau]=R;
    Mu= R(1,1);
    Sigma= R(1,2);
    Tau=R(1,3);
    Mean=Mu+Tau;
    Var=sqrt((Sigma*Sigma)+(Tau*Tau));
    Lim=Mean+(3*Var);
    
    M3S=[M3S;Lim];
    LB=[LB;0.2];
    INX1=RTS>0.2; %RTs must be >200ms
    INX2=RTS<Lim; %RTs must be < Mean+3SD
    INX=[INX1,INX2];
    IDX=min(INX,[],2); %Logical array for selecting elements
    RTR=RTS(IDX);
    SR=Sessions(IDX);
    TNS=TRNS(IDX);
    RCR=RCS(IDX);
    Cat1R=Cat1s(IDX);
    Cat2R=Cat2s(IDX);
    MCR=MCs(IDX);
    LTR=LTs(IDX);
    JPR=JPs(IDX);
    ADR=ADs(IDX);
    VR=Volumes(IDX);
    RR=responses(IDX);
    subj_idx=[subj_idx;SR];
    TRIALNumber=[TRIALNumber;TNS];
    rc=[rc;RCR];
    cat1=[cat1;Cat1R];
    cat2=[cat2;Cat2R];
    rt=[rt;RTR];
    mc=[mc;MCR];
    lt=[lt;LTR];
    jp=[jp;JPR];
    ad=[ad;ADR];
    vol=[vol;VR];
    Resp=[Resp;RR];
    [NL,~]=size(IDX);
    SUM=sum(IDX);
    Epo=NL-SUM;
    NEP=[NEP;Epo];


    
    
   
end
Total=table(subj_idx,TRIALNumber,rc,cat1,cat2,rt,mc,lt,jp,ad,vol,Resp);
Total.Properties.VariableNames={'subj_idx','Trial_Number','RC','Cat1','Cat2','RT','MC','LT','JP','AD','Volume(%)','response'};
disp(Total)
writetable(Total,'RTFilteredPlaceboSampleData2Categorywith5050trials.csv');
Total2=table(SI,LB,M3S,NEP);
Total2.Properties.VariableNames={'subj_idx','Lower Bound of RT','Upper bound of RT','Number of excluded Points'};
writetable(Total2,'RTFilering_summary.csv')

end