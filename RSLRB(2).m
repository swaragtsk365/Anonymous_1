function RSLRB(file1,file2,OutputFname) %Function to remove subjects showing L-R Bias. file 1 is output of LRBiasAnalyser and file2 is any file containing original subjectwise data
    %Subj_id_col_name is title of subject id column in the original data
    %file
    tbl1=readtable(file1);
    subj_list=tbl1.SubjectId;
    pv=tbl1.pValue;
    tbl2=readtable(file2);
    Prop=tbl2.Properties.VariableNames;
    VarDiscr=tbl2.Properties.VariableDescriptions;
    Props=convertCharsToStrings(Prop);
    [Len,~]=size(subj_list);
    Sessions=tbl2.Session;
    [Tot,~]=size(Sessions);
    Vec=1:Tot;
    Vec=Vec';
    rm_list=[];
    for k=1:Len
        if pv(k,1)<0.05
            rm_list=[rm_list;subj_list(k,1)];
        else
            rm_list=rm_list;
        end
    end
    [N,~]=size(rm_list);
    OM=[];
    for ii=1:N
        Rows=Sessions~=rm_list(ii,1);
        OM=[OM,Rows];
    end
    Omission_list=logical(min(OM,[],2));
    tbl3=tbl2(Omission_list,Props);
    tbl3.Properties.VariableNames=VarDiscr;
    writetable(tbl3,OutputFname);
end