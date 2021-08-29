function FEGPAS(data) %EG plot for all subjects
A=readtable(data);
Subj= table2array(A(:,"Session"));
RT= table2array(A(:,"RT"));
Idx=unique(Subj);
N=length(Idx);
for k=1:N
    ysub=RT(Subj==k);
    FITEGPlot(ysub,k)
end