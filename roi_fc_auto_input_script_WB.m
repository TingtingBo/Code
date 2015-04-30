%% Input script for util_roi_fc_auto
% Joseph Griffis 2014

clc 
clear all

addpath(genpath('/home/abdurahman/Desktop/marsbar-0.42/'))
addpath('/media/store3/Projects/Wess/subjects/SCRIPTS');
spm('defaults', 'fmri')
marsbar on
addpath(genpath('/media/store4/Projects/Elkhetali/LOAf/A/Connect/Risiduals'))
addpath('/media/storage/Projects/Joe/Toolbox/residual_connect');
save_path='/media/store3/Projects/Wess/subjects/MD_FC_ROI';
data_path = '/media/store3/Projects/Rodolphe/Macular/A/Postdata/Residuals';
seed_path = {'/media/store4/Projects/Richard/WesVisionConnectivity/StructuralROI' ...
    '/media/store3/Projects/Wess/subjects/ROIS_FC'};
seed_prefix = {'r*' 'r*'};
seed_folder = {'label'};
denoised_images = {'Denoised_task'};
names = {'Dbach_PNAS_task'}; %output
cd(data_path);
subjects =  {'MAC_DE_011' 'MAC_DE_013' 'MAC_DE_016' 'MAC_DE_018'  'MAC_DE_024' 'MAC_DE_025'...
 'MAC_DE_08' 'MAC_DE_09'  'MAC_CON_011' 'MAC_CON_013' 'MAC_CON_016' 'MAC_CON_018'... 
 'MAC_CON_024' 'MAC_CON_025' 'MAC_CON_08' 'MAC_CON_09'};


for i = 1:length(subjects);
    cfg.seed_prefix = seed_prefix;
    for k = 1:length(seed_prefix)
        if k == 1
            cfg.seed_path{k} = fullfile(seed_path{k}, subjects{i});
        else
            cfg.seed_path{k} = fullfile(seed_path{k});
        end
    end
    cfg.data_path = fullfile(data_path, subjects{i});
    cfg.save_path = fullfile(save_path,subjects{i});
    cfg.subject_vol = denoised_images{1};
    cfg.name = names{1};
    util_roi_fc_autowb(cfg);
    
end




