clc
clear all
restoredefaultpath; % Restore matlab default path
addpath('/media/store2/MATLAB/toolbox/lab/eeg_toolbox_v1_3_2/stats');
addpath(genpath('/home/rodolphe/toolbox/matlab_nifti/'));  % Add nifti to matlab path (for load_nii and save_nii functions)
path_correl_con = '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_md'; % Path to load correlation images
path_correl_con2 = '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_md'; % path to load correlation images
path_correl = '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_md/Difference_Images_MD';
%path_subj = '/media/storage/Projects/Joe/Task_Residuals';
%cd(path_subj);
%subjects = dir('EEG*');
%subjects = {'MAC_CON_08' 'MAC_CON_09' 'MAC_CON_011' 'MAC_CON_013' 'MAC_CON_016' 'MAC_CON_018' 'MAC_CON_024' 'MAC_CON_025'};
subjects = {'MAC_DE_08' 'MAC_DE_09' 'MAC_DE_011' 'MAC_DE_013' 'MAC_DE_016' 'MAC_DE_018' 'MAC_DE_024' 'MAC_DE_025'};
n_rois = 1;
suffix = {'.2_RH_V1.label_roi' '.5_RH_V1.label_roi'};
names = {'difftest'};
for j= 1:n_rois
num_img=num2str(j);
num_img2 = num2str(j);
for i=1:length(subjects)
cd(fullfile(path_correl_con));
myfile = strcat('ZCorrel_',subjects{i}, '_','task_r',subjects{i}, suffix{1}, '.img');
temp = load_nii(myfile);
lanes_img_1 = temp.img;
cd(fullfile(path_correl_con2));
myfile2 = strcat('ZCorrel_',subjects{i}, '_','task_r',subjects{i}, suffix{2}, '.img');
temp2 = load_nii(myfile2);
lanes_img_2 = temp2.img;
dif_img = lanes_img_1 - lanes_img_2;
temp.img = dif_img;
if isdir(path_correl) == 0
mkdir(path_correl);
end
cd(path_correl);
save_nii(temp, strcat(subjects{i}, '_difference_taskR_', names{j}));
end
end
sprintf('Finished creating difference images')
addpath '/media/store3/Projects/Joe/LANES_FMRI/A/xjview'
addpath(genpath('/media/store2/MATLAB/toolbox/spm8/'));