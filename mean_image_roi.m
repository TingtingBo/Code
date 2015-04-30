%% mean_image_mask
% Makes masked z-map images. 
% Joseph Griffis 2014


clc
clear all
restoredefaultpath; % Restore matlab default path
addpath('/media/store2/MATLAB/toolbox/lab/eeg_toolbox_v1_3_2/stats');
addpath(genpath('/home/rodolphe/toolbox/matlab_nifti/'));  % Add nifti to matlab path (for load_nii and save_nii functions)
path_correl_con = '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_con/rest_block'; % Path to load correlation images
path_save = '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_con';
cd(path_correl_con);
file_list_r = dir('*2_LH_V1.label_roi.img');
file_list_l = dir('*2_RH_V1.label_roi.img');

name = 'roi2_rest_block';

for i=1:length(file_list_r)
    lanes_img_l =[];
    lanes_img_r = [];
    lanes_img_mean = [];
    temp = [];
    temp_l = [];
    temp_r = [];
    cd(path_correl_con);
    myfile_l = file_list_l(i).name;
    myfile_r = file_list_r(i).name;
    temp_l = load_nii(myfile_l);
    temp_r = load_nii(myfile_r);
    temp = temp_l;
    lanes_img_l = temp_l.img;    
    lanes_img_r = temp_r.img;
    lanes_img_both(:,:,:,1) = lanes_img_l;
    lanes_img_both(:,:,:,2) = lanes_img_r;
    lanes_img_mean = nanmean(lanes_img_both,4);
    cd(path_save);
    temp.img = lanes_img_mean;
    save_nii(temp, strcat(file_list_r(i).name(1:20), 'mean_', name));
    
end


