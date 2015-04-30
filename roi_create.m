mars_path = '/home/abdurahman/Desktop/marsbar-0.42'; 
addpath(genpath('/media/storage/Projects/Joe/Toolbox'));
roi_dir = '/media/storage/Projects/Joe/LANES_FC_V1/Task_Visual_ROI/ROI_Files';
names = {'L_IOC' 'L_PPC' 'R_IFG'};
radius = 6;
inpoints = {[-42 -78 -10] [-26 -60 50] [-52 10 24]};

util_sphere_roi(roi_dir, inpoints, names, radius, mars_path);

%%

image_dir = '/media/storage/Projects/Joe/Masks'

cd(image_dir);
images = dir('*.nii');

Voxdim = [2 2 2];
BB = [-80 -114 -52; 75 73 82]; %% needed to resize to appropriate space 


for j = 1:length(images)
    
    imnames = images(j).name, '.nii';
    resize_img(imnames, Voxdim, BB);
    
end

%%

clc 
clear all

roi_loc = {'ROI_Files'};
roi_dir = '/media/storage/Projects/Joe/LANES_FC_V1/Task_Visual_ROI/';

for i = 1:length(roi_loc)
    roi_file = fullfile(roi_dir, roi_loc{i});
    cd(roi_file);
    roi_list = dir('*.nii');
    
    for j = 1:length(roi_list)
        roi = roi_list(j).name;
        mars_img2rois(roi, fullfile(roi_dir, roi_loc{i}), roi, 'i')
    end
end
    