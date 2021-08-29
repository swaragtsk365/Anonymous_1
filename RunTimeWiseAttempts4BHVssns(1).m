function [] = RunTimeWiseAttempts4BHVssns(varargin)
% calculates and plots bin wise % unattempted trials in each session across BHV and ECC sessions
% runs individual session and across session GLM models
% input: series of combined MLfiles, starting with saline then tylenol condition

bsizeSet = 50;   % array of potential trial bin sizes one would want to try out

Fname = ['TW-AttmptsModel-BHV-ECC-',num2str(nargin),'-ssns.mat'];

if exist(Fname)==2
    SaveNewFile = 'n';
else
    SaveNewFile = 'y';
end

bhvNo=0;eccNo=0;FileNames = [];
for ssn = 1:nargin
    
    mlfname=[];
    mlfname = char(cell2mat(varargin(ssn)));
    FileNames(ssn,:) = mlfname;
    
    if strcmp(mlfname(1,6:8),'BHV')
        bhvNo = bhvNo + 1;
    elseif strcmp(mlfname(1,6:8),'ECC')
        eccNo = eccNo + 1;
    end
end

FileNames = char(FileNames);

if strcmp(SaveNewFile,'y')
    
    AllssnMat = [];sessmax = 45;
    per_NtAtt_SGT = ones(nargin,sessmax)*NaN;
    per_NtAtt_SBT = ones(nargin,sessmax)*NaN;
    per_NtAtt_OGT = ones(nargin,sessmax)*NaN;
    per_NtAtt_OBT = ones(nargin,sessmax)*NaN;
    
    [AllssnMat_bhv,bhv_SF_beta,bhv_OT_beta,bhv_beta,bhv_NtAtt_SGT,bhv_NtAtt_SBT,bhv_NtAtt_OGT,bhv_NtAtt_OBT] = plotTimeWiseAttempts(bsizeSet,FileNames(1:bhvNo,:));
    
    
    per_NtAtt_SGT(1:bhvNo,:) = bhv_NtAtt_SGT;
    per_NtAtt_SBT(1:bhvNo,:) = bhv_NtAtt_SBT;
    per_NtAtt_OGT(1:bhvNo,:) = bhv_NtAtt_OGT;
    per_NtAtt_OBT(1:bhvNo,:) = bhv_NtAtt_OBT;
    
    
    [AllssnMat_ecc,ecc_SF_beta,ecc_OT_beta,ecc_beta,ecc_NtAtt_SGT,ecc_NtAtt_SBT,ecc_NtAtt_OGT,ecc_NtAtt_OBT] = plotTimeWiseAttempts(bsizeSet,FileNames(bhvNo+1:end,:));
    
    per_NtAtt_SGT(bhvNo+1:end,:) = ecc_NtAtt_SGT;
    per_NtAtt_SBT(bhvNo+1:end,:) = ecc_NtAtt_SBT;
    per_NtAtt_OGT(bhvNo+1:end,:) = ecc_NtAtt_OGT;
    per_NtAtt_OBT(bhvNo+1:end,:) = ecc_NtAtt_OBT;
    
    fign1 = 'BhvEcc-twNtAttmpts-AllBins-SG';
    h1 = figure('Name',fign1);
    
    plot(1:size(nanmean(per_NtAtt_SGT(1:bhvNo,:)),2),nanmean(per_NtAtt_SGT(1:bhvNo,:)),'ro-');
    hold on
    % errorbar(1:size(nanmean(per_NtAtt_SGT(1:bhvNo,:)),2),nanmean(per_NtAtt_SGT(1:bhvNo,:)),nanstd(per_NtAtt_SGT(1:bhvNo,:))./sqrt(length(~isnan(per_NtAtt_SGT(1:bhvNo,:)))),'k+')

    plot(1:size(nanmean(per_NtAtt_SGT(bhvNo+1:end,:)),2),nanmean(per_NtAtt_SGT(bhvNo+1:end,:)),'ro-.');
    axis([0 30 0 100])
    xlabel('Trial bins in a session')
    ylabel('% Unattempted')
    
    set(h1,'Position',[520 200 600 550])
    
    snam='pdfPrint';                                                      % The name of your style file (NO extension)
    s=hgexport('readstyle',snam);
    fname1 = strcat(fign1,'.pdf');
    s.Format = 'pdf';
    hgexport(h1,fname1,s);
    
    % --
    
    fign2 = 'BhvEcc-twNtAttmpts-AllBins-SB';
    h2 = figure('Name',fign2);
    
    plot(1:size(nanmean(per_NtAtt_SBT(1:bhvNo,:)),2),nanmean(per_NtAtt_SBT(1:bhvNo,:)),'bo-');
    hold on
    plot(1:size(nanmean(per_NtAtt_SBT(bhvNo+1:end,:)),2),nanmean(per_NtAtt_SBT(bhvNo+1:end,:)),'bo-.');
    axis([0 30 0 100])
    xlabel('Trial bins in a session')
    ylabel('% Unattempted')
    
    set(h2,'Position',[520 200 600 550])
    
    snam='pdfPrint';                                                      % The name of your style file (NO extension)
    s=hgexport('readstyle',snam);
    fname2 = strcat(fign2,'.pdf');
    s.Format = 'pdf';
    hgexport(h2,fname2,s);
    
    % --
    
    fign3 = 'BhvEcc-twNtAttmpts-AllBins-OG';
    h3 = figure('Name',fign3);
    
    plot(1:size(nanmean(per_NtAtt_OGT(1:bhvNo,:)),2),nanmean(per_NtAtt_OGT(1:bhvNo,:)),'mo-');
    hold on
    plot(1:size(nanmean(per_NtAtt_OGT(bhvNo+1:end,:)),2),nanmean(per_NtAtt_OGT(bhvNo+1:end,:)),'mo-.');
    axis([0 30 0 100])
    xlabel('Trial bins in a session')
    ylabel('% Unattempted')
    
    set(h3,'Position',[520 200 600 550])
    
    snam='pdfPrint';                                                      % The name of your style file (NO extension)
    s=hgexport('readstyle',snam);
    fname3 = strcat(fign3,'.pdf');
    s.Format = 'pdf';
    hgexport(h3,fname3,s);
    
    % --
    
    fign4 = 'BhvEcc-twNtAttmpts-AllBins-OB';
    h4 = figure('Name',fign4);
    
    plot(1:size(nanmean(per_NtAtt_OBT(1:bhvNo,:)),2),nanmean(per_NtAtt_OBT(1:bhvNo,:)),'go-');
    hold on
    plot(1:size(nanmean(per_NtAtt_OBT(bhvNo+1:end,:)),2),nanmean(per_NtAtt_OBT(bhvNo+1:end,:)),'go-.');
    axis([0 30 0 100])
    xlabel('Trial bins in a session')
    ylabel('% Unattempted')
    
    set(h4,'Position',[520 200 600 550])
    
    snam='pdfPrint';                                                      % The name of your style file (NO extension)
    s=hgexport('readstyle',snam);
    fname4 = strcat(fign4,'.pdf');
    s.Format = 'pdf';
    hgexport(h4,fname4,s);
    
    %---------
    
    fign0 = 'BhvEcc-twNtAttmpts-15bins';
    h0 = figure('Name',fign0);
    
    subplot(2,2,1)
    plot(1:15,nanmean(per_NtAtt_SGT(1:bhvNo,1:15)),'ro-');
    hold on
    plot(1:15,nanmean(per_NtAtt_SGT(bhvNo+1:end,1:15)),'ro-.');
    axis([0 16 0 100])
    xlabel('Trial bins in a session')
    ylabel('% Unattempted')
    
    subplot(2,2,2)
    plot(1:15,nanmean(per_NtAtt_SBT(1:bhvNo,1:15)),'bo-');
    hold on
    plot(1:15,nanmean(per_NtAtt_SBT(bhvNo+1:end,1:15)),'bo-.');
    axis([0 16 0 100])
    xlabel('Trial bins in a session')
    ylabel('% Unattempted')
    
    subplot(2,2,3)
    plot(1:15,nanmean(per_NtAtt_OGT(1:bhvNo,1:15)),'mo-');
    hold on
    plot(1:15,nanmean(per_NtAtt_OGT(bhvNo+1:end,1:15)),'mo-.');
    axis([0 16 0 100])
    xlabel('Trial bins in a session')
    ylabel('% Unattempted')
    
    subplot(2,2,4)
    plot(1:15,nanmean(per_NtAtt_OBT(1:bhvNo,1:15)),'go-');
    hold on
    plot(1:15,nanmean(per_NtAtt_OBT(bhvNo+1:end,1:15)),'go-.');
    axis([0 16 0 100])
    xlabel('Trial bins in a session')
    ylabel('% Unattempted')
    
    set(h0,'Position',[520 200 600 550])
    
    snam='pdfPrint';                                                      % The name of your style file (NO extension)
    s=hgexport('readstyle',snam);
    fname0 = strcat(fign0,'.pdf');
    s.Format = 'pdf';
    hgexport(h0,fname0,s);
       
    AllssnMat = [AllssnMat_bhv;AllssnMat_ecc];
    
    save(Fname,'AllssnMat','AllssnMat_bhv','AllssnMat_ecc','bhv_SF_beta','bhv_OT_beta','bhv_beta','ecc_SF_beta','ecc_OT_beta','ecc_beta','per_NtAtt_SGT','per_NtAtt_SBT','per_NtAtt_OGT','per_NtAtt_OBT');
    
else
    load(Fname,'AllssnMat','AllssnMat_bhv','AllssnMat_ecc','bhv_SF_beta','bhv_OT_beta','bhv_beta','ecc_SF_beta','ecc_OT_beta','ecc_beta','per_NtAtt_SGT','per_NtAtt_SBT','per_NtAtt_OGT','per_NtAtt_OBT');
end

% for across all bhv sessions

tbl = [];
tbl = table(AllssnMat_bhv(:,1),AllssnMat_bhv(:,2),AllssnMat_bhv(:,3),AllssnMat_bhv(:,4),AllssnMat_bhv(:,5),AllssnMat_bhv(:,6),AllssnMat_bhv(:,7),AllssnMat_bhv(:,8),AllssnMat_bhv(:,9),'VariableNames',{'AttmptB','TrlBinB','ValenceB','SelfOtherB','RwdMagB','BhvEccB','SessnB','M1B','M2B'});

tbl.M1B = nominal(tbl.M1B);
tbl.M2B = nominal(tbl.M2B);
tbl.SessnB = nominal(tbl.SessnB);

% modelspecS3t2v = 'AttmptB ~ TrlBinB + ValenceB + SelfOtherB + RwdMagB + TrlBinB:ValenceB:SelfOtherB + TrlBinB:ValenceB + TrlBinB:SelfOtherB + ValenceB:SelfOtherB + (1|SessnB) + (ValenceB|M1B)';
% mdlS3t2v = fitglme(tbl,modelspecS3t2v,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_S3t2v,dispersion_S3t2v,stats_S3t2v] = covarianceParameters(mdlS3t2v); % To  compute and display confidence intervals for the random effects parameters 


modelspecS0 = 'AttmptB ~ TrlBinB + ValenceB + SelfOtherB + RwdMagB + (1|SessnB)';
mdlS0 = fitglme(tbl,modelspecS0,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecS0a = 'AttmptB ~ TrlBinB + ValenceB + SelfOtherB + RwdMagB + (1|SessnB) + (1|M1B)';
mdlS0a = fitglme(tbl,modelspecS0a,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecS0b = 'AttmptB ~ TrlBinB + ValenceB + SelfOtherB + RwdMagB + (1|SessnB) + (1|M1B) + (1|SessnB:M1B)';
mdlS0b = fitglme(tbl,modelspecS0b,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecS0c = 'AttmptB ~ TrlBinB + ValenceB + SelfOtherB + RwdMagB + (1|SessnB) + (ValenceB|M1B)';
mdlS0c = fitglme(tbl,modelspecS0c,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecS0d = 'AttmptB ~ TrlBinB + ValenceB + SelfOtherB + RwdMagB + (1|SessnB) + (SelfOtherB|M1B)';
mdlS0d = fitglme(tbl,modelspecS0d,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecS0e = 'AttmptB ~ TrlBinB + ValenceB + SelfOtherB + RwdMagB + (1|SessnB) + (SelfOtherB|M1B) + (ValenceB|M1B)';
mdlS0e = fitglme(tbl,modelspecS0e,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecS0f = 'AttmptB ~ TrlBinB + ValenceB + SelfOtherB + RwdMagB + (ValenceB|SessnB) + (SelfOtherB|M1B) + (ValenceB|M1B)';
mdlS0f = fitglme(tbl,modelspecS0f,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecS0g = 'AttmptB ~ TrlBinB + ValenceB + SelfOtherB + RwdMagB + (ValenceB|SessnB) + (SelfOtherB|SessnB) + (SelfOtherB|M1B) + (ValenceB|M1B)';
mdlS0g = fitglme(tbl,modelspecS0g,'Distribution','binomial','link','logit','FitMethod','Laplace');


modelspecS1 = 'AttmptB ~ TrlBinB*ValenceB*SelfOtherB*RwdMagB + (1|SessnB) + (1|M1B)';
mdlS1 = fitglme(tbl,modelspecS1,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecS2 = 'AttmptB ~ TrlBinB*SelfOtherB*ValenceB + RwdMagB + (1|SessnB) + (1|M1B)';
mdlS2 = fitglme(tbl,modelspecS2,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecS2a = 'AttmptB ~ TrlBinB*SelfOtherB*ValenceB + RwdMagB + (1|SessnB) + (SelfOtherB|M1B)';
mdlS2a = fitglme(tbl,modelspecS2a,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecS2b = 'AttmptB ~ TrlBinB*SelfOtherB*ValenceB + RwdMagB + (1|SessnB) + (ValenceB|M1B)';
mdlS2b = fitglme(tbl,modelspecS2b,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecS2c = 'AttmptB ~ TrlBinB*SelfOtherB*ValenceB + RwdMagB + (1|SessnB) + (SelfOtherB|M1B) + (ValenceB|M1B)';
mdlS2c = fitglme(tbl,modelspecS2c,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecS2d = 'AttmptB ~ TrlBinB*SelfOtherB*ValenceB + RwdMagB + (SelfOtherB|SessnB) + (1|M1B)';
mdlS2d = fitglme(tbl,modelspecS2d,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecS2e = 'AttmptB ~ TrlBinB*SelfOtherB*ValenceB + RwdMagB + (ValenceB|SessnB) + (1|M1B)';
mdlS2e = fitglme(tbl,modelspecS2e,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecS2f = 'AttmptB ~ TrlBinB*SelfOtherB*ValenceB + RwdMagB + (ValenceB|SessnB) + (SelfOtherB|M1B) + (ValenceB|M1B)';
mdlS2f = fitglme(tbl,modelspecS2f,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecS2g = 'AttmptB ~ TrlBinB*SelfOtherB*ValenceB + RwdMagB + (SelfOtherB|SessnB) + (ValenceB|SessnB) + (SelfOtherB|M1B) + (ValenceB|M1B)';
mdlS2g = fitglme(tbl,modelspecS2g,'Distribution','binomial','link','logit','FitMethod','Laplace');

% ************************** 

modelspecS2h = 'AttmptB ~ TrlBinB*SelfOtherB*ValenceB + RwdMagB + (SelfOtherB|SessnB) + (ValenceB|SessnB) + (1|M1B)';
mdlS2h = fitglme(tbl,modelspecS2h,'Distribution','binomial','link','logit','FitMethod','Laplace');

% ***************************

modelspecS2i = 'AttmptB ~ TrlBinB*SelfOtherB*ValenceB + RwdMagB + (SelfOtherB|SessnB) + (ValenceB|SessnB)';
mdlS2i = fitglme(tbl,modelspecS2i,'Distribution','binomial','link','logit','FitMethod','Laplace');

% ********************************

% modelspecS3 = 'AttmptB ~ TrlBinB + ValenceB + SelfOtherB + RwdMagB + TrlBinB:ValenceB:SelfOtherB + TrlBinB:ValenceB + TrlBinB:SelfOtherB + TrlBinB:ValenceB + TrlBinB:SelfOtherB + ValenceB:SelfOtherB + (1|SessnB) + (1|M1B)';
% mdlS3 = fitglme(tbl,modelspecS3,'Distribution','binomial','link','logit','FitMethod','Laplace');


% for across all ecc sessions

tbl = [];
tbl = table(AllssnMat_ecc(:,1),AllssnMat_ecc(:,2),AllssnMat_ecc(:,3),AllssnMat_ecc(:,4),AllssnMat_ecc(:,5),AllssnMat_ecc(:,6),AllssnMat_ecc(:,7),AllssnMat_ecc(:,8),AllssnMat_ecc(:,9),'VariableNames',{'AttmptE','TrlBinE','ValenceE','SelfOtherE','RwdMagE','BhvEccE','SessnE','M1E','M2E'});

tbl.M1E = nominal(tbl.M1E);
tbl.M2E = nominal(tbl.M2E);
tbl.SessnE = nominal(tbl.SessnE);

modelspecT0 = 'AttmptE ~ TrlBinE + ValenceE + SelfOtherE + RwdMagE + (1|SessnE) + (1|M1E)';
mdlT0 = fitglme(tbl,modelspecT0,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecT1 = 'AttmptE ~ TrlBinE*ValenceE*SelfOtherE*RwdMagE + (1|SessnE) + (1|M1E)';
mdlT1 = fitglme(tbl,modelspecT1,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecT2 = 'AttmptE ~ TrlBinE*SelfOtherE*ValenceE + RwdMagE + (1|SessnE) + (1|M1E)';
mdlT2 = fitglme(tbl,modelspecT2,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecT2h = 'AttmptE ~ TrlBinE*SelfOtherE*ValenceE + RwdMagE + (SelfOtherE|SessnE) + (ValenceE|SessnE) + (1|M1E)';
mdlT2h = fitglme(tbl,modelspecT2h,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspecT2i = 'AttmptE ~ TrlBinE*SelfOtherE*ValenceE + RwdMagE + (SelfOtherE|SessnE) + (ValenceE|SessnE)';
mdlT2i = fitglme(tbl,modelspecT2i,'Distribution','binomial','link','logit','FitMethod','Laplace');

% % % -----SAME AS ------
% 
% modelspecT3 = 'AttmptE ~ TrlBinE + ValenceE + SelfOtherE + RwdMagE + TrlBinE:ValenceE:SelfOtherE + TrlBinE:ValenceE + TrlBinE:SelfOtherE + TrlBinE:ValenceE + TrlBinE:SelfOtherE + ValenceE:SelfOtherE + (1|SessnE) + (1|M1E)';
% mdlT3 = fitglme(tbl,modelspecT3,'Distribution','binomial','link','logit','FitMethod','Laplace');


% for across sessions

tbl = [];
tbl = table(AllssnMat(:,1),AllssnMat(:,2),AllssnMat(:,3),AllssnMat(:,4),AllssnMat(:,5),AllssnMat(:,6),AllssnMat(:,7),AllssnMat(:,8),AllssnMat(:,9),'VariableNames',{'Attmpt','TrlBin','Valence','SelfOther','RwdMag','BhvEcc','Sessn','M1','M2'});

tbl.M1 = nominal(tbl.M1);
tbl.M2 = nominal(tbl.M2);
tbl.Sessn = nominal(tbl.Sessn);
tbl.BhvEcc = nominal(tbl.BhvEcc);
tbl.SelfOther = nominal(tbl.SelfOther);
tbl.Valence = nominal(tbl.Valence);

modelspec0 = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + (1|Sessn) + (1|M1)';
mdl0 = fitglme(tbl,modelspec0,'Distribution','binomial','link','logit','FitMethod','Laplace');

% modelspec3c = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + (1|Sessn) + (1|Valence:Sessn) + (1|M1)';
% mdl3c = fitglme(tbl,modelspec3c,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3c,dispersion_3c,stats_3c] = covarianceParameters(mdl3c);
% 
% results_0_3c = compare(mdl0,mdl3c);
% 
% modelspec3d = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + (Valence|Sessn) + (1|M1)';
% mdl3d = fitglme(tbl,modelspec3d,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3d,dispersion_3d,stats_3d] = covarianceParameters(mdl3d);
% 
% results_0_3d = compare(mdl0,mdl3d);
% 
% modelspec3e = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + (1|Sessn) + (1|Valence:M1) + (1|M1)';
% mdl3e = fitglme(tbl,modelspec3e,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3e,dispersion_3e,stats_3e] = covarianceParameters(mdl3e);
% 
% results_0_3e = compare(mdl0,mdl3e);
% 
% modelspec3f = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + (1|Sessn) + (Valence|M1)';
% mdl3f = fitglme(tbl,modelspec3f,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3f,dispersion_3f,stats_3f] = covarianceParameters(mdl3f);
% 
% results_0_3f = compare(mdl0,mdl3f);

modelspec3g = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + (1|Sessn) + (1|M1)';
mdl3g = fitglme(tbl,modelspec3g,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3g,dispersion_3g,stats_3g] = covarianceParameters(mdl3g);

results_0_3g = compare(mdl0,mdl3g);

% modelspec3h = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + Valence:SelfOther + (1|Sessn) + (1|M1)';
% mdl3h = fitglme(tbl,modelspec3h,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3h,dispersion_3h,stats_3h] = covarianceParameters(mdl3h);
% 
% results_0_3h = compare(mdl0,mdl3h);
% 
% modelspec3i = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + (1|Sessn) + (SelfOther|M1)';
% mdl3i = fitglme(tbl,modelspec3i,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3i,dispersion_3i,stats_3i] = covarianceParameters(mdl3i);
% 
% results_0_3i = compare(mdl0,mdl3i);
% 
% modelspec3j = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + (SelfOther|Sessn) + (1|M1)';
% mdl3j = fitglme(tbl,modelspec3j,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3j,dispersion_3j,stats_3j] = covarianceParameters(mdl3j);
% 
% results_0_3j = compare(mdl0,mdl3j);
% 
% modelspec3k = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + (1|Sessn) + (1|M1) + (1|SelfOther:M1)';
% mdl3k = fitglme(tbl,modelspec3k,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3k,dispersion_3k,stats_3k] = covarianceParameters(mdl3k);
% 
% results_0_3k = compare(mdl0,mdl3k);
% 
% %---------------------------------
% 
% modelspec3l = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence + (1|Sessn) + (SelfOther|M1)';
% mdl3l = fitglme(tbl,modelspec3l,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3l,dispersion_3l,stats_3l] = covarianceParameters(mdl3l);
% 
% results_3i_3l = compare(mdl3i,mdl3l);
% 
% modelspec3l2 = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence + (1|Sessn) + (1|M1)';
% mdl3l2 = fitglme(tbl,modelspec3l2,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3l2,dispersion_3l2,stats_3l2] = covarianceParameters(mdl3l2);
% 
% results_3i_3l2 = compare(mdl3i,mdl3l2);
% 
% %-------------------------------------
% 
% modelspec3m = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:SelfOther + (1|Sessn) + (SelfOther|M1)';
% mdl3m = fitglme(tbl,modelspec3m,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3m,dispersion_3m,stats_3m] = covarianceParameters(mdl3m);
% 
% results_3i_3m = compare(mdl3i,mdl3m);
% 
% modelspec3m2 = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:SelfOther + (1|Sessn) + (1|M1)';
% mdl3m2 = fitglme(tbl,modelspec3m2,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3m2,dispersion_3m2,stats_3m2] = covarianceParameters(mdl3m2);
% 
% results_3i_3m2 = compare(mdl3i,mdl3m2);
% 
% %---------------------------------
% 
% modelspec3n = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + Valence:SelfOther + (1|Sessn) + (SelfOther|M1)';
% mdl3n = fitglme(tbl,modelspec3n,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3n,dispersion_3n,stats_3n] = covarianceParameters(mdl3n);
% 
% results_3i_3n = compare(mdl3i,mdl3n);
% 
% modelspec3n2 = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + Valence:SelfOther + (1|Sessn) + (1|M1)';
% mdl3n2 = fitglme(tbl,modelspec3n2,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3n2,dispersion_3n2,stats_3n2] = covarianceParameters(mdl3n2);
% 
% results_3i_3n2 = compare(mdl3i,mdl3n2);
% 
% %------------------------------------
% 
% modelspec3o = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + Valence:BhvEcc + (1|Sessn) + (SelfOther|M1)';
% mdl3o = fitglme(tbl,modelspec3o,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3o,dispersion_3o,stats_3o] = covarianceParameters(mdl3o);
% 
% results_3i_3o = compare(mdl3i,mdl3o);

% modelspec3o2 = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + Valence:BhvEcc + (1|Sessn) + (1|M1)';
% mdl3o2 = fitglme(tbl,modelspec3o2,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3o2,dispersion_3o2,stats_3o2] = covarianceParameters(mdl3o2);
% 
% results_3i_3o2 = compare(mdl3o2,mdl3i);
% 
% %-----------------------------------
% 
% modelspec3p = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + SelfOther:BhvEcc + (1|Sessn) + (SelfOther|M1)';
% mdl3p = fitglme(tbl,modelspec3p,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3p,dispersion_3p,stats_3p] = covarianceParameters(mdl3p);
% 
% results_3i_3p = compare(mdl3i,mdl3p);
% 
% modelspec3p2 = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + SelfOther:BhvEcc + (1|Sessn) + (1|M1)';
% mdl3p2 = fitglme(tbl,modelspec3p2,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3p2,dispersion_3p2,stats_3p2] = covarianceParameters(mdl3p2);
% 
% results_3i_3p2 = compare(mdl3i,mdl3p2);
% 
% %----------------------------------

% modelspec3q = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + Valence:BhvEcc + SelfOther:BhvEcc + (1|Sessn) + (SelfOther|M1)';
% mdl3q = fitglme(tbl,modelspec3q,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3q,dispersion_3q,stats_3q] = covarianceParameters(mdl3q);
% 
% results_3i_3q = compare(mdl3i,mdl3q);

modelspec3q2 = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + Valence:BhvEcc + SelfOther:BhvEcc + (1|Sessn) + (1|M1)';
mdl3q2 = fitglme(tbl,modelspec3q2,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3q2,dispersion_3q2,stats_3q2] = covarianceParameters(mdl3q2);

% results_3i_3q2 = compare(mdl3q2,mdl3i);

% %-----------------------------------
% 
% modelspec3r = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + Valence:TrlBin + Valence:BhvEcc + SelfOther:BhvEcc + (1|Sessn) + (SelfOther|M1)';
% mdl3r = fitglme(tbl,modelspec3r,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3r,dispersion_3r,stats_3r] = covarianceParameters(mdl3r);
% 
% results_3i_3r = compare(mdl3i,mdl3r);

modelspec3r2 = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + Valence:TrlBin + Valence:BhvEcc + SelfOther:BhvEcc + (1|Sessn) + (1|M1)';
mdl3r2 = fitglme(tbl,modelspec3r2,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3r2,dispersion_3r2,stats_3r2] = covarianceParameters(mdl3r2);

% results_3i_3r2 = compare(mdl3i,mdl3r2);

% --------------------------------

% modelspec3s = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + SelfOther:TrlBin + Valence:BhvEcc + SelfOther:BhvEcc + (1|Sessn) + (SelfOther|M1)';
% mdl3s = fitglme(tbl,modelspec3s,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3s,dispersion_3s,stats_3s] = covarianceParameters(mdl3s);
% 
% results_3i_3s = compare(mdl3i,mdl3s);

modelspec3s2 = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + SelfOther:TrlBin + Valence:BhvEcc + SelfOther:BhvEcc + (1|Sessn) + (1|M1)';
mdl3s2 = fitglme(tbl,modelspec3s2,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3s2,dispersion_3s2,stats_3s2] = covarianceParameters(mdl3s2);

% results_3i_3s2 = compare(mdl3i,mdl3s2);

%----------------------

% modelspec3t = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + BhvEcc:TrlBin + Valence:BhvEcc + SelfOther:BhvEcc + (1|Sessn) + (SelfOther|M1)';
% mdl3t = fitglme(tbl,modelspec3t,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t,dispersion_3t,stats_3t] = covarianceParameters(mdl3t);
% 
% results_3i_3t = compare(mdl3i,mdl3t);    % [beta,betanames,stats] = fixedEffects(mdl3t);

% % The p-values obtained using the likelihood ratio test can be conservative when testing for the presence or absence of 
% % random-effects terms, and anti-conservative when testing for the presence or absence of fixed-effects terms. 
% % Instead, use the fixedEffects or coefTest methods to test for fixed effects.

% % To conduct a valid likelihood ratio test on GLME models, both models must be fitted using a Laplace or approximate Laplace fit method. 
% % Models fitted using a maximum pseudo likelihood (MPL) or restricted maximum pseudo likelihood (REMPL) method cannot be compared using 
% % a likelihood ratio test.

modelspec3t2 = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + BhvEcc:TrlBin + Valence:BhvEcc + SelfOther:BhvEcc + (1|Sessn) + (1|M1)';
mdl3t2 = fitglme(tbl,modelspec3t2,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2,dispersion_3t2,stats_3t2] = covarianceParameters(mdl3t2);
% [beta_3t2,betanames_3t2,stats_3t2] = fixedEffects(mdl3t2);

modelspec3t2b = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + BhvEcc:TrlBin + Valence:BhvEcc + SelfOther:BhvEcc + TrlBin:Valence + (1|Sessn) + (1|M1)';
mdl3t2b = fitglme(tbl,modelspec3t2b,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2b,dispersion_3t2b,stats_3t2b] = covarianceParameters(mdl3t2b);
% [beta_3t2b,betanames_3t2b,stats_3t2b] = fixedEffects(mdl3t2b);

modelspec3t2c = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + BhvEcc:TrlBin + Valence:BhvEcc + SelfOther:BhvEcc + SelfOther:Valence + (1|Sessn) + (1|M1)';
mdl3t2c = fitglme(tbl,modelspec3t2c,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2c,dispersion_3t2c,stats_3t2c] = covarianceParameters(mdl3t2c);
% [beta_3t2c,betanames_3t2c,stats_3t2c] = fixedEffects(mdl3t2c);

modelspec3t2d = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + BhvEcc:TrlBin + Valence:BhvEcc + SelfOther:BhvEcc + SelfOther:TrlBin + (1|Sessn) + (1|M1)';
mdl3t2d = fitglme(tbl,modelspec3t2d,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2d,dispersion_3t2d,stats_3t2d] = covarianceParameters(mdl3t2d);
% [beta_3t2d,betanames_3t2d,stats_3t2d] = fixedEffects(mdl3t2d);

modelspec3t2e = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + BhvEcc:TrlBin + Valence:BhvEcc + SelfOther:BhvEcc + SelfOther:Valence + TrlBin:Valence + (1|Sessn) + (1|M1)';
mdl3t2e = fitglme(tbl,modelspec3t2e,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2e,dispersion_3t2e,stats_3t2e] = covarianceParameters(mdl3t2e);
% [beta_3t2e,betanames_3t2e,stats_3t2e] = fixedEffects(mdl3t2e);

modelspec3t2f = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + BhvEcc:TrlBin + Valence:BhvEcc + SelfOther:BhvEcc + SelfOther:TrlBin + SelfOther:Valence + TrlBin:Valence + (1|Sessn) + (1|M1)';
mdl3t2f = fitglme(tbl,modelspec3t2f,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2f,dispersion_3t2f,stats_3t2f] = covarianceParameters(mdl3t2f);
% [beta_3t2f,betanames_3t2f,stats_3t2f] = fixedEffects(mdl3t2f);

modelspec3t2g = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + Valence:BhvEcc + SelfOther:BhvEcc + SelfOther:Valence + (1|Sessn) + (1|M1)';
mdl3t2g = fitglme(tbl,modelspec3t2g,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2g,dispersion_3t2g,stats_3t2g] = covarianceParameters(mdl3t2g);
% [beta_3t2g,betanames_3t2g,stats_3t2g] = fixedEffects(mdl3t2g);

modelspec3t2h = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + Valence:BhvEcc + SelfOther:BhvEcc + SelfOther:Valence + TrlBin:Valence + SelfOther:TrlBin + (1|Sessn) + (1|M1)';
mdl3t2h = fitglme(tbl,modelspec3t2h,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2h,dispersion_3t2h,stats_3t2h] = covarianceParameters(mdl3t2h);
% [beta_3t2h,betanames_3t2h,stats_3t2h] = fixedEffects(mdl3t2h);

modelspec3t2i = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + BhvEcc:TrlBin + Valence:BhvEcc + SelfOther:BhvEcc + SelfOther:Valence + TrlBin:Valence + SelfOther:TrlBin + (1|Sessn) + (1|M1)';
mdl3t2i = fitglme(tbl,modelspec3t2i,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2i,dispersion_3t2i,stats_3t2i] = covarianceParameters(mdl3t2i);
% [beta_3t2i,betanames_3t2i,stats_3t2i] = fixedEffects(mdl3t2i);

modelspec3t2j = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + BhvEcc:TrlBin + Valence:BhvEcc + SelfOther:BhvEcc + SelfOther:Valence + (1|Sessn) + (1|M1)';
mdl3t2j = fitglme(tbl,modelspec3t2j,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2j,dispersion_3t2j,stats_3t2j] = covarianceParameters(mdl3t2j);
% [beta_3t2j,betanames_3t2j,stats_3t2j] = fixedEffects(mdl3t2j);


% modelspec3t3 = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + Valence:BhvEcc + SelfOther:BhvEcc + (1|Sessn) + (1|M1)';
% mdl3t3 = fitglme(tbl,modelspec3t3,'Distribution','binomial','link','logit','FitMethod','Laplace');
% results_3t2_3t3 = compare(mdl3t3,mdl3t2,'CheckNesting',true);
% [beta_3t3,betanames_3t3,stats_3t3] = fixedEffects(mdl3t3);
% 
% modelspec3t4 = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + BhvEcc:TrlBin + SelfOther:BhvEcc + (1|Sessn) + (1|M1)';
% mdl3t4 = fitglme(tbl,modelspec3t4,'Distribution','binomial','link','logit','FitMethod','Laplace');
% results_3t2_3t4 = compare(mdl3t4,mdl3t2,'CheckNesting',true);
% [beta_3t4,betanames_3t4,stats_3t4] = fixedEffects(mdl3t4);
% 
% modelspec3t5 = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + BhvEcc:TrlBin + Valence:BhvEcc + (1|Sessn) + (1|M1)';
% mdl3t5 = fitglme(tbl,modelspec3t5,'Distribution','binomial','link','logit','FitMethod','Laplace');
% results_3t2_3t5 = compare(mdl3t5,mdl3t2,'CheckNesting',true);
% [beta_3t5,betanames_3t5,stats_3t5] = fixedEffects(mdl3t5);
% 
% modelspec3t6 = 'Attmpt ~ Valence + SelfOther + RwdMag + BhvEcc + BhvEcc:TrlBin + Valence:BhvEcc + (1|Sessn) + (1|M1)';
% mdl3t6 = fitglme(tbl,modelspec3t6,'Distribution','binomial','link','logit','FitMethod','Laplace');
% results_3t2_3t6 = compare(mdl3t6,mdl3t2,'CheckNesting',true);
% [beta_3t6,betanames_3t6,stats_3t6] = fixedEffects(mdl3t6);

% modelspec3t7 = 'Attmpt ~ TrlBin + SelfOther + RwdMag + BhvEcc + BhvEcc:TrlBin + Valence:BhvEcc + (1|Sessn) + (1|M1)';
% mdl3t7 = fitglme(tbl,modelspec3t7,'Distribution','binomial','link','logit','FitMethod','Laplace');
% results_3t2_3t7 = compare(mdl3t7,mdl3t2,'CheckNesting',true);
% [beta_3t7,betanames_3t7,stats_3t7] = fixedEffects(mdl3t7);

% modelspec3t8 = 'Attmpt ~ TrlBin + Valence + RwdMag + BhvEcc + BhvEcc:TrlBin + Valence:BhvEcc + (1|Sessn) + (1|M1)';
% mdl3t8 = fitglme(tbl,modelspec3t8,'Distribution','binomial','link','logit','FitMethod','Laplace');
% results_3t2_3t8 = compare(mdl3t8,mdl3t2,'CheckNesting',true);
% [beta_3t8,betanames_3t8,stats_3t8] = fixedEffects(mdl3t8);
% 
% modelspec3t9 = 'Attmpt ~ TrlBin + Valence + SelfOther + BhvEcc + BhvEcc:TrlBin + Valence:BhvEcc + (1|Sessn) + (1|M1)';
% mdl3t9 = fitglme(tbl,modelspec3t9,'Distribution','binomial','link','logit','FitMethod','Laplace');
% results_3t2_3t9 = compare(mdl3t9,mdl3t2,'CheckNesting',true);
% [beta_3t9,betanames_3t9,stats_3t9] = fixedEffects(mdl3t9);
% 
% modelspec3t10 = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc:TrlBin + Valence:BhvEcc + (1|Sessn) + (1|M1)';
% mdl3t10 = fitglme(tbl,modelspec3t10,'Distribution','binomial','link','logit','FitMethod','Laplace');
% results_3t2_3t10 = compare(mdl3t10,mdl3t2,'CheckNesting',true);
% [beta_3t10,betanames_3t10,stats_3t10] = fixedEffects(mdl3t10);

% results_3i_3t2 = compare(mdl3t2,mdl3i);
% results_3q2_3t2 = compare(mdl3t2,mdl3q2);
% results_3p2_3t2 = compare(mdl3t2,mdl3p2);

% modelspec3u = 'Attmpt ~ TrlBin + Valence + SelfOther + BhvEcc + BhvEcc:TrlBin + Valence:BhvEcc + SelfOther:BhvEcc + (1|Sessn) + (1|M1)';
% mdl3u = fitglme(tbl,modelspec3u,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3u,dispersion_3u,stats_3u] = covarianceParameters(mdl3u);
% 
% results_3i_3u = compare(mdl3i,mdl3u);


% % psi{1} & psi{2} give an estimated covariance parameter for the first &
% % second grouping variables (ssn & M1)
% % dispersion gives the estimated dispersion parameter
% 
% % The first & second cells of stats contains statistics for the first and second grouping variables (ssn & M1 here), 
% % while the third cell contains statistics for the dispersion parameter.
% 
% % Here, standard deviation is a measure of how much variability in the dependent measure there is 
% % due to our grouping variables (our two random effects). For e.g., if the estimated standard deviation 
% % of the random effect associated with the predictor is 0.31381, and the 95% confidence interval is [0.19253 , 0.51148]. 
% % Because the confidence interval does not contain 0, the random intercept
% % is significant at the 5% significance level and accounts for 9.6% of
% % total variability in responses
% 
% % residuals in a dichotomous response logistic model doesn't inform much
% % https://www.ssc.wisc.edu/sscc/pubs/MM/MM_DiagInfer.html#:~:text=The%20residual%20plot%20for%20a,They%20are%20typically%20not%20considered.&text=The%20plot()%20function%20will%20produce%20a%20residual%20plot%20for,the%20plot%20for%20lmer%20models.
% % otherwise, to plot, use:
% % figure, plotResiduals(mdl3,'histogram','ResidualType','Pearson')
% % figure, plotResiduals(mdl3,'fitted','ResidualType','Pearson')
% % figure, plotResiduals(mdl3,'lagged','ResidualType','Pearson')
% 
% % to get fitted values of the model: mufit = fitted(mdl3); 
% % plotting observed vs. fitted values: scatter(AllssnMat(:,1),mufit)

modelspec1 = 'Attmpt ~ TrlBin*Valence*SelfOther*RwdMag*BhvEcc + (1|Sessn) + (1|M1)';
mdl1 = fitglme(tbl,modelspec1,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspec2 = 'Attmpt ~ TrlBin*SelfOther*BhvEcc*Valence + RwdMag + (1|Sessn) + (1|M1)';
mdl2 = fitglme(tbl,modelspec2,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspec2i = 'Attmpt ~ TrlBin*SelfOther*BhvEcc*Valence + RwdMag + (SelfOther|Sessn) + (Valence|Sessn)';
mdl2i = fitglme(tbl,modelspec2i,'Distribution','binomial','link','logit','FitMethod','Laplace');

modelspec3 = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + TrlBin:Valence:BhvEcc + TrlBin:SelfOther:BhvEcc + TrlBin:Valence + TrlBin:SelfOther + TrlBin:BhvEcc + Valence:SelfOther + Valence:BhvEcc + SelfOther:BhvEcc + (1|Sessn) + (1|M1)';
mdl3 = fitglme(tbl,modelspec3,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3,dispersion_3,stats_3] = covarianceParameters(mdl3); % To  compute and display confidence intervals for the random effects parameters 

% comparing two models to get the significance of a term

% results_3_3t2 = compare(mdl3,mdl3t2);
% results_0_3t2 = compare(mdl0,mdl3t2);

modelspec3a = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + TrlBin:Valence:BhvEcc + TrlBin:SelfOther:BhvEcc + TrlBin:Valence + TrlBin:SelfOther + TrlBin:BhvEcc + Valence:SelfOther + Valence:BhvEcc + SelfOther:BhvEcc + (Valence|Sessn) + (Valence|M1) + (SelfOther|Sessn) + (SelfOther|M1)';
mdl3a = fitglme(tbl,modelspec3a,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3a,dispersion_3a,stats_3a] = covarianceParameters(mdl3a); % To  compute and display confidence intervals for the random effects parameters 

modelspec3b = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + TrlBin:Valence:BhvEcc + TrlBin:SelfOther:BhvEcc + TrlBin:Valence + TrlBin:SelfOther + TrlBin:BhvEcc + Valence:SelfOther + Valence:BhvEcc + SelfOther:BhvEcc + (Valence|Sessn) + (Valence|M1) + (SelfOther|Sessn) + (1|M1)';
mdl3b = fitglme(tbl,modelspec3b,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3b,dispersion_3b,stats_3b] = covarianceParameters(mdl3b); % To  compute and display confidence intervals for the random effects parameters 

% results_3a_3b = compare(mdl3b,mdl3a);

modelspec3t2k = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + TrlBin:Valence:BhvEcc + TrlBin:SelfOther:BhvEcc + TrlBin:Valence + TrlBin:SelfOther + TrlBin:BhvEcc + Valence:SelfOther + Valence:BhvEcc + SelfOther:BhvEcc + (Valence|Sessn) + (SelfOther|Sessn) + (1|M1)';
mdl3t2k = fitglme(tbl,modelspec3t2k,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2k,dispersion_3t2k,stats_3t2k] = covarianceParameters(mdl3t2k); % To  compute and display confidence intervals for the random effects parameters 

modelspec3t2l = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + TrlBin:Valence:BhvEcc + TrlBin:SelfOther:BhvEcc + TrlBin:Valence + TrlBin:SelfOther + TrlBin:BhvEcc + Valence:SelfOther + Valence:BhvEcc + SelfOther:BhvEcc + (SelfOther|Sessn) + (1|M1)';
mdl3t2l = fitglme(tbl,modelspec3t2l,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2l,dispersion_3t2l,stats_3t2l] = covarianceParameters(mdl3t2l); % To  compute and display confidence intervals for the random effects parameters 

modelspec3t2m = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + TrlBin:Valence:BhvEcc + TrlBin:SelfOther:BhvEcc + TrlBin:Valence + TrlBin:SelfOther + TrlBin:BhvEcc + Valence:SelfOther + Valence:BhvEcc + SelfOther:BhvEcc + (1|Sessn) + (SelfOther|M1)';
mdl3t2m = fitglme(tbl,modelspec3t2m,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2m,dispersion_3t2m,stats_3t2m] = covarianceParameters(mdl3t2m); % To  compute and display confidence intervals for the random effects parameters 

modelspec3t2n = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + TrlBin:Valence:BhvEcc + TrlBin:SelfOther:BhvEcc + TrlBin:Valence + TrlBin:SelfOther + TrlBin:BhvEcc + Valence:SelfOther + Valence:BhvEcc + SelfOther:BhvEcc + (Valence|Sessn) + (1|M1)';
mdl3t2n = fitglme(tbl,modelspec3t2n,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2n,dispersion_3t2n,stats_3t2n] = covarianceParameters(mdl3t2n); % To  compute and display confidence intervals for the random effects parameters 

modelspec3t2o = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + TrlBin:Valence:BhvEcc + TrlBin:SelfOther:BhvEcc + TrlBin:Valence + TrlBin:SelfOther + TrlBin:BhvEcc + Valence:SelfOther + Valence:BhvEcc + SelfOther:BhvEcc + (1|Sessn) + (Valence|M1)';
mdl3t2o = fitglme(tbl,modelspec3t2o,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2o,dispersion_3t2o,stats_3t2o] = covarianceParameters(mdl3t2o); % To  compute and display confidence intervals for the random effects parameters 

modelspec3t2p = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + TrlBin:Valence:BhvEcc + TrlBin:SelfOther:BhvEcc + TrlBin:Valence + TrlBin:SelfOther + TrlBin:BhvEcc + Valence:SelfOther + Valence:BhvEcc + SelfOther:BhvEcc + (BhvEcc|Sessn) + (1|M1)';
mdl3t2p = fitglme(tbl,modelspec3t2p,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2p,dispersion_3t2p,stats_3t2p] = covarianceParameters(mdl3t2p); % To  compute and display confidence intervals for the random effects parameters 

modelspec3t2q = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + TrlBin:Valence:BhvEcc + TrlBin:SelfOther:BhvEcc + TrlBin:Valence + TrlBin:SelfOther + TrlBin:BhvEcc + Valence:SelfOther + Valence:BhvEcc + SelfOther:BhvEcc + (1|Sessn) + (BhvEcc|M1)';
mdl3t2q = fitglme(tbl,modelspec3t2q,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2q,dispersion_3t2q,stats_3t2q] = covarianceParameters(mdl3t2q); % To  compute and display confidence intervals for the random effects parameters 

modelspec3t2r = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + TrlBin:Valence:BhvEcc + TrlBin:SelfOther:BhvEcc + TrlBin:Valence + TrlBin:SelfOther + TrlBin:BhvEcc + Valence:SelfOther + Valence:BhvEcc + SelfOther:BhvEcc + (BhvEcc|Sessn) + (BhvEcc|M1)';
mdl3t2r = fitglme(tbl,modelspec3t2r,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2r,dispersion_3t2r,stats_3t2r] = covarianceParameters(mdl3t2r); % To  compute and display confidence intervals for the random effects parameters 

modelspec3t2s = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + TrlBin:Valence:BhvEcc + TrlBin:SelfOther:BhvEcc + TrlBin:Valence + TrlBin:SelfOther + TrlBin:BhvEcc + Valence:SelfOther + Valence:BhvEcc + SelfOther:BhvEcc + (BhvEcc|Sessn) + (Valence|M1)';
mdl3t2s = fitglme(tbl,modelspec3t2s,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2s,dispersion_3t2s,stats_3t2s] = covarianceParameters(mdl3t2s); % To  compute and display confidence intervals for the random effects parameters 

modelspec3t2t = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + TrlBin:Valence:BhvEcc + TrlBin:SelfOther:BhvEcc + TrlBin:Valence + TrlBin:SelfOther + TrlBin:BhvEcc + Valence:SelfOther + Valence:BhvEcc + SelfOther:BhvEcc + (BhvEcc|Sessn) + (SelfOther|M1)';
mdl3t2t = fitglme(tbl,modelspec3t2t,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2t,dispersion_3t2t,stats_3t2t] = covarianceParameters(mdl3t2t); % To  compute and display confidence intervals for the random effects parameters 

modelspec3t2u = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + TrlBin:Valence:BhvEcc + TrlBin:SelfOther:BhvEcc + TrlBin:Valence + TrlBin:SelfOther + TrlBin:BhvEcc + Valence:SelfOther + Valence:BhvEcc + SelfOther:BhvEcc + (BhvEcc|Sessn) + (BhvEcc|M1)  + (Valence|M1)';
mdl3t2u = fitglme(tbl,modelspec3t2u,'Distribution','binomial','link','logit','FitMethod','Laplace');
% [psi_3t2u,dispersion_3t2u,stats_3t2u] = covarianceParameters(mdl3t2u); % To  compute and display confidence intervals for the random effects parameters 

modelspec3t2v = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + TrlBin:Valence:BhvEcc + TrlBin:SelfOther:BhvEcc + Valence:SelfOther:BhvEcc + TrlBin:Valence + TrlBin:SelfOther + TrlBin:BhvEcc + Valence:SelfOther + Valence:BhvEcc + SelfOther:BhvEcc + (BhvEcc|Sessn) + (Valence|M1)';
mdl3t2v = fitglme(tbl,modelspec3t2v,'Distribution','binomial','link','logit','FitMethod','Laplace');
[psi_3t2v,dispersion_3t2v,stats_3t2v] = covarianceParameters(mdl3t2v); % To  compute and display confidence intervals for the random effects parameters 

modelspec3t2w = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin:Valence:SelfOther + TrlBin:Valence:BhvEcc + TrlBin:SelfOther:BhvEcc + Valence:SelfOther:BhvEcc + TrlBin:Valence:SelfOther:BhvEcc + TrlBin:Valence + TrlBin:SelfOther + TrlBin:BhvEcc + Valence:SelfOther + Valence:BhvEcc + SelfOther:BhvEcc + (BhvEcc|Sessn) + (Valence|M1)';
mdl3t2w = fitglme(tbl,modelspec3t2w,'Distribution','binomial','link','logit','FitMethod','Laplace');

% % -----SAME AS ------

modelspec4 = 'Attmpt ~ TrlBin + Valence + SelfOther + RwdMag + BhvEcc + TrlBin*Valence*SelfOther + TrlBin*Valence*BhvEcc + TrlBin*SelfOther*BhvEcc + (1|Sessn) + (1|M1)';
mdl4 = fitglme(tbl,modelspec4,'Distribution','binomial','link','logit','FitMethod','Laplace');


% % results_so_far = [results_0_3c;results_0_3d;results_0_3d;results_0_3e;results_0_3f;results_0_3g;results_0_3h;results_0_3i;results_0_3j;results_0_3k;results_3i_3l;results_3i_3l2;results_3i_3m;results_3i_3m2;results_3i_3n;results_3i_3n2;results_3i_3o;results_3i_3o2;results_3i_3p;results_3i_3p2;results_3i_3q;results_3i_3q2];
% % % ;results_3i_3r;results_3i_3r2;results_3i_3s;results_3i_3s2;results_3i_3t;results_3i_3t2;results_3_3t2;results_3a_3b
% % cellAIC = dataset2cell(results_so_far(:,3));
% % rnd_cellAIC = round(cell2mat(cellAIC(2:end,1)));
% % uniqs_AIC = unique(sort(rnd_cellAIC));
% % diff(uniqs_AIC) 
% % 
% % cellBIC = dataset2cell(results_so_far(:,4));
% % rnd_cellBIC = round(cell2mat(cellBIC(2:end,1)));
% % uniqs_BIC = unique(sort(rnd_cellBIC));
% % diff(uniqs_BIC) 
% % 
% % AICtemp=[];BICtemp=[];
% % for q = 1:5
% %     AICtemp = [AICtemp;find(rnd_cellAIC==uniqs_AIC(q,1))];
% % end
% % for q = 1:5
% %     BICtemp = [BICtemp;find(rnd_cellBIC==uniqs_BIC(q,1))];
% % end
% % 
% % AICtemp = unique(AICtemp);
% % BICtemp = unique(BICtemp);
% % 
% % results_so_far(AICtemp,:)
% % results_so_far(BICtemp,:)

mdl3t2 
mdl3t2s
fin_model=[];
fin_model = mdl3t2v

factorName = fin_model.Coefficients.Name;
betaEst = double(fin_model.Coefficients(:,2));
stderr = double(fin_model.Coefficients(:,3));
pvals = double(fin_model.Coefficients(:,6));

figna = ['BHV-ECC-MixedModel-3-way-MainEffx-',num2str(nargin),'-ssns'];
ha = figure('Name',figna);
bar([2:6],betaEst(2:6,1),'FaceColor',[0.3 0.6 0.6])
hold on
errorbar([2:6],betaEst(2:6,1),stderr(2:6,1),'k.')
ylabel('Estimate from Mixed GLM')
for r = 2:6
    lab = cell2mat(factorName(r,:));
%     text(r-0.3,-0.2,lab)
    if pvals(r,1)<=0.05
        if betaEst(r,1)>=0
        plot(r+0.1,betaEst(r,1)+0.1,'k*')
        text(r-0.3,-0.2,lab)
        else
            plot(r+0.1,betaEst(r,1)-0.1,'k*')
            text(r-0.3,0.2,lab)
        end
    end
end

set(ha,'Position',[520 200 600 550])

snam='pdfPrint';                                                      % The name of your style file (NO extension)
s=hgexport('readstyle',snam);
fnamea = strcat(figna,'.pdf');
s.Format = 'pdf';
hgexport(ha,fnamea,s);

fignb = ['BHV-ECC-MixedModel-2-way-interactns-',num2str(nargin),'-ssns'];
hb = figure('Name',fignb);
bar([7:12],betaEst(7:12,1),'FaceColor',[0.6 0.4 0.5])
hold on
errorbar([7:12],betaEst(7:12,1),stderr(7:12,1),'k.')
ylabel('Estimate from Mixed GLM')
for r = 7:12
    lab = cell2mat(factorName(r,:));
    if rem(r,2)==0
        text(r-0.5,0.3,lab)
    else
        text(r-0.5,0.3,lab)
    end
    if pvals(r,1)<=0.05
        if betaEst(r,1)>=0
            plot(r+0.1,betaEst(r,1)+0.05,'k*')
        else
        plot(r+0.1,betaEst(r,1)-0.05,'k*')
        end
    end
end

set(hb,'Position',[520 200 600 550])

snam='pdfPrint';                                                      % The name of your style file (NO extension)
s=hgexport('readstyle',snam);
fnameb = strcat(fignb,'.pdf');
s.Format = 'pdf';
hgexport(hb,fnameb,s);

fignc = ['tw-BHV-ECC-MixedModel-3-way-interactns-',num2str(nargin),'-ssns'];
hc = figure('Name',fignc);
bar([13:15],betaEst(13:15,1),'FaceColor',[0.2 0.6 0.7])
hold on
errorbar([13:15],betaEst(13:15,1),stderr(13:15,1),'k.')
ylabel('Estimate from Mixed GLM')
for r = 13:15
    lab = cell2mat(factorName(r,:));
    if rem(r,2)==0
        text(r-0.5,0.01,lab)
    else
        text(r-0.5,0.01,lab)
    end
    if pvals(r,1)<=0.05
        plot(r+0.1,betaEst(r,1)+0.01,'k*')
    end
end
snam='pdfPrint';                                                      % The name of your style file (NO extension)
s=hgexport('readstyle',snam);
fnamec = strcat(fignc,'.pdf');
s.Format = 'pdf';
hgexport(hc,fnamec,s);
