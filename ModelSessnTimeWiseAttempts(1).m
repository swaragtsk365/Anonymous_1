function [] = ModelSessnTimeWiseAttempts(varargin)
% calculates and plots bin wise % unattempted trials in each session across Sal and Tyl sessions
% runs individual session and across session GLM models
% input: series of combined MLfiles, starting with saline then tylenol condition

bsizeSet = [50];
RunModel = 'y';

salNo=0;tylNo=0;
for ssn = 1:nargin
    
    mlfname=[];
    mlfname = char(cell2mat(varargin(ssn)));
    
    if strcmp(mlfname(1,6:8),'SAL')
        salNo = salNo + 1;
    elseif strcmp(mlfname(1,6:8),'TYL')
        tylNo = tylNo + 1;
    end
end

if strcmp(RunModel,'y')
    
    for bs = 1:size(bsizeSet,2)
        bsize = bsizeSet(1,bs);
        
        AllssnMat = [];
        per_NtAtt_SGT = ones(nargin,30)*NaN;
        per_NtAtt_SBT = ones(nargin,30)*NaN;
        per_NtAtt_OGT = ones(nargin,30)*NaN;
        per_NtAtt_OBT = ones(nargin,30)*NaN;
        
        ssn_SGvSB_beta = ones(nargin,8)*NaN;
        ssn_OGvOB_beta = ones(nargin,8)*NaN;
        
        for ssn = 1:nargin
            
            mlfname=[];
            mlfname = char(cell2mat(varargin(ssn)))
            
            typFiles(ssn,:) = mlfname;
            
            load(mlfname,'cTrlNo_');
            
            noT_s=0;noT_o=0;
            noF=[];
            Att_id_s=[];TrlBin_id_s=[];Val_id_s=[];Self_Other_s=[];mag_id_s=[];DrugCond_id_s=[];Sessn_id_s=[];M1_id_s=[];M2_id_s=[];
            Att_id_o=[];TrlBin_id_o=[];Val_id_o=[];Self_Other_o=[];mag_id_o=[];DrugCond_id_o=[];Sessn_id_o=[];M1_id_o=[];M2_id_o=[];
            
            TotalTrls = size(cTrlNo_,1);
            [fname,Tblock] = breakdown2bins(mlfname,TotalTrls,bsize);    % Tblock = no. of trials per subfile
            
            noF = size(fname,2);
            
            for sf = 1:noF
                sfname = fname(sf).filename;
                [AttmptSGT,AttmptSBT,AttmptOGT,AttmptOBT,NtAttmptSGT,NtAttmptSBT,NtAttmptOGT,NtAttmptOBT] = classifyTrials4BHVR(sfname);
                
                per_NtAtt_SGT(ssn,sf) = roundn((size(NtAttmptSGT,1)/(size(AttmptSGT,1)+size(NtAttmptSGT,1)))*100,-2);
                per_NtAtt_SBT(ssn,sf) = roundn((size(NtAttmptSBT,1)/(size(AttmptSBT,1)+size(NtAttmptSBT,1)))*100,-2);
                per_NtAtt_OGT(ssn,sf) = roundn((size(NtAttmptOGT,1)/(size(AttmptOGT,1)+size(NtAttmptOGT,1)))*100,-2);
                per_NtAtt_OBT(ssn,sf) = roundn((size(NtAttmptOBT,1)/(size(AttmptOBT,1)+size(NtAttmptOBT,1)))*100,-2);
                
                load(sfname,'cMagCue_')
                
                for sg = 1:size(AttmptSGT,1)
                    sgt = AttmptSGT(sg,1);
                    
                    noT_s = noT_s+1;
                    
                    Att_id_s(noT_s,1) = 0;
                    Val_id_s(noT_s,1) = 0;
                    Self_Other_s(noT_s,1) = 0;
                    TrlBin_id_s(noT_s,1) = sf;
                    Sessn_id_s(noT_s,1) = ssn;
                    
                    if strcmp(cMagCue_(sgt,:),'Y1') || strcmp(cMagCue_(sgt,:),'Y5')
                        mag_id_s(noT_s,1) = 0;
                    elseif strcmp(cMagCue_(sgt,:),'Y2') || strcmp(cMagCue_(sgt,:),'Y4')
                        mag_id_s(noT_s,1) = 1;
                    elseif strcmp(cMagCue_(sgt,:),'Y3')
                        mag_id_s(noT_s,1) = 2;
                    end
                    
                    if strcmp(mlfname(1,6:8),'SAL')
                        DrugCond_id_s(noT_s,1) = 1;
                    elseif strcmp(mlfname(1,6:8),'TYL')
                        DrugCond_id_s(noT_s,1) = 0;
                    end
                    
                    if strcmp(mlfname(1,10:11),'OS')
                        M1_id_s(noT_s,1) = 1;
                    elseif strcmp(mlfname(1,10:11),'CA')
                        M1_id_s(noT_s,1) = 2;
                    end
                    
                    if strcmp(mlfname(1,12:13),'CA')
                        M2_id_s(noT_s,1) = 1;
                    elseif strcmp(mlfname(1,12:13),'RA')
                        M2_id_s(noT_s,1) = 2;
                    end
                end
                
                for sb = 1:size(AttmptSBT,1)
                    sbt = AttmptSBT(sb,1);
                    
                    noT_s = noT_s+1;
                    
                    Att_id_s(noT_s,1) = 0;
                    Val_id_s(noT_s,1) = 1;
                    Self_Other_s(noT_s,1) = 0;
                    TrlBin_id_s(noT_s,1) = sf;
                    Sessn_id_s(noT_s,1) = ssn;
                    
                    if strcmp(cMagCue_(sbt,:),'Y1') || strcmp(cMagCue_(sbt,:),'Y5')
                        mag_id_s(noT_s,1) = 0;
                    elseif strcmp(cMagCue_(sbt,:),'Y2') || strcmp(cMagCue_(sbt,:),'Y4')
                        mag_id_s(noT_s,1) = 1;
                    elseif strcmp(cMagCue_(sbt,:),'Y3')
                        mag_id_s(noT_s,1) = 2;
                    end
                    
                    if strcmp(mlfname(1,6:8),'SAL')
                        DrugCond_id_s(noT_s,1) = 1;
                    elseif strcmp(mlfname(1,6:8),'TYL')
                        DrugCond_id_s(noT_s,1) = 0;
                    end
                    
                    if strcmp(mlfname(1,10:11),'OS')
                        M1_id_s(noT_s,1) = 1;
                    elseif strcmp(mlfname(1,10:11),'CA')
                        M1_id_s(noT_s,1) = 2;
                    end
                    
                    if strcmp(mlfname(1,12:13),'CA')
                        M2_id_s(noT_s,1) = 1;
                    elseif strcmp(mlfname(1,12:13),'RA')
                        M2_id_s(noT_s,1) = 2;
                    end
                end
                
                for nsg = 1:size(NtAttmptSGT,1)
                    nsgt = NtAttmptSGT(nsg,1);
                    
                    noT_s = noT_s+1;
                    
                    Att_id_s(noT_s,1) = 1;
                    Val_id_s(noT_s,1) = 0;
                    Self_Other_s(noT_s,1) = 0;
                    TrlBin_id_s(noT_s,1) = sf;
                    Sessn_id_s(noT_s,1) = ssn;
                    
                    if strcmp(cMagCue_(nsgt,:),'Y1') || strcmp(cMagCue_(nsgt,:),'Y5')
                        mag_id_s(noT_s,1) = 0;
                    elseif strcmp(cMagCue_(nsgt,:),'Y2') || strcmp(cMagCue_(nsgt,:),'Y4')
                        mag_id_s(noT_s,1) = 1;
                    elseif strcmp(cMagCue_(nsgt,:),'Y3')
                        mag_id_s(noT_s,1) = 2;
                    end
                    
                    if strcmp(mlfname(1,6:8),'SAL')
                        DrugCond_id_s(noT_s,1) = 1;
                    elseif strcmp(mlfname(1,6:8),'TYL')
                        DrugCond_id_s(noT_s,1) = 0;
                    end
                    
                    if strcmp(mlfname(1,10:11),'OS')
                        M1_id_s(noT_s,1) = 1;
                    elseif strcmp(mlfname(1,10:11),'CA')
                        M1_id_s(noT_s,1) = 2;
                    end
                    
                    if strcmp(mlfname(1,12:13),'CA')
                        M2_id_s(noT_s,1) = 1;
                    elseif strcmp(mlfname(1,12:13),'RA')
                        M2_id_s(noT_s,1) = 2;
                    end
                end
                
                for nsb = 1:size(NtAttmptSBT,1)
                    nsbt = NtAttmptSBT(nsb,1);
                    
                    noT_s = noT_s+1;
                    
                    Att_id_s(noT_s,1) = 1;
                    Val_id_s(noT_s,1) = 1;
                    Self_Other_s(noT_s,1) = 0;
                    TrlBin_id_s(noT_s,1) = sf;
                    Sessn_id_s(noT_s,1) = ssn;
                    
                    if strcmp(cMagCue_(nsbt,:),'Y1') || strcmp(cMagCue_(nsbt,:),'Y5')
                        mag_id_s(noT_s,1) = 0;
                    elseif strcmp(cMagCue_(nsbt,:),'Y2') || strcmp(cMagCue_(nsbt,:),'Y4')
                        mag_id_s(noT_s,1) = 1;
                    elseif strcmp(cMagCue_(nsbt,:),'Y3')
                        mag_id_s(noT_s,1) = 2;
                    end
                    
                    if strcmp(mlfname(1,6:8),'SAL')
                        DrugCond_id_s(noT_s,1) = 1;
                    elseif strcmp(mlfname(1,6:8),'TYL')
                        DrugCond_id_s(noT_s,1) = 0;
                    end
                    
                    if strcmp(mlfname(1,10:11),'OS')
                        M1_id_s(noT_s,1) = 1;
                    elseif strcmp(mlfname(1,10:11),'CA')
                        M1_id_s(noT_s,1) = 2;
                    end
                    
                    if strcmp(mlfname(1,12:13),'CA')
                        M2_id_s(noT_s,1) = 1;
                    elseif strcmp(mlfname(1,12:13),'RA')
                        M2_id_s(noT_s,1) = 2;
                    end
                end
        
            % --------- OG vs. OB ---------------
            
                
                for og = 1:size(AttmptOGT,1)
                    ogt = AttmptOGT(og,1);
                    
                    noT_o = noT_o+1;
                    
                    Att_id_o(noT_o,1) = 0;
                    Val_id_o(noT_o,1) = 0;
                    Self_Other_o(noT_o,1) = 1;
                    TrlBin_id_o(noT_o,1) = sf;
                    Sessn_id_o(noT_o,1) = ssn;
                    
                    if strcmp(cMagCue_(ogt,:),'Y1') || strcmp(cMagCue_(ogt,:),'Y5')
                        mag_id_o(noT_o,1) = 0;
                    elseif strcmp(cMagCue_(ogt,:),'Y2') || strcmp(cMagCue_(ogt,:),'Y4')
                        mag_id_o(noT_o,1) = 1;
                    elseif strcmp(cMagCue_(ogt,:),'Y3')
                        mag_id_o(noT_o,1) = 2;
                    end
                    
                    if strcmp(mlfname(1,6:8),'SAL')
                        DrugCond_id_o(noT_o,1) = 1;
                    elseif strcmp(mlfname(1,6:8),'TYL')
                        DrugCond_id_o(noT_o,1) = 0;
                    end
                    
                    if strcmp(mlfname(1,10:11),'OS')
                        M1_id_o(noT_o,1) = 1;
                    elseif strcmp(mlfname(1,10:11),'CA')
                        M1_id_o(noT_o,1) = 2;
                    end
                    
                    if strcmp(mlfname(1,12:13),'CA')
                        M2_id_o(noT_o,1) = 1;
                    elseif strcmp(mlfname(1,12:13),'RA')
                        M2_id_o(noT_o,1) = 2;
                    end
                end
                
                for ob = 1:size(AttmptOBT,1)
                    obt = AttmptOBT(ob,1);
                    
                    noT_o = noT_o+1;
                    
                    Att_id_o(noT_o,1) = 0;
                    Val_id_o(noT_o,1) = 1;
                    Self_Other_o(noT_o,1) = 1;
                    TrlBin_id_o(noT_o,1) = sf;
                    Sessn_id_o(noT_o,1) = ssn;
                    
                    if strcmp(cMagCue_(obt,:),'Y1') || strcmp(cMagCue_(obt,:),'Y5')
                        mag_id_o(noT_o,1) = 0;
                    elseif strcmp(cMagCue_(obt,:),'Y2') || strcmp(cMagCue_(obt,:),'Y4')
                        mag_id_o(noT_o,1) = 1;
                    elseif strcmp(cMagCue_(obt,:),'Y3')
                        mag_id_o(noT_o,1) = 2;
                    end
                    
                    if strcmp(mlfname(1,6:8),'SAL')
                        DrugCond_id_o(noT_o,1) = 1;
                    elseif strcmp(mlfname(1,6:8),'TYL')
                        DrugCond_id_o(noT_o,1) = 0;
                    end
                    
                    if strcmp(mlfname(1,10:11),'OS')
                        M1_id_o(noT_o,1) = 1;
                    elseif strcmp(mlfname(1,10:11),'CA')
                        M1_id_o(noT_o,1) = 2;
                    end
                    
                    if strcmp(mlfname(1,12:13),'CA')
                        M2_id_o(noT_o,1) = 1;
                    elseif strcmp(mlfname(1,12:13),'RA')
                        M2_id_o(noT_o,1) = 2;
                    end
                end
                
                for nog = 1:size(NtAttmptOGT,1)
                    nogt = NtAttmptOGT(nog,1);
                    
                    noT_o = noT_o+1;
                    
                    Att_id_o(noT_o,1) = 1;
                    Val_id_o(noT_o,1) = 0;
                    Self_Other_o(noT_o,1) = 1;
                    TrlBin_id_o(noT_o,1) = sf;
                    Sessn_id_o(noT_o,1) = ssn;
                    
                    if strcmp(cMagCue_(nogt,:),'Y1') || strcmp(cMagCue_(nogt,:),'Y5')
                        mag_id_o(noT_o,1) = 0;
                    elseif strcmp(cMagCue_(nogt,:),'Y2') || strcmp(cMagCue_(nogt,:),'Y4')
                        mag_id_o(noT_o,1) = 1;
                    elseif strcmp(cMagCue_(nogt,:),'Y3')
                        mag_id_o(noT_o,1) = 2;
                    end
                    
                    if strcmp(mlfname(1,6:8),'SAL')
                        DrugCond_id_o(noT_o,1) = 1;
                    elseif strcmp(mlfname(1,6:8),'TYL')
                        DrugCond_id_o(noT_o,1) = 0;
                    end
                    
                    if strcmp(mlfname(1,10:11),'OS')
                        M1_id_o(noT_o,1) = 1;
                    elseif strcmp(mlfname(1,10:11),'CA')
                        M1_id_o(noT_o,1) = 2;
                    end
                    
                    if strcmp(mlfname(1,12:13),'CA')
                        M2_id_o(noT_o,1) = 1;
                    elseif strcmp(mlfname(1,12:13),'RA')
                        M2_id_o(noT_o,1) = 2;
                    end
                end
                
                for nob = 1:size(NtAttmptOBT,1)
                    nobt = NtAttmptOBT(nob,1);
                    
                    noT_o = noT_o+1;
                    
                    Att_id_o(noT_o,1) = 1;
                    Val_id_o(noT_o,1) = 1;
                    Self_Other_o(noT_o,1) = 1;
                    TrlBin_id_o(noT_o,1) = sf;
                    Sessn_id_o(noT_o,1) = ssn;
                    
                    if strcmp(cMagCue_(nobt,:),'Y1') || strcmp(cMagCue_(nobt,:),'Y5')
                        mag_id_o(noT_o,1) = 0;
                    elseif strcmp(cMagCue_(nobt,:),'Y2') || strcmp(cMagCue_(nobt,:),'Y4')
                        mag_id_o(noT_o,1) = 1;
                    elseif strcmp(cMagCue_(nobt,:),'Y3')
                        mag_id_o(noT_o,1) = 2;
                    end
                    
                    if strcmp(mlfname(1,6:8),'SAL')
                        DrugCond_id_o(noT_o,1) = 1;
                    elseif strcmp(mlfname(1,6:8),'TYL')
                        DrugCond_id_o(noT_o,1) = 0;
                    end
                    
                    if strcmp(mlfname(1,10:11),'OS')
                        M1_id_o(noT_o,1) = 1;
                    elseif strcmp(mlfname(1,10:11),'CA')
                        M1_id_o(noT_o,1) = 2;
                    end
                    
                    if strcmp(mlfname(1,12:13),'CA')
                        M2_id_o(noT_o,1) = 1;
                    elseif strcmp(mlfname(1,12:13),'RA')
                        M2_id_o(noT_o,1) = 2;
                    end
                end
            end
            
             % for each session
            
            ssnMat_SGvSB = [];
            ssnMat_SGvSB = [Att_id_s,TrlBin_id_s,Val_id_s,Self_Other_s,mag_id_s,DrugCond_id_s,Sessn_id_s,M1_id_s,M2_id_s];
            
            tbl = [];
            tbl = table(Att_id_s,TrlBin_id_s,Val_id_s,Self_Other_s,mag_id_s,DrugCond_id_s,Sessn_id_s,M1_id_s,M2_id_s,'VariableNames',{'Attmpt','TrlBin','Valence','Self_Other','RwdMag','Tyl_Sal','Sessn','M1','M2'});
            
            tbl.M1 = nominal(tbl.M1);
            tbl.M2 = nominal(tbl.M2);
            tbl.Sessn = nominal(tbl.Sessn);
            
            modelspec = 'Attmpt ~ TrlBin*Valence + RwdMag';
            
            mdl=[];
            mdl = fitglm(tbl,modelspec,'Distribution','binomial','link','logit');
            
            % beta values and p values of the factors: Trlbin Valence RwdMag
            ssn_SGvSB_beta(ssn,:) = [roundn(table2array(mdl.Coefficients(2,1)),-2),table2array(mdl.Coefficients(2,4)),roundn(table2array(mdl.Coefficients(3,1)),-2),table2array(mdl.Coefficients(3,4)),roundn(table2array(mdl.Coefficients(4,1)),-2),table2array(mdl.Coefficients(4,4)),roundn(table2array(mdl.Coefficients(5,1)),-2),table2array(mdl.Coefficients(5,4))];
            
            
            % for each session
            
            ssnMat_OGvOB = [];
            ssnMat_OGvOB = [Att_id_o,TrlBin_id_o,Val_id_o,Self_Other_o,mag_id_o,DrugCond_id_o,Sessn_id_o,M1_id_o,M2_id_o];
            
            tbl = [];
            tbl = table(Att_id_o,TrlBin_id_o,Val_id_o,Self_Other_o,mag_id_o,DrugCond_id_o,Sessn_id_o,M1_id_o,M2_id_o,'VariableNames',{'Attmpt','TrlBin','Valence','Self_Other','RwdMag','Tyl_Sal','Sessn','M1','M2'});
            
            tbl.M1 = nominal(tbl.M1);
            tbl.M2 = nominal(tbl.M2);
            tbl.Sessn = nominal(tbl.Sessn);
            
            modelspec = 'Attmpt ~ TrlBin*Valence + RwdMag';
            
            mdl=[];
            mdl = fitglm(tbl,modelspec,'Distribution','binomial','link','logit');
            
            % beta values and p values of the factors: Trlbin Valence RwdMag
            ssn_OGvOB_beta(ssn,:) = [roundn(table2array(mdl.Coefficients(2,1)),-2),table2array(mdl.Coefficients(2,4)),roundn(table2array(mdl.Coefficients(3,1)),-2),table2array(mdl.Coefficients(3,4)),roundn(table2array(mdl.Coefficients(4,1)),-2),table2array(mdl.Coefficients(4,4)),roundn(table2array(mdl.Coefficients(5,1)),-2),table2array(mdl.Coefficients(5,4))];
            
            % trlbin beta significant or not
            if ssn_SGvSB_beta(ssn,2)<=0.05
                TBsig1 = '*';
            else
                TBsig1 = '';
            end
            
            if ssn_OGvOB_beta(ssn,2)<=0.05
                TBsig2 = '*';
            else
                TBsig2 = '';
            end
            
            % valence beta significant or not
            if ssn_SGvSB_beta(ssn,4)<=0.05
                valSig1 = '*';
            else
                valSig1 = '';
            end
            
            if ssn_OGvOB_beta(ssn,4)<=0.05
                valSig2 = '*';
            else
                valSig2 = '';
            end
            
             % Trlbin*valence interaction beta significant or not
            if ssn_SGvSB_beta(ssn,8)<=0.05
                intSig1 = '*';
            else
                intSig1 = '';
            end
            
            if ssn_OGvOB_beta(ssn,8)<=0.05
                intSig2 = '*';
            else
                intSig2 = '';
            end
            
            % ----
            
            fname0 = [mlfname(1,6:end-4),'-ssnTWUnattmpts'];
            
            h0 = figure('Name',fname0);
            subplot(2,2,1)
            plot(1:30,per_NtAtt_SGT(ssn,:),'ro-');
            hold on
            plot(1:30,per_NtAtt_SGT(ssn,:),'ro-.');
            axis([0 30 0 100])
            xlabel('Trial bins in a session')
            ylabel('% Unattempted')
            
            tab1 = ['TrlBin-Beta, SGvSB: ',num2str(ssn_SGvSB_beta(ssn,1)),TBsig1,', OGvOB: ',num2str(ssn_OGvOB_beta(ssn,1)),TBsig2];
            title(tab1);
            
            subplot(2,2,2)
            plot(1:30,per_NtAtt_SBT(ssn,:),'bo-');
            hold on
            plot(1:30,per_NtAtt_SBT(ssn,:),'bo-.');
            axis([0 30 0 100])
            xlabel('Trial bins in a session')
            ylabel('% Unattempted')
            
            tab3 = ['No of 50 trl bins in ssn: ',num2str(sf)];
            title(tab3);
            
            subplot(2,2,3)
            plot(1:30,per_NtAtt_OGT(ssn,:),'mo-');
            hold on
            plot(1:30,per_NtAtt_OGT(ssn,:),'mo-.');
            axis([0 30 0 100])
            xlabel('Trial bins in a session')
            ylabel('% Unattempted')
            
            tab2 = ['Val-Beta, SGvSB: ',num2str(ssn_SGvSB_beta(ssn,3)),valSig1,', OGvOB: ',num2str(ssn_OGvOB_beta(ssn,3)),valSig2];
            title(tab2);
            
            subplot(2,2,4)
            plot(1:30,per_NtAtt_OBT(ssn,:),'go-');
            hold on
            plot(1:30,per_NtAtt_OBT(ssn,:),'go-.');
            axis([0 30 0 100])
            xlabel('Trial bins in a session')
            ylabel('% Unattempted')
            
            tab4 = ['TrlBin*Val-Beta, SGvSB: ',num2str(ssn_SGvSB_beta(ssn,7)),intSig1,', OGvOB: ',num2str(ssn_OGvOB_beta(ssn,7)),intSig2];
            title(tab4);
            
            set(h0,'Position',[820 1200 525 510])
            snam='pdfPrint';                                                      % The name of your style file (NO extension)
%             s=hgexport('readstyle',snam);
%             fname0 = strcat(fname0,'.pdf');
%             s.Format = 'pdf';
%             hgexport(h0,fname0,s);
            close
            
            % % delete sub files
            for sf = 1:noF
                sfname = fname(sf).filename;
                delete(sfname);
            end
        end
        
        save('SessnTimeWiseAttmptsIModel.mat','ssn_SGvSB_beta','ssn_OGvOB_beta','typFiles');
    end
    
else
    load('SessnTimeWiseAttmptsIModel.mat','ssn_SGvSB_beta','ssn_OGvOB_beta','typFiles');
end
