function [Z,Mu,STD]=PropZScore(y1,n1,y2,n2)
% Function to calculate z score between two proportions for null hypothesis
% of no diference between them
P1=y1/n1;
P2=y2/n2;
P=(y1+y2)/(n1+n2);
Num=P1-P2;
InvSum=(1/n1)+(1/n2);
Den=sqrt(P*(1-P)*InvSum);
Z=Num/Den;
Mu=Num;
STD=Den;

end