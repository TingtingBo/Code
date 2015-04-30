%% mean_image_mask
% Makes masked z-map images. 
% Joseph Griffis 2014


clc
clear all
restoredefaultpath; % Restore matlab default path
addpath('/media/store2/MATLAB/toolbox/lab/eeg_toolbox_v1_3_2/stats');
addpath(genpath('/home/rodolphe/toolbox/matlab_nifti/'));  % Add nifti to matlab path (for load_nii and save_nii functions)
path_correl_con = '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_con/task'; % Path to load correlation images
path_mask = '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_con/SPM_Level2_/Mean_z';
path_save = path_mask;
cd(path_correl_con);
file_list = dir('*2_RH_V1.label_roi.img');
name = '2_RH_CON_task';

lanes_img_1 = [];
for i=1:length(file_list)
    cd(path_correl_con);
    myfile = file_list(i).name;
    temp = load_nii(myfile);
    lanes_img_1(:,:,:,i) = temp.img;    
end

cd(path_save);
lanes_dif_mean = nanmean(lanes_img_1,4);
temp.img = lanes_dif_mean;
save_nii(temp,strcat('mean',name));


%%
% clear all 
% 
% my_img = [];
% my_img = load_nii('meanr_central.img');
% my_mask = load_nii('central_fdr_mask.img');
% 
% mask_img = my_img;
% temp_img = my_img.img.*my_mask.img;
% mask_img.img = temp_img;
% 
% save_nii(mask_img, 'rcentral_mean_masked');
