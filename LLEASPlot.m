function LLEASPlot(data)%Plot of LLOLD for all subjects
A=readtable(data);
A=readtable(data);
Subj= table2array(A(:,"Session"));
RT= table2array(A(:,"RT"));
Idx=unique(Subj);
N=length(Idx);
for k=1:N
    ysub=RT(Subj==k);
    LLOLD(ysub)
end
end