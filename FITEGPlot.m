function FITEGPlot(RTs,k)
RT=sort(RTs);
R=egfit(RT);
%[mu,sigma,tau]=R;
Mu= R(1,1);
Sigma= R(1,2);
Tau=R(1,3);
Mean=Mu+Tau;
Var=sqrt((Sigma*Sigma)+(Tau*Tau));
figure
histogram(RT,15,'Normalization',"pdf");
hold on
PDF=exgausspdf(R(1,1),R(1,2),R(1,3), RT);
plot(RT, PDF,'Color','r','Marker',"o")
Lim1=Mean+(2*Var);
Lim2=Mean+(3*Var);
xline(Lim1,'Color','g','LineWidth',2)
xline(Lim2,'Color','b','LineWidth',2)
Str='RT distribution and ex-Gaussian fit for subject'+string(k);
title(Str)
xlabel('Reaction Time')
ylabel('Probability')


end