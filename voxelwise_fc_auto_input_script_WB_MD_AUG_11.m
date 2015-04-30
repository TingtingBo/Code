%% Voxelwise Resting/Residual Functional Connectivity Script
% This script computes correlations between seed
% ROIs and every other voxel in the brain, and saves first-level
% z-statistic and r-statistic images. This script uses marsbar
% function getmarsy.m to extract ROI roi timecourses. 
% Joseph Griffis 2014
%% Set paths and directories/Initialize Marsbar
clc
clear all
restoredefaultpath; % Restore matlab default path
addpath(genpath('/media/store2/MATLAB/toolbox/spm8/')); % Path to SPM
addpath('/media/store3/Projects/Wess/subjects/SCRIPTS');
spm('Defaults','fMRI');
addpath(genpath('/home/burgewk/Desktop/marsbar-0.42')) % Path to marsbar
marsbar('on'); 
addpath('/media/storage/Projects/Joe/Toolbox/residual_connect');
addpath(genpath('/home/rodolphe/toolbox/matlab_nifti/')); % Path to nifti toolbox (for load_nii and save_nii functions
save_path='/media/store3/Projects/Wess/subjects/Whole_Brain_MD/';
data_path = '/media/store3/Projects/Rodolphe/Macular/A/Predata/Resting-state';
seed_path = '/media/store4/Projects/Richard/WesVisionConnectivity/StructuralROI';
mask_path = '/media/store3/Projects/Rodolphe/Macular/A/Postdata/SPM/Mixed_1stlvl';
%seed_rois = {'wCS1' 'wCS2' 'wCS3' 'wCS4' 'wCS5' 'wCS6' 'wCS7' 'wLIPFV1' 'wLIPFV2' 'wLIPFV3' 'wLIPFV4'};
seed_dir = {'MAC_DE_08' 'MAC_DE_09' 'MAC_DE_011' 'MAC_DE_013' 'MAC_DE_016' 'MAC_DE_018' 'MAC_DE_019' 'MAC_DE_024' 'MAC_DE_025' 'MAC_DE_026''MAC_CON_08' 'MAC_CON_09' 'MAC_CON_011' 'MAC_CON_013' 'MAC_CON_016' 'MAC_CON_018' 'MAC_CON_019' 'MAC_CON_024' 'MAC_CON_025' 'MAC_CON_026'};
%roi_names = seed_rois; 
denoised_vol = {'swraMacDe_RestingState1_denoised.nii'}; % Resting/Residual volumes
denoised_vol2 = {'swraMacDe_RestingState2_denoised.nii'}; % Resting/Residual volumes
names = {'test'}; % name to append as suffix to output files
num_to_suppress = 4; % Number of images to suppress at the beginning of each run

% Get subject list
cd(data_path);
%subjects = {'MAC_CON_08' 'MAC_CON_09' 'MAC_CON_011' 'MAC_CON_013' 'MAC_CON_016' 'MAC_CON_018' 'MAC_CON_019' 'MAC_CON_024' 'MAC_CON_025' 'MAC_CON_026'}; 
subjects = {'MAC_DE_08' 'MAC_DE_09' 'MAC_DE_011' 'MAC_DE_013' 'MAC_DE_016' 'MAC_DE_018' 'MAC_DE_019' 'MAC_DE_024' 'MAC_DE_025' 'MAC_DE_026' 'MAC_CON_08' 'MAC_CON_09' 'MAC_CON_011' 'MAC_CON_013' 'MAC_CON_016' 'MAC_CON_018' 'MAC_CON_019' 'MAC_CON_024' 'MAC_CON_025' 'MAC_CON_026'};

%% Loop through subjects 
for i = 13:length(subjects);
    
    subject = subjects{i};
    cfg.subject = subject;
    subject_struct = subjects{i}; % For freesurfer ROIs where .ct is appended to subject foldr
    
    cfg.seed_path = fullfile(seed_path); % path containing ROI files for subject
    cfg.seed_dir = seed_dir;
    cfg.seed_rois = {['r' subject '.2_RH_V1.label_roi'] };
    cfg.mask_path = fullfile(mask_path, subject, 'mask.img'); % path to subject mask
    cfg.data_path = fullfile(data_path, subject, 'MacDe_RestingState1');
    cfg.data_path2 = fullfile(data_path, subject, 'MacDe_RestingState2');
    cfg.save_path = fullfile(save_path);
    cfg.roi_names = cfg.seed_rois;
    cfg.suppress = num_to_suppress;
    % Loop through volumes 
    for j = 1:length(denoised_vol)
        
        cfg.denoised_vol = denoised_vol{j};
        cfg.names = names{j};
        
        util_voxelwise_fc_auto_tempwb(cfg);
        
    end
end
        



