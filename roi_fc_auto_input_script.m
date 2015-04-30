%% Input script for util_roi_fc_auto
% Joseph Griffis 2014

clc 
clear all

addpath(genpath('/home/abdurahman/Desktop/marsbar-0.42/'))
spm('defaults', 'fmri')
marsbar on
addpath(genpath('/media/store4/Projects/Elkhetali/LOAf/A/Connect/Risiduals'))
addpath('/media/storage/Projects/Joe/Toolbox/residual_connect');
save_path='/media/store3/Projects/Joe/LOAF_Vision_FC/Connectivity_Profiles';
data_path = '/media/store3/Projects/Joe/LOAF_Vision_FC/LOAF/Task_Residuals';
seed_path = {'/media/store4/Projects/Richard/WesVisionConnectivity/StructuralROI' ...
    '/media/store3/Projects/Joe/LANES_FMRI/A/LANES_FC_Dosenbach_V1'};
seed_prefix = {'r*' '*roi'};
seed_folder = {'Dosenbach_Network_ROI'};
denoised_images = {'Denoised_VB.nii' 'Denoised_AB.nii'};
names = {'VB' 'AB'};
cd(data_path);
subjects = dir('LOAF*');

for i = 14:length(subjects);
    cfg.seed_prefix = seed_prefix;
    for k = 1:length(seed_prefix)
        if k == 1 
            cfg.seed_path{k} = fullfile(seed_path{k}, subjects(i).name(1:length(subjects(i).name)-6));
        else
            cfg.seed_path{k} = fullfile(seed_path{k}, seed_folder{1});
        end
    end
    cfg.data_path = fullfile(data_path, subjects(i).name);
    cfg.save_path = fullfile(save_path,subjects(i).name);
    for j = 1:length(denoised_images)
        
        cfg.subject_vol = denoised_images{j};
        cfg.name = names{j};
        
        util_roi_fc_auto(cfg);
    end
end
        



