function [Name, Estimate, SE, tStat, DF,pValue, Lower, Upper]=StatExtractor(mdl,order)
    Name=convertCharsToStrings(mdl.Coefficients.Name);
    for k=1:length(Name)
        Name(k,:)=Name(k,:)+'Model'+string(order);
    end
    disp(Name)
    Estimate=mdl.Coefficients.Estimate;
    SE=mdl.Coefficients.SE;
    tStat=mdl.Coefficients.tStat;
    DF=mdl.Coefficients.DF;
    pValue=mdl.Coefficients.pValue;
    Lower=mdl.Coefficients.Lower;
    Upper=mdl.Coefficients.Upper;
    %Table=table(Name,Estimate,SE,tStat,DF,pValue,Lower,Upper);
end