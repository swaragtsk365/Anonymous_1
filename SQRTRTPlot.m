function SQRTRTPlot(data)%Ploting RT distributions
A=readtable(data);
Subj= table2array(A(:,"Session"));
RT1= table2array(A(:,"RT"));
RT=sqrt(RT1);
Idx=unique(Subj);
N=length(Idx);
%for k=1:N
 %   ysub=RT(Subj==k);
  %  figure
   % hist(ysub)
    %xlabel('Reaction Time')
    %ylabel('Frequency')
    %end
MinRT=min(RT);
MaxRT=max(RT);
Fact=(MaxRT-MinRT)/N;
Bins=MinRT:Fact:MaxRT;
%f=histogram(RT,'BinEdges',Bins);
%v=f.Values
Freqs=[];
Counts=[];
figure

for k=1:N
    subplot(5,3,k)
    ysub=RT(Subj==k);
    histogram(ysub,'BinEdges',Bins)
    title('Subject'+string(k))
    xlabel('Sqrt RT')
    f=histogram(ysub,'BinEdges',Bins);
    v=f.Values;
    Scale=1/(max(v)-min(v));
    V=Scale*v;
    Freqs=[Freqs;V];
    Counts=[Counts;v];
    
end
savefig('RTSQRTHist.fig')
figure
imagesc(Freqs)
%ax = gca;%ax.XTick = Bins;
xlabel('Reaction Time Bins')
ylabel('Subject Index')
colorbar
RTV=[];
SUB=[];
Mean=[];
figure
for k=1:N
    ysub=RT(Subj==k);
    Mean=[Mean;mean(ysub)];
    [m,n]=size(ysub);
    ssub=k*ones(m,n);
    RTV=[RTV;ysub];
    SUB=[SUB;ssub]
end
boxplot(RTV,SUB)
title('Box Plot of Sqrt RT distribution')
xlabel('subject index')
ylabel('Sqrt Reaction Time')
hold on 
scatter(Idx,Mean)
    
end