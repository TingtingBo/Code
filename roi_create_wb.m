mars_path = '/home/abdurahman/Desktop/marsbar-0.42'; 
addpath(genpath('/media/storage/Projects/Joe/Toolbox'));
roi_dir = '/media/store3/Projects/Wess/subjects/ROIS_FC_DMN';
%names = {'R IPS';'L IPS';'R frontal cortex';'L frontal cortex';'R precuneus';'L precuneus';'midcingulate';'R IPL';'L IPL';'R dlPFC';'L dlPFC';'R al_fO';'L al_fO';'dACC_msFC';'R aPFC';'L aPFC';'R ant thalamus';'L ant thalamus';'R lat cerebellum';'L lat cerebellum';'R inf cerebellum';'L inf cerebellum';'R TPJ';'L TPJ';'R midoccipital';'L midoccipital ';'R lingual';'L lingual';'R posttemporal';'L posttemporal';'R postcingulate';'L postcingulate';'R fusiform';'L fusiform';'R ant fusiform';'L ant fuisform';'R midtemporal';'L midtemproal';'vmPFC';};
names = {'PCC_precuneus'; 'Left_IPC'; 'OFC_MPFC_vACC'; 'Right_IPC'; 'MPFC'; 'Left_DLPFC'; 'Left_PHG'; 'MPFC';  'VACC_MPFC_OFC'; 'PCC_precuneus'; 'Rostral_PCC'; 'Nucleus_acc'; 'Hypothal'};
radius = 6;
%inpoints = {[30,-61,39];[-31,-59,42];[41,3,36];[-41,3,36];[10,-69,39];[-9,-72,37];[0,-29,30];[51,-47,42];[-51,-51,36];[43,22,34];[-43,22,34];[36,16,4];[-35,14,5];[-1,10,46];[27,50,23];[-28,51,15];[10,-15,8];[-12,-15,7];[31,-61,-29];[-32,-66,-29];[18,-80,-33];[-19,-78,-33];[53,-46,17];[-53,-46,17];[27,-89,3];[-27,-89,3];[8,-82,4];[-8,-82,4];[44,-74,26];[-40,-78,24];[10,-56,16];[-11,-57,13];[35,-65,-9];[-34,-62,-15];[25,-44,-12];[-25,-44,-12];[51,-33,-2];[-53,-31,-5];[1,31,-2];};
inpoints = {[-2,-51,27];[-51,-65,27];[-2,55,-18];[53,-61,27];[-16,49,38];[-44,20,41];[-12,-35,0];[18,54,32];[2,38,-2];[2,-51,27];[4,-14,34];[4,9,-6];[4,-16,-3]};

util_sphere_roi(roi_dir, inpoints, names, radius, mars_path);

%%

image_dir = '/media/store3/Projects/Wess/subjects/ROIS_FC_DMN'

cd(image_dir);
images = dir('*.nii');

Voxdim = [2 2 2];
BB = [-78,-112,-50;78,76,84]; %% needed to resize to appropriate space 


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
    