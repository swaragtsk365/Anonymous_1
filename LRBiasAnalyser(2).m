function LRBiasAnalyser(file,OFname)%Input data file containing whole data
    tbl=readtable(file);
    subj_idx=tbl.subj_idx;
    Choice=tbl.JP;
    subjects_list=unique(subj_idx);
    %disp(subjects_list(1:3,1))
    [SL,~]=size(subjects_list);
    Expected_prop=[];
    Num_trials=[];
    Number_left=[];
    Observed_prop=[];
    pValue=[];
    for k=1:SL
        SCC=Choice(subj_idx==subjects_list(k,1));
        SC=convertCharsToStrings(SCC);
        [NT,~]=size(SC);
        LJPV=(SC=='L');
        NLT=sum(LJPV);
        OP=NLT/NT;
        pv=binocdf(NLT,NT,0.5);
        if pv>0.5
            pv=2*(1-pv);
        else
            pv=2*pv;
        end
        Expected_prop=[Expected_prop;0.5];
        Observed_prop=[Observed_prop;OP];
        Num_trials=[Num_trials;NT];
        Number_left=[Number_left;NLT];
        pValue=[pValue;pv];
    end
    Total=table(subjects_list,Num_trials,Number_left,Expected_prop,Observed_prop,pValue);
    Total.Properties.VariableNames={'Subject id','Number of Trials','Number of Trials in Which Left Target is Choosen','Expected Proportion of Left JP','Observed Proportion of Left JP','pValue'};
    writetable(Total,OFname)
end