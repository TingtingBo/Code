% code to check for PRL specific effects
% go to each text file folder, create new folder with only the subjects of
% interest. Then, run one of the test lines, the for loop, and save the
% corresponding output (ie test upp with storeupp)

test = dir('*_Upp_V1.label.out')
test = dir('*_depth_V1.label.out')
test = dir('*_low_V1.label.out')

for i = 1:length(test)
    
    fid = fopen(test(i).name);
    
    CT_DATA = textscan(fid, '%s%s%s%s%s%s%s%s%s%s%s%s%s','Headerlines', 1,'EmptyValue', NaN,'CommentStyle','*');
    
    fclose(fid);
    
    %data of interest
    tempctstring = CT_DATA{1,5}(52);
    tempctstdstring = CT_DATA{1,7}(52);
    
    %convert 2 number
    ctnum = str2num(tempctstring{1});
    ctstdnum = str2num(tempctstdstring{1});
    storedata(i) = ctnum;
    storecurv(i) = ctstdnum;
    storefile{i} = test(i).name;
    
    
end



storedepth(:,1) = storedata(1:9)
storedepth(:,2) = storedata(10:18)
storedepth(:,3) = storedata(19:27)
storedepth(:,4) = storedata(28:36)
storedepth(:,5) = storedata(37:45)


storelower(:,1) = storedata(1:9)
storelower(:,2) = storedata(10:18)
storelower(:,3) = storedata(19:27)
storelower(:,4) = storedata(28:36)
storelower(:,5) = storedata(37:45)

storeupp(:,1) = storedata(1:9)
storeupp(:,2) = storedata(10:18)
storeupp(:,3) = storedata(19:27)
storeupp(:,4) = storedata(28:36)
storeupp(:,5) = storedata(37:45)



Con_depth = [Con_storedepthL, Con_storedepthR];
Con_upper = [Con_storeuppL, Con_storeuppR];
Con_lower = [Con_storelowerL, Con_storelowerR];

MD_depth = [MD_storedepth_L, MD_storedepth_R];
MD_upper = [MD_storeupp_L, MD_storeupp_R];
MD_lower = [MD_storelower_L, MD_storelower_R];

MDDO2 = (MD_storedepth_L +MD_storedepth_R)/2;
MDUO2 = (MD_storeupp_L +MD_storeupp_R)/2;
MDLO2 = (MD_storelower_L +MD_storelower_R)/2;

MDDiff = MD_upper - MD_lower;
ConDiff = Con_upper -Con_lower;

MDDiff2 = MD_storedepth_L_T - MD_storedepth_R_T;
ConDiff2 = Con_storedepth_L_T - Con_storedepth_R_T;

mdstoredifftotal = [MDDiff, MDDiff2]
constoredifftotal = [ConDiff, ConDiff2]

%%
p12_5 = MDUO2(4,:) - MDLO2(4,:);
p12_6 = MDUO2(5,:) - MDLO2(5,:);
p12_5_D = MD_storedepth_L(4,:) - MD_storedepth_R(4,:);
p12_6_D = MD_storedepth_L(5,:) - MD_storedepth_R(5,:);


%%
data = data';
[nconditions nsubject] = size(data)

MeanSubtractedData=data-repmat(mean(data,1),nconditions,1);

withinSubjectStandardError=std(MeanSubtractedData,0,2)/sqrt(nsubject);


figure

bar(mean(data'))
hold on
errorbar(mean(data'), withinSubjectStandardError)


sem=std(data')/sqrt(length(data'))
errorbar(mean(data'), sem)
hold on
%% Scotoma size taken into effect
% subject numbering vert prl = 16,19,24,25,8 temp prl = 11,13
% this equates to ROI 6,6,5,5,5, temp = 5,6
% non prl =  9, 18, 26



MDDO2 = (MD_storedepth_L +MD_storedepth_R)/2;
MDUO2 = (MD_storeupp_L +MD_storeupp_R)/2;
%MDLO2 = (MD_storelower_L +MD_storelower_R)/2;

MDCDO2 = (Con_storedepthL +Con_storedepthR)/2;
MDCUO2 = (Con_storeuppL +Con_storeuppR)/2;
MDCLO2 = (Con_storelowerL +Con_storelowerR)/2;
%
p12_5 = MDUO2(4,:) - MDLO2(4,:);
p12_6 = MDUO2(5,:) - MDLO2(5,:);
p12_5_D = MD_storedepth_L_T(4,:) - MD_storedepth_R_T(4,:);
p12_6_D = MD_storedepth_L_T(5,:) - MD_storedepth_R_T(5,:);

pc12_5 = MDUO2(5,:) - MDLO2(4,:);
pc12_6 = MDUO2(6,:) - MDLO2(5,:);
pc12_5_D = MD_storedepth_L(4,:) - MD_storedepth_R(4,:);
pc12_6_D = C_storedepthL(5,:) - MD_storedepth_R(5,:);


Scotoma_diff(:,1) = p12_5(1);
Scotoma_diff(:,2) = p12_5(2);
Scotoma_diff(:,3) = p12_5(3);
Scotoma_diff(:,4) = p12_5(4);
Scotoma_diff(:,5) = p12_5(5);
Scotoma_diff(:,6) = p12_5_D(1);
Scotoma_diff(:,7) = p12_6_D(2);


%% Sctoma end vs previous ROI

p12_5 = MDUO2(5,:) - MDLO2(4,:);
p12_6 = MDUO2(6,:) - MDLO2(5,:);
p12_5_D = MD_storedepth_L_T(5,:) - MD_storedepth_R_T(4,:);
p12_6_D = MD_storedepth_L_T(6,:) - MD_storedepth_R_T(5,:);

%% Scotoma end vs next ROI
p12_5 = MDUO2(5,:) - MDLO2(6,:);
p12_6 = MDUO2(6,:) - MDLO2(7,:);
p12_5_D = MD_storedepth_L_T(5,:) - MD_storedepth_R_T(6,:);
p12_6_D = MD_storedepth_L_T(6,:) - MD_storedepth_R_T(7,:);

%% Non PRL specific change

load('MD_RH_LH_1to9.mat')
load('MDcon_RH_LH_1to9.mat')

% sub numbers 11,13,16,18,19,24,25,26,08,09
% corresponds to: 5,6,6,6,6,5,5,6,5,5
% for md participants = 
Scotoma_diff(:,1) = mdover2(1,4);
Scotoma_diff(:,2) = mdover2(2,5);
Scotoma_diff(:,3) = mdover2(3,5);
Scotoma_diff(:,4) = mdover2(4,5);
Scotoma_diff(:,5) = mdover2(5,5);
Scotoma_diff(:,6) = mdover2(6,4);
Scotoma_diff(:,7) = mdover2(7,4);
Scotoma_diff(:,8) = mdover2(8,5);
Scotoma_diff(:,9) = mdover2(9,4);
Scotoma_diff(:,10) = mdover2(10,4);
%control group
ScotomaC_diff(:,1) = mdconover2(1,4);
ScotomaC_diff(:,2) = mdconover2(2,5);
ScotomaC_diff(:,3) = mdconover2(3,5);
ScotomaC_diff(:,4) = mdconover2(4,5);
ScotomaC_diff(:,5) = mdconover2(5,5);
ScotomaC_diff(:,6) = mdconover2(6,4);
ScotomaC_diff(:,7) = mdconover2(7,4);
ScotomaC_diff(:,8) = mdconover2(8,5);
ScotomaC_diff(:,9) = mdconover2(9,4);
ScotomaC_diff(:,10) = mdconover2(10,4);

[h,p,ci,stats] = ttest2(Scotoma_diff,ScotomaC_diff)

data(1,:) = Scotoma_diff - ScotomaC_diff;
data(2,:) = Scotoma_diff - ScotomaC_diff;
data(3,:) = Scotoma_diff - ScotomaC_diff;

% non prl v prl participants
% sub numbers 11,13,16,18,19,24,25,26,08,09
% non prl =  9, 18, 26
ScotomaPRL_diff(:,1) = mdover2(1,3:8);
ScotomaPRL_diff(:,2) = mdover2(2,3:8);
ScotomaPRL_diff(:,3) = mdover2(3,3:8);
ScotomaPRL_diff(:,4) = mdover2(5,3:8);
ScotomaPRL_diff(:,5) = mdover2(6,3:8);
ScotomaPRL_diff(:,6) = mdover2(7,3:8);
ScotomaPRL_diff(:,7) = mdover2(9,3:8);

%control group
ScotomaCPRL_diff(:,1) = mdconover2(1,3:8);
ScotomaCPRL_diff(:,2) = mdconover2(2,3:8);
ScotomaCPRL_diff(:,3) = mdconover2(3,3:8);
ScotomaCPRL_diff(:,4) = mdconover2(5,3:8);
ScotomaCPRL_diff(:,5) = mdconover2(6,3:8);
ScotomaCPRL_diff(:,6) = mdconover2(7,3:8);
ScotomaCPRL_diff(:,7) = mdconover2(9,3:8);

ScotomaNOPRL_diff(:,1) = mdover2(4,3:8);
ScotomaNOPRL_diff(:,2) = mdover2(8,3:8);
ScotomaNOPRL_diff(:,3) = mdover2(10,3:8);

ScotomaCNOPRL_diff(:,1) = mdconover2(4,3:8);
ScotomaCNOPRL_diff(:,2) = mdconover2(8,3:8);
ScotomaCNOPRL_diff(:,3) = mdconover2(10,3:8);

clear data
data(:,:) = ScotomaPRL_diff - ScotomaCPRL_diff;
data2(:,:) = ScotomaNOPRL_diff - ScotomaCNOPRL_diff;


%% PRL subs by border
% sub numbers 11,13,16,18,19,24,25,26,08,09
% PRL subs numbering vert prl = 16,19,24,25,8 temp prl = 11,13
% this equates to ROI 6,6,5,5,5, temp = 5,6

ScotomaPRL_diff(:,1) = mdover2(1,2:8);
ScotomaPRL_diff(:,2) = mdover2(2,3:9);
ScotomaPRL_diff(:,3) = mdover2(3,3:9);
ScotomaPRL_diff(:,4) = mdover2(4,3:9);
ScotomaPRL_diff(:,5) = mdover2(5,3:9);
ScotomaPRL_diff(:,6) = mdover2(6,2:8);
ScotomaPRL_diff(:,7) = mdover2(7,2:8);
ScotomaPRL_diff(:,8) = mdover2(8,3:9);
ScotomaPRL_diff(:,9) = mdover2(9,2:8);
ScotomaPRL_diff(:,10) = mdover2(10,2:8);

ScotomaCPRL_diff(:,1) = mdconover2(1,2:8);
ScotomaCPRL_diff(:,2) = mdconover2(2,3:9);
ScotomaCPRL_diff(:,3) = mdconover2(3,3:9);
ScotomaCPRL_diff(:,4) = mdconover2(4,3:9);
ScotomaCPRL_diff(:,5) = mdconover2(5,3:9);
ScotomaCPRL_diff(:,6) = mdconover2(6,2:8);
ScotomaCPRL_diff(:,7) = mdconover2(7,2:8);
ScotomaCPRL_diff(:,8) = mdconover2(8,3:9);
ScotomaCPRL_diff(:,9) = mdconover2(9,2:8);
ScotomaCPRL_diff(:,10) = mdconover2(10,2:8);

% sub numbers 11,13,16,18,19,24,25,26,08,09
% corresponds to: 5,6,6,6,6,5,5,6,5,5

ScotomaNOPRL_diff(:,1) = mdover2(4,5:7);
ScotomaNOPRL_diff(:,2) = mdover2(8,5:7);
ScotomaNOPRL_diff(:,3) = mdover2(10,4:6);

ScotomaCNOPRL_diff(:,1) = mdconover2(4,5:7);
ScotomaCNOPRL_diff(:,2) = mdconover2(8,5:7);
ScotomaCNOPRL_diff(:,3) = mdconover2(10,4:6);


%% prior ROI
Scotoma_diff(:,1) = mdover2(1,4);
Scotoma_diff(:,2) = mdover2(2,5);
Scotoma_diff(:,3) = mdover2(3,5);
Scotoma_diff(:,4) = mdover2(4,5);
Scotoma_diff(:,5) = mdover2(5,5);
Scotoma_diff(:,6) = mdover2(6,4);
Scotoma_diff(:,7) = mdover2(7,4);
Scotoma_diff(:,8) = mdover2(8,5);
Scotoma_diff(:,9) = mdover2(9,4);
Scotoma_diff(:,10) = mdover2(10,4);
%control group
ScotomaC_diff(:,1) = mdconover2(1,4);
ScotomaC_diff(:,2) = mdconover2(2,5);
ScotomaC_diff(:,3) = mdconover2(3,5);
ScotomaC_diff(:,4) = mdconover2(4,5);
ScotomaC_diff(:,5) = mdconover2(5,5);
ScotomaC_diff(:,6) = mdconover2(6,4);
ScotomaC_diff(:,7) = mdconover2(7,4);
ScotomaC_diff(:,8) = mdconover2(8,5);
ScotomaC_diff(:,9) = mdconover2(9,4);
ScotomaC_diff(:,10) = mdconover2(10,4);

[h,p,ci,stats] = ttest2(Scotoma_diff,ScotomaC_diff)

%% Next ROI
Scotoma_diff(:,1) = mdover2(1,6);
Scotoma_diff(:,2) = mdover2(2,7);
Scotoma_diff(:,3) = mdover2(3,7);
Scotoma_diff(:,4) = mdover2(4,7);
Scotoma_diff(:,5) = mdover2(5,7);
Scotoma_diff(:,6) = mdover2(6,6);
Scotoma_diff(:,7) = mdover2(7,6);
Scotoma_diff(:,8) = mdover2(8,7);
Scotoma_diff(:,9) = mdover2(9,6);
Scotoma_diff(:,10) = mdover2(10,6);
%control group
ScotomaC_diff(:,1) = mdconover2(1,6);
ScotomaC_diff(:,2) = mdconover2(2,7);
ScotomaC_diff(:,3) = mdconover2(3,7);
ScotomaC_diff(:,4) = mdconover2(4,7);
ScotomaC_diff(:,5) = mdconover2(5,7);
ScotomaC_diff(:,6) = mdconover2(6,6);
ScotomaC_diff(:,7) = mdconover2(7,6);
ScotomaC_diff(:,8) = mdconover2(8,7);
ScotomaC_diff(:,9) = mdconover2(9,6);
ScotomaC_diff(:,10) = mdconover2(10,6);

[h,p,ci,stats] = ttest2(Scotoma_diff,ScotomaC_diff)

%% difference in LPZ?


Scotoma_diff(:,1) = (mdover2(1,2) +mdover2(1,3))/2;
Scotoma_diff(:,2) = (mdover2(2,2) +mdover2(2,3) + mdover2(2,4))/3;
Scotoma_diff(:,3) = (mdover2(3,2) +mdover2(3,3) + mdover2(3,4))/3;
Scotoma_diff(:,4) = (mdover2(4,2) +mdover2(4,3) + mdover2(4,4))/3;
Scotoma_diff(:,5) = (mdover2(5,2) +mdover2(5,3) + mdover2(5,4))/3;
Scotoma_diff(:,6) = (mdover2(6,2) +mdover2(6,3))/2;
Scotoma_diff(:,7) = (mdover2(7,2) +mdover2(7,3))/2;
Scotoma_diff(:,8) = (mdover2(8,2) +mdover2(8,3) + mdover2(8,4))/3;
Scotoma_diff(:,9) = (mdover2(9,2) +mdover2(9,3))/2;
Scotoma_diff(:,10) = (mdover2(10,2) +mdover2(10,3))/2;
%control group
ScotomaC_diff(:,1) = (mdconover2(1,2) +mdconover2(1,3))/2;
ScotomaC_diff(:,2) = (mdconover2(2,2) +mdconover2(2,3) + mdconover2(2,4))/3;
ScotomaC_diff(:,3) = (mdconover2(3,2) +mdconover2(3,3) + mdconover2(3,4))/3;
ScotomaC_diff(:,4) = (mdconover2(4,2) +mdconover2(4,3) + mdconover2(4,4))/3;
ScotomaC_diff(:,5) = (mdconover2(5,2) +mdconover2(5,3) + mdconover2(5,4))/3;
ScotomaC_diff(:,6) = (mdconover2(6,2) +mdconover2(6,3))/2;
ScotomaC_diff(:,7) = (mdconover2(7,2) +mdconover2(7,3))/2;
ScotomaC_diff(:,8) = (mdconover2(8,2) +mdconover2(8,3) + mdconover2(8,4))/3;
ScotomaC_diff(:,9) = (mdconover2(9,2) +mdconover2(9,3))/2;
ScotomaC_diff(:,10) = (mdconover2(10,2) +mdconover2(10,3))/2;

[h,p,ci,stats] = ttest2(Scotoma_diff,ScotomaC_diff)

%% test for LPZ

[h,p,ci,stats] = ttest2(mdover2(:,1),mdconover2(:,1))
[h,p,ci,stats] = ttest2(mdover2(:,2),mdconover2(:,2))
[h,p,ci,stats] = ttest2(mdover2(:,3),mdconover2(:,3))
[h,p,ci,stats] = ttest2(mdover2(:,4),mdconover2(:,4))
[h,p,ci,stats] = ttest2(mdover2(:,5),mdconover2(:,5))
[h,p,ci,stats] = ttest2(mdover2(:,6),mdconover2(:,6))


%% new graph between 5 and 6 LPZ border group
load('MD_RH_LH_1to9.mat')
load('MDcon_RH_LH_1to9.mat')

Scotoma_diff5(:,1) = mdover2(1,:);
Scotoma_diff5(:,2) = mdover2(6,:);
Scotoma_diff5(:,3) = mdover2(7,:);
Scotoma_diff5(:,4) = mdover2(9,:);
Scotoma_diff5(:,5) = mdover2(10,:);

Scotoma_diff6(:,1) = mdover2(2,:);
Scotoma_diff6(:,2) = mdover2(3,:);
Scotoma_diff6(:,3) = mdover2(4,:);
Scotoma_diff6(:,4) = mdover2(5,:);
Scotoma_diff6(:,5) = mdover2(8,:);

Scotoma_diff5C(:,1) = mdconover2(1,:);
Scotoma_diff5C(:,2) = mdconover2(6,:);
Scotoma_diff5C(:,3) = mdconover2(7,:);
Scotoma_diff5C(:,4) = mdconover2(9,:);
Scotoma_diff5C(:,5) = mdconover2(10,:);

Scotoma_diff6C(:,1) = mdconover2(2,:);
Scotoma_diff6C(:,2) = mdconover2(3,:);
Scotoma_diff6C(:,3) = mdconover2(4,:);
Scotoma_diff6C(:,4) = mdconover2(5,:);
Scotoma_diff6C(:,5) = mdconover2(8,:);

store5diff = Scotoma_diff5-Scotoma_diff5C;
store6diff = Scotoma_diff6-Scotoma_diff6C;
% find mean of all controls
storecon_mean = (mean(Scotoma_diff5C') + mean(Scotoma_diff6C'))/2

Scotoma_diff5mMean(1,:) = Scotoma_diff5(:,1)'-storecon_mean;
Scotoma_diff5mMean(2,:) = Scotoma_diff5(:,2)'-storecon_mean;
Scotoma_diff5mMean(3,:) = Scotoma_diff5(:,3)'-storecon_mean;
Scotoma_diff5mMean(4,:) = Scotoma_diff5(:,4)'-storecon_mean;
Scotoma_diff5mMean(5,:) = Scotoma_diff5(:,5)'-storecon_mean;

Scotoma_diff6mMean(1,:) = Scotoma_diff6(:,1)'-storecon_mean;
Scotoma_diff6mMean(2,:) = Scotoma_diff6(:,2)'-storecon_mean;
Scotoma_diff6mMean(3,:) = Scotoma_diff6(:,3)'-storecon_mean;
Scotoma_diff6mMean(4,:) = Scotoma_diff6(:,4)'-storecon_mean;
Scotoma_diff6mMean(5,:) = Scotoma_diff6(:,5)'-storecon_mean;


data = data'
[nconditions nsubject] = size(data)
figure
sem=std(data')/sqrt(length(data'))
errorbar(mean(data'), sem)
hold on
data = store6diff
sem=std(data')/sqrt(length(data'))
errorbar(mean(data'), sem)
%% Peak wall sulcus

load('MD_CON_PWS.mat')
load('MD_PWS.mat')
% md subs
MDPO2 = (MDPL1 + MDPR1)/2;
MDWO2 = (MDWL1 + MDWR1)/2;
MDSO2 = (MDSL1 + MDSR1)/2;
% con average hemisphers
MDconPO2 = (MDconPL1 + MDconPR1)/2;
MDconWO2 = (MDconWL1 + MDconWR1)/2;
MDconSO2 = (MDconSL1 + MDconSR1)/2;

% Peak
Scotoma_diff(:,1) = MDPO2(1,2:8);
Scotoma_diff(:,2) = MDPO2(2,3:9);
Scotoma_diff(:,3) = MDPO2(3,3:9);
Scotoma_diff(:,4) = MDPO2(4,3:9);
Scotoma_diff(:,5) = MDPO2(5,3:9);
Scotoma_diff(:,6) = MDPO2(6,2:8);
Scotoma_diff(:,7) = MDPO2(7,2:8);
Scotoma_diff(:,8) = MDPO2(8,3:9);
Scotoma_diff(:,9) = MDPO2(9,2:8);
Scotoma_diff(:,10) = MDPO2(10,2:8);

ScotomaC_diff(:,1) = MDconPO2(1,2:8);
ScotomaC_diff(:,2) = MDconPO2(2,3:9);
ScotomaC_diff(:,3) = MDconPO2(3,3:9);
ScotomaC_diff(:,4) = MDconPO2(4,3:9);
ScotomaC_diff(:,5) = MDconPO2(5,3:9);
ScotomaC_diff(:,6) = MDconPO2(6,2:8);
ScotomaC_diff(:,7) = MDconPO2(7,2:8);
ScotomaC_diff(:,8) = MDconPO2(8,3:9);
ScotomaC_diff(:,9) = MDconPO2(9,2:8);
ScotomaC_diff(:,10) = MDconPO2(10,2:8);
% Wall
Scotoma_diff(:,1) = MDWO2(1,2:8);
Scotoma_diff(:,2) = MDWO2(2,3:9);
Scotoma_diff(:,3) = MDWO2(3,3:9);
Scotoma_diff(:,4) = MDWO2(4,3:9);
Scotoma_diff(:,5) = MDWO2(5,3:9);
Scotoma_diff(:,6) = MDWO2(6,2:8);
Scotoma_diff(:,7) = MDWO2(7,2:8);
Scotoma_diff(:,8) = MDWO2(8,3:9);
Scotoma_diff(:,9) = MDWO2(9,2:8);
Scotoma_diff(:,10) = MDWO2(10,2:8);

ScotomaC_diff(:,1) = MDconWO2(1,2:8);
ScotomaC_diff(:,2) = MDconWO2(2,3:9);
ScotomaC_diff(:,3) = MDconWO2(3,3:9);
ScotomaC_diff(:,4) = MDconWO2(4,3:9);
ScotomaC_diff(:,5) = MDconWO2(5,3:9);
ScotomaC_diff(:,6) = MDconWO2(6,2:8);
ScotomaC_diff(:,7) = MDconWO2(7,2:8);
ScotomaC_diff(:,8) = MDconWO2(8,3:9);
ScotomaC_diff(:,9) = MDconWO2(9,2:8);
ScotomaC_diff(:,10) = MDconWO2(10,2:8);

% sulc
Scotoma_diff(:,1) = MDSO2(1,2:8);
Scotoma_diff(:,2) = MDSO2(2,3:9);
Scotoma_diff(:,3) = MDSO2(3,3:9);
Scotoma_diff(:,4) = MDSO2(4,3:9);
Scotoma_diff(:,5) = MDSO2(5,3:9);
Scotoma_diff(:,6) = MDSO2(6,2:8);
Scotoma_diff(:,7) = MDSO2(7,2:8);
Scotoma_diff(:,8) = MDSO2(8,3:9);
Scotoma_diff(:,9) = MDSO2(9,2:8);
Scotoma_diff(:,10) = MDSO2(10,2:8);

ScotomaC_diff(:,1) = MDconSO2(1,2:8);
ScotomaC_diff(:,2) = MDconSO2(2,3:9);
ScotomaC_diff(:,3) = MDconSO2(3,3:9);
ScotomaC_diff(:,4) = MDconSO2(4,3:9);
ScotomaC_diff(:,5) = MDconSO2(5,3:9);
ScotomaC_diff(:,6) = MDconSO2(6,2:8);
ScotomaC_diff(:,7) = MDconSO2(7,2:8);
ScotomaC_diff(:,8) = MDconSO2(8,3:9);
ScotomaC_diff(:,9) = MDconSO2(9,2:8);
ScotomaC_diff(:,10) = MDconSO2(10,2:8);

data = [Scotoma_diff(1:5,:)';ScotomaC_diff(1:5,:)']
[matrix] = reformat_BWAOV2_trainedvsUntrained(data);
BWAOV2(matrix)
mixed_between_within_anova(matrix)
