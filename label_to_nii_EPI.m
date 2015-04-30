% 1 Make nii files from labels
% 2 Transform the nii to the the subjects brain area 
% 3 make into marsbar ROI
% 4 extrac beta values and place into data strcture
% 5 analyise the data strcture

%% 1 Make nii files from labels
clear all 
clc
addpath(genpath('/media/store2/MATLAB/toolbox/spm8/'));  % Add SPM to matlab path (for reslicing function)
addpath(genpath('/media/store3/Projects/Joe/LANES_FMRI/A/FMRI_Scripts/')); % add complementary functions used

% path to subject data
subject_dir= '/media/store3/Projects/Wess/subjects/';
cd(subject_dir);
subject =  {'MAC_DE_011' 'MAC_DE_013' 'MAC_DE_016' 'MAC_DE_018' 'MAC_DE_019' 'MAC_DE_024' 'MAC_DE_025'...
'MAC_DE_026' 'MAC_DE_08' 'MAC_DE_09'  'MAC_CON_011' 'MAC_CON_013' 'MAC_CON_016' 'MAC_CON_018'... 
'MAC_CON_019' 'MAC_CON_024' 'MAC_CON_025' 'MAC_CON_026' 'MAC_CON_08' 'MAC_CON_09'};
label_folder = 'label';
roi = { 'rh.CON_over_MD_fwhm20_VOL' 'rh.MD_over_CON_fwhm20' 'lh.MD_over_CON_fwhm20' 'lh.CON_over_MD_fwhm20_SULC' 'lh.MD_over_CON_fwhm20_VOL'};

 
for j= 1: length(subject)
    
    subject_name = subject{j};
    label_dir = (fullfile(subject_dir,subject_name,label_folder));
    cd(label_dir);
    for k = 1: length(roi)
    roi_file = strcat(roi{k}, '.label');  
    
    eval(['! mri_label2vol  --label ' roi_file  ...
            ' --temp /media/store2/MATLAB/toolbox/spm8/templates/EPI.nii --reg /media/store3/Projects/Wess/subjects/' subject_name '/label/register.dat  --fillthresh .3  --o ' roi_file '.nii' ]);
            
    end
    
    
end

Voxdim = [2 2 2];
BB = [-78 -112 -50; 78 76 84];

for i = 1:length(subject)
    
    image_dir = fullfile(subject_dir, subject{i}, 'label');
    cd(image_dir);
    
    for j = 1:length(roi)
        
        imnames = strcat(roi{j}, '.label.nii');
        resize_img(imnames, Voxdim, BB);
    end
end


%% move into same space as normalized anatomy and make marsbar files
% adapted by Joseph Griffis 
clear all 
spm('defaults', 'fmri')
global defaults
addpath(genpath('/home/abdurahman/Desktop/marsbar-0.42'))% marsbar
marsbar('on')

subject_dir= '/media/store3/Projects/Wess/subjects/';
cd(subject_dir)
subject =  {'MAC_DE_011' 'MAC_DE_013' 'MAC_DE_016' 'MAC_DE_018' 'MAC_DE_019' 'MAC_DE_024' 'MAC_DE_025'...
'MAC_DE_026' 'MAC_DE_08' 'MAC_DE_09'  'MAC_CON_011' 'MAC_CON_013' 'MAC_CON_016' 'MAC_CON_018'... 
'MAC_CON_019' 'MAC_CON_024' 'MAC_CON_025' 'MAC_CON_026' 'MAC_CON_08' 'MAC_CON_09'};

label_folder = 'label';
roi = { 'rh.CON_over_MD_fwhm20_VOL' 'rh.MD_over_CON_fwhm20' 'lh.MD_over_CON_fwhm20' 'lh.CON_over_MD_fwhm20_SULC' 'lh.MD_over_CON_fwhm20_VOL'};

for j= 1:length(subject)
    
    label_dir = fullfile(subject_dir, subject{j}, 'label');
    % get the trasformation matrix for each subject
    
    for k = 1: length(roi)
        
        % pick up each ROI 
        roi_file = strcat('r', roi{k}, '.label', '.nii');
        cd(label_dir);
       
        % turn into marsbar file
        mars_img2rois([roi_file ], pwd, [roi_file], 'i');
        
    end
    
    
end



