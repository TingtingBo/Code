%% LANES_dif_img
% Computes difference images across subjects to be used in 2nd-level SPM
% Contrasts. 
% Joseph Griffis 2014


clc
clear all
restoredefaultpath; % Restore matlab default path
addpath('/media/store2/MATLAB/toolbox/lab/eeg_toolbox_v1_3_2/stats');
addpath(genpath('/home/rodolphe/toolbox/matlab_nifti/'));  % Add nifti to matlab path (for load_nii and save_nii functions)
path_correl_con = '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_con'; % Path to load correlation images
path_correl_con2 = '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_con'; % path to load correlation images
path_correl = '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_con/Diff_images';
%path_subj = '/media/storage/Projects/Joe/Task_Residuals';
%cd(path_subj);
%subjects = dir('EEG*');
subjects = {'MAC_CON_08_t' 'MAC_CON_09_t' 'MAC_CON_011_' 'MAC_CON_013_' 'MAC_CON_016_' 'MAC_CON_018_' 'MAC_CON_024_' 'MAC_CON_025_' 'MAC_CON_019_' 'MAC_CON_026_'}; 
%subjects = {'MAC_DE_08_te' 'MAC_DE_09_te' 'MAC_DE_011_t' 'MAC_DE_013_t' 'MAC_DE_016_t' 'MAC_DE_018_t' 'MAC_DE_024_t' 'MAC_DE_025_t' 'MAC_DE_019_t' 'MAC_DE_026_t'};
n_rois = 1;
suffix = {'mean_roi2' 'mean_roi5'};
names = {'C_Minus_P'};

for j= 1:n_rois
    num_img=num2str(j);
    num_img2 = num2str(j);
    for i=1:length(subjects)
        cd(fullfile(path_correl_con));
        myfile = strcat('ZCorrel_', subjects{i},'mean_roi2', '.img');
        temp = load_nii(myfile);
        lanes_img_1 = temp.img;
        cd(fullfile(path_correl_con2));
        myfile2 = strcat('ZCorrel_', subjects{i}, 'mean_roi5', '.img');
        temp2 = load_nii(myfile2);
        lanes_img_2 = temp2.img;
        dif_img = lanes_img_1 - lanes_img_2;
       
        temp.img = dif_img;
        if isdir(path_correl) == 0
            mkdir(path_correl);
        end
        cd(path_correl);
        save_nii(temp, strcat(subjects{i}, '_averagelhrh_', names{j}));

        
    end

end
   
sprintf('Finished creating difference images')
addpath '/media/store3/Projects/Joe/LANES_FMRI/A/xjview'
addpath(genpath('/media/store2/MATLAB/toolbox/spm8/'));  

