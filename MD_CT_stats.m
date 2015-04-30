addpath(genpath('/media/store2/MATLAB/toolbox/lab'));

load('MDcon_RH_LH_1to9.mat')
data = [mdover2; mdconover2];
[nsubjects nconditions] = size(data);
cd('/media/store3/Projects/Wess/subjects/SCRIPTS');
[matrix] = reformat_BWAOV2_trainedvsUntrained(data);
BWAOV2(matrix, 0.05)

%%
clear 
clc
load('MD_CON_PWS.mat')
load('MD_PWS.mat')

MDPo2 = (MDPL1 + MDPR1)/2;
MDSo2 = (MDSL1 + MDSR1)/2;
MDWo2 = (MDWL1 + MDWR1)/2;

CONPo2 = (MDconPL1 + MDconPR1)/2;
CONSo2 = (MDconSL1 + MDconSR1)/2;
CONWo2 = (MDconWL1 + MDconWR1)/2;

data = [MDPo2; CONPo2];
[matrix] = reformat_BWAOV2_trainedvsUntrained(data);
BWAOV2(matrix, 0.05)
clear data
clear matrix
data = [MDWo2; CONWo2];
[matrix] = reformat_BWAOV2_trainedvsUntrained(data);
BWAOV2(matrix, 0.05)
clear data
clear matrix
data = [MDSo2; CONSo2];
[matrix] = reformat_BWAOV2_trainedvsUntrained(data);
BWAOV2(matrix, 0.05)

%% for KMV grant

mddiff = mdover2(:,2) - mdover2(:,6);

mdcondiff = mdconover2(:,2) - mdconover2(:,6);
%% kmv func con
% run the script func_plot_ROI_MD_con_oct_2.m and put a break at the roi of
% interest in this case 23 which corresponds to mpfc
store2mdr = series_r.all_val{1,36}(:,2);
store2mdl = series_l.all_val{1,36}(:,2);
averagemd2 = (store2mdr + store2mdl) /2;
store6mdr = series_r.all_val{1,36}(:,6);
store6mdl = series_l.all_val{1,36}(:,6);
averagemd6 = (store6mdr + store6mdl) /2;
mddiff = averagemd2 - averagemd6;


store2mdconr = storeconr.all_val{1,36}(:,2);
store2mdconl = storeconl.all_val{1,36}(:,2);
averagemdcon2 = (store2mdconr + store2mdconl) /2;
store6mdconr = storeconr.all_val{1,36}(:,6);
store6mdconl = storeconl.all_val{1,36}(:,6);
averagemdcon6 = (store6mdconr + store6mdconl) /2;
mdcondiff = averagemdcon2 - averagemdcon6;



mean(mddiff)
std(mddiff)
mean(mdcondiff)
std(mdcondiff)

meanMD2 = mean(averagemd2)
stdMD2 = std(averagemd2)
meanMD6 = mean(averagemd6)
stdMD6 = std(averagemd6)



meanMDcon2 = mean(averagemdcon2)
stdMDcon2 = std(averagemdcon2)
meanMDcon6 = mean(averagemdcon6)
stdMDcon6 = std(averagemdcon6)





