%% MarsBaR batch script to make ROIs
%  Joseph Griffis 
clear all 
clc
% initialize SPM
spm('Defaults','fMRI');

% Directory containing folder for ROI files 
roi_dir = '/media/store3/Projects/Wess/subjects/MD_FC_ROI/ROIs_Joe';

% turn marsbar on 
addpath(genpath('/home/abdurahman/Desktop/marsbar-0.42'))% marsbar
marsbar('on');  % needed to set paths etc

% List of ROI coordinates (in MNI space) and names 
outpoints = {[30 44 -12] [ -8 -90 -30] [ -42 48 -4] [ 50 18 30] [ 58 -44 50] [ 39 -14 0] [ -52 -70 20] [ -62 -30 16] [ 48 -74 24] [ 4 15 32]};
name = {'R_vlPFC' 'L_Cerebellum' 'L_vlPFC' 'R_dlPFC' 'R_IPL' 'R_Insula' 'L_Angular' 'L_STG' 'R_Angular' 'R_ACC' }
sphere_centres = outpoints;
name = transpose(name);
R = length(outpoints);%Make sphere ROIs from list given above.

for x = 1:R  
area =[name{x}]
sphere_centre = sphere_centres{x}
sphere_radius = 5;
sphere_roi = maroi_sphere(struct('centre', sphere_centre, 'radius', sphere_radius));

% Give it a name
details = [area int2str(sphere_centre) int2str(sphere_radius)]
details = details(details ~= ' ')
roitosave = label(sphere_roi, name{x})

% save ROI to MarsBaR ROI file, in current directory
detailsmat = [name{x} '_roi.mat']
saveroi(roitosave, fullfile(roi_dir,detailsmat ));
% also Save as image that can be viewed in MRIcroN
detailsimg = [name{x}, '_roi.nii']
cd(roi_dir)
detailsmat = [name{x} '_roi.mat']
saveroi(roitosave, fullfile(roi_dir,detailsmat ));
save_as_image(roitosave, detailsimg);
end
