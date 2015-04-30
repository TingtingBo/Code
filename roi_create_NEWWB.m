%% create_resize_mask_roi.m 
% This script creates spherical regions of interest using given
% co-ordinates in MNI space (uses function util_sphere_roi.m); 
% This script also contains sections that alter the bounding-box and
% voxel dimensions of an image and mask the image with another image. 
% Joseph Griffis 2014
%% ROI Creation

mars_path = '/home/abdurahman/Desktop/marsbar-0.42'; % path to marsbar
addpath(genpath('/media/storage/Projects/Joe/Toolbox')); % path to roi function
roi_dir = '/media/store4/Projects/Joe/LOAF_Vision_FC/RB_Eccentricity_2v4v7/LANES_Seed/NvC'; % outout director

inpoints= {[6 42 2]}; % MNI co-ordinate structure
names = {'R_sgACC'}; % name structure
radius = 12; % radius of sphere
util_sphere_roi(roi_dir, inpoints, names, radius, mars_path); % creates ROIs

%% Resize Image

addpath(genpath('/media/storage/Projects/Joe/Toolbox')); % path to function
image_dir = '/media/store4/Projects/Joe/LOAF_Vision_FC/RB_Eccentricity_2v4v7/LANES_Seed/';
Voxdim = [2 2 2]; % desired voxel dimensions
BB = [-80 -114 -52; 75 73 82]; %% needed to resize to appropriate space (from function worldBB contained inside resize_img).
folders = {'NvC'}; % Folders to loop through

for i = 1:length(folders)
    cd(fullfile(image_dir, folders{i}));
    images = dir('R_sgACC_roi.nii'); % Get images

for j = 1:length(images)
    
    imnames = images(j).name; 
    resize_img(imnames, Voxdim, BB); % resize images. 
    
end
end

%% Create Mask

clear all
addpath(genpath('/home/rodolphe/toolbox/matlab_nifti/'));  % Add nifti to matlab path (for load_nii and save_nii functions)
roi_loc = {'ROIS_FC_DMN'}; % Folder names containing images to mask
roi_dir = '/media/store3/Projects/Wess/subjects/'; % Path to ROI folders
mask_file = 'mask.img'; % mask name

for i =1:length(roi_loc)
    % Get ROIs
    file_dir = fullfile(roi_dir, roi_loc{i});
    cd(file_dir);
    mask_dir = file_dir;
    rois = dir('r*');
    
    for j = 1:length(rois)
        % Multiply images by binary mask to create mask image.
        my_roi = load_nii(rois(j).name);
        new_roi = my_roi;
        cd(mask_dir)
        my_mask = load_nii(mask_file);
        temp_roi = my_roi.img; % convert original image to single int format
        temp_mask= my_mask.img; % mask
        masked_roi = temp_roi.*temp_mask;
        new_roi.img = masked_roi; % masked image
        cd(file_dir);
        save_nii(new_roi, strcat(rois(j).name, '_masked')); % save new image
    end 
end

       
%% Create marsbar ROI objects

clc 
clear all
roi_loc = {'ROIS_FC_DMN'}; % Folder names containing images to mask
roi_dir = '/media/store3/Projects/Wess/subjects/'; % Path to ROI folders

for i = 1:length(roi_loc)
    roi_file = fullfile(roi_dir, roi_loc{i});
    cd(roi_file);
    roi_list = dir('*masked.nii');
    
    for j = 1:length(roi_list)
        roi = roi_list(j).name;
        mars_img2rois(roi, fullfile(roi_dir, roi_loc{i}), roi, 'i') % Create new marsbar ROI folders
    end
end
    

