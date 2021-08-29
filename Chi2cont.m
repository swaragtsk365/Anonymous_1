function [df,X2,P] = Chi2cont(X)
[M,N]=size(X);
df=(M-1)*(N-1);
% chi2cont chi-square test of contingency table
TOT=sum(X(:));
Cons=sum(X,2); % Row sums
Fracs=(1/TOT)*Cons; % Expected frequency based on null hypothesis
CTotals=sum(X,1); %Column total
Exp=Fracs*CTotals; %Expected distribution under null hypothesis
NUM=(Exp-X).*(Exp-X);
NUM2=NUM./Exp;
X2=sum(NUM2(:));
P=chi2cdf(X2,df,"upper");
end
