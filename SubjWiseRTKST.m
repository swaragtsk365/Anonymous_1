function SubjWiseRTKST(data)
% Data is everything including 50-50(Y3) trials
A=readtable(data);
subj_idx=table2array(A(:,{'Session'}));
RT=table2array(A(:,{'RT'}));
JP1=table2array(A(:,{'JP'}));
[N,~]=size(JP1);
JP=[];
for k=1:N
    a=JP1(k,1);
    JP=[JP;a{1}];
end
Idx=unique(subj_idx);
[N1,~]=size(Idx);
SI=[];
KSTAT=[];
pval=[];
H=[];
for k1=1:N1
    SI=[SI;k1];
    RTS=RT(subj_idx==k1);
    JPS=JP(subj_idx==k1);
    RTSL=RTS(JPS=='L');
    RTSR=RTS(JPS=='R');
    [h,p,ks2stat] = kstest2(RTSL,RTSR,'Alpha',0.05);
    if p>=0.5
        p=2*(1-p);
    elseif p<0.5
        p=2*p;
    end
    KSTAT=[KSTAT;ks2stat];
    pval=[pval;p];
end
a=size(SI)
b=size(KSTAT)
c=size(pval)
Total=table(SI,KSTAT,pval);
Total.Properties.VariableNames={'subj_idx','KS_Statistics','pvalue'};
writetable(Total,'KSLeft_Right_RT_Comparison_summary_50-50incl.csv')
end