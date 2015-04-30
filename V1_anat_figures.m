CD('/media/store3/Projects/Wess/subjects/Saved_DOT_MAT_files')

load('mdVoaVya.mat')

load('MDcon_RH_LH_1to9.mat')
 
OAover2 = (ODLV1 + ODRV1)/2;

YAover2 = (YDLV1 + YDRV1)/2;

data = OAover2;
data = YAover2;
data = mdover2;
 
data = data';
[nconditions nsubject] = size(data)
figure

% error bar line graph standard error of the mean
sem=std(data')/sqrt(length(data'))
errorbar(mean(data'), sem)
hold on


% stats area, reformat data for a repeated measures anova and the perform
% it

[matrix] = reformat_RMAOV1(data)
RMAOV1(matrix)


%[h,p,ci,stats] = ttest2(combinedMD(:,1), combinedMDCon(:,1))

%% Peak Wall Sulc

cd('/media/store3/Projects/Wess/subjects/Saved_DOT_MAT_files')

load('PWSRHLHOAYA.mat') %load data


OAPover2 = (OPL1 + OPR1)/2;
OAWover2 = (OWL1 + OWR1)/2;
OASover2 = (OSL1 + OSR1)/2;
YAPover2 = (YPL1 + YPR1)/2;
YAWover2 = (YWL1 + YWR1)/2;
YASover2 = (YSL1 + YSR1)/2;

 
data = data';
[nconditions nsubject] = size(data)
figure

% error bar line graph standard error of the mean
sem=std(data')/sqrt(length(data'))
errorbar(mean(data'), sem)
hold on


% stats area, reformat data for a repeated measures anova and the perform
% it

[matrix] = reformat_RMAOV1(data)
RMAOV1(matrix)



