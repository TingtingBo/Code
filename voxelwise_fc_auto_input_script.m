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
spm('Defaults','fMRI');
addpath(genpath('/home/abdurahman/Desktop/marsbar-0.42')) % Path to marsbar
marsbar('on'); 
addpath('/media/storage/Projects/Joe/Toolbox/residual_connect');
addpath(genpath('/home/rodolphe/toolbox/matlab_nifti/')); % Path to nifti toolbox (for load_nii and save_nii functions
save_path='/media/store4/Projects/Joe/LOAF_Vision_FC/';
data_path = '/media/store3/Projects/Joe/LOAF_Vision_FC/Task_Residuals';
seed_path = '/media/store4/Projects/LOAf/A/Structurals';
mask_path = '/media/store4/Projects/Elkhetali/LOAf/A/Connect/ConnectAnalysis';
seed_rois = {'wCS1' 'wCS2' 'wCS3' 'wCS4' 'wCS5' 'wCS6' 'wCS7' 'wLIPFV1' 'wLIPFV2' 'wLIPFV3' 'wLIPFV4'};
seed_dir = {'ExcenROI' 'ExcenROI' 'ExcenROI' 'ExcenROI' 'ExcenROI' 'ExcenROI' 'ExcenROI'  'RetROI' 'RetROI' 'RetROI' 'RetROI'};
roi_names = seed_rois; 
denoised_vol = {'Denoised_VB.nii' 'Denoised_AB.nii'}; % Resting/Residual volumes
names = {'AB' 'VB'}; % name to append as suffix to output files
num_to_suppress = 1; % Number of images to suppress at the beginning of each run

% Get subject list
cd(data_path);
subjects = dir('LOAF*'); 

%% Loop through subjects 
for i = 14:length(subjects);
    
    subject = subjects(i).name;
    cfg.subject = subject;
    subject_struct = [subjects(i).name(1:length(subjects(i).name)-6)]; % For freesurfer ROIs where .ct is appended to subject foldr
    
    cfg.seed_path = fullfile(seed_path,subject_struct); % path containing ROI files for subject
    cfg.seed_dir = seed_dir;
    cfg.seed_rois = seed_rois;
    cfg.mask_path = fullfile(mask_path, subject, 'mask.img'); % path to subject mask
    cfg.data_path = fullfile(data_path, subject);
    cfg.save_path = fullfile(save_path);
    cfg.roi_names = roi_names;
    cfg.suppress = num_to_suppress;
    % Loop through volumes 
    for j = 1:length(denoised_vol)
        
        cfg.denoised_vol = denoised_vol{j};
        cfg.names = names{j};
        
        util_voxelwise_fc_auto_temp2(cfg);
        
    end
end
        



