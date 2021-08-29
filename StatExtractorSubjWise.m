function [Name, Estimate, SE, tStat,pValue]=StatExtractorSubjWise(mdl,order)
    Name=convertCharsToStrings(mdl.Coefficients.Row);
    for k=1:length(Name)
        Name(k,:)=Name(k,:)+'_Model'+string(order);
    end
    disp(Name)
    Estimate=mdl.Coefficients.Estimate;
    SE=mdl.Coefficients.SE;
    tStat=mdl.Coefficients.tStat;
    pValue=mdl.Coefficients.pValue;
    %Table=table(Name,Estimate,SE,tStat,DF,pValue,Lower,Upper);
end