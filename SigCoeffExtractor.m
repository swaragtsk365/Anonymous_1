function SigCoeffExtractor(data,OFname)
A=readtable(data);
NameA=table2array(A(:,{'Name'}));
pV=table2array(A(:,5));
pValue=pV(pV<0.05);
Name=NameA(pV<0.05);
Total=table(Name,pValue);
writetable(Total,OFname)
end