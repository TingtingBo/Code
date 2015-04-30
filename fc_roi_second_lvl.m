% Computes average connectivity matrices, thresholds them to only contain 
% significant correlations, and allows for comparisons across conditions.
% Calls functions fc_mat_fun.m and fc_mat_thresh_fun.m
% Joseph Griffis 2014

clear all 
clc
addpath('/media/store2/MATLAB/toolbox/lab/eeg_toolbox_v1_3_2/stats');
addpath(genpath('/media/store3/Projects/Joe/LANES_FMRI/A/FMRI_Scripts'));
addpath(genpath('/media/store4/Projects/Richard'));

data_dir = fullfile('/media/store3/Projects/Joe/LANES_FMRI/A/LANES_FC_Dosenbach_V1/Connectivity_Profiles');

cd(data_dir);
load('list');
subjects = dir('EEG*');
profile_struct = {'profileRB' 'profileRS' 'profileVR' 'profileAB'};

con_mat = fc_mat_fun(data_dir, subjects, profile_struct);

fdr_on = 1;
p_val = 0.05;

con_mat = fc_mat_thresh_fun(con_mat, fdr_on, p_val);
%% Compute difference matrices and threshold them to only contain significant 
% differences. Calls function fc_dif_mat_fun.m

con_mat1 = con_mat(3);
con_mat2 = con_mat(4);


fdr_on = 0;
p_val = 0.05;
columns = [];
direction = 'right';
con_dif_mat = fc_dif_mat_fun(con_mat1, con_mat2, direction, fdr_on, p_val, columns);

%% Plot correlagrams 

condition = con_dif_mat.t_score;

all_max = max(condition);
all_min = min(condition);
h = figure;
imagesc(condition); 
title(['VB Profile']);
caxis([2.6 5])
set(gca,'XTick',1:length(list))
set(gca,'XTickLabel',list(1:length(list)))
set(gca,'YTick', 1:length(list))
set(gca,'YTickLabel',list(1:length(list)))
set(gca, 'FontSize', 6)

axis square
box on
rotateXLabels(gca,90);
set(h, 'position', [0 0 1100 1100 ])

%%

data = con_dif_1;
[R C N] = size(data);
perm_data = reshape(data, N, R*C);

[pval, t_orig, crit_t, est_alpha, seed_state] = mult_comp_perm_t1(perm_data, 15000,1,0.05);
