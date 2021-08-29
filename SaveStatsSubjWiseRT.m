function SaveStatsSubjWiseRT(mlist,ordlist,Outputfile)
    Name=[];
    Estimate=[];
    SE=[];
    tStat=[];
    pValue=[];
    [N,~]=size(ordlist);
    for k=1:N
        [Namel, Estimatel, SEl, tStatl,pValuel]=StatExtractorSubjWise(mlist{1,k},ordlist(k,1));
        Name=[Name; Namel];
        Estimate=[Estimate; Estimatel];
        SE=[SE; SEl];
        tStat=[tStat;tStatl];
        pValue=[pValue;pValuel];
    end
    Table=table(Name,Estimate,SE,tStat,pValue);
    %Table=table(Name,Estimate,SE,tStat,DF,pValue,Lower,Upper);
    writetable(Table,Outputfile)
end