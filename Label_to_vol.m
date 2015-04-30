%% 1 Make nii files from labels
clear all 
clc
% path to subject data
Sub = {'1000326.ct'...
'1000426.ct'...
'1000726.ct'...
'1001026.ct'...
'1001226.ct'...
'1001326.ct'...
'1002126.ct'...
'1002826.ct'...
'1002926.ct'...
'1003426.ct'...
'1003626.ct'...
'1004226.ct'...
'1004326.ct'...
'1005226.ct'...
'1005426.ct'...
'1005726.ct'...
'1005826.ct'...
'1006626.ct'...
'1006726.ct'...
'1006926.ct'...
'1007726.ct'...
'1007826.ct'...
'1008126.ct'...
'1008626.ct'...
'1009126.ct'...
'1009226.ct'...
'1009326.ct'...
'1009526.ct'...
'1009626.ct'...
'1009926.ct'...
'1010226.ct'...
'1010426.ct'...
'1011026.ct'...
'1011226.ct'...
'1011426.ct'...
'1011526.ct'...
'1012526.ct'...
'1013526.ct'...
'1014526r2'...
'1010826r2' ...
'1010726r2'...
};

Sub = { 'LOAF_004' 'LOAF_006' 'LOAF_08' 'LOAF_12' 'LOAF_13' 'LOAF_15' 'LOAF_18' 'LOAF_019'  'LOAF_020' 'LOAF_021' 'LOAF_022' ...
     'LOAF_023' 'LOAF_025' 'LOAF_027' 'LOAF_028'...
     'LOAF_029' 'LOAF_031' 'LOAF_032'  'LOAF_033'...
      'LOAF_035' 'LOAF_037' 'LOAF_038'...
'EEGFMRI_05.ct' 'EEGFMRI_07.ct' 'EEGFMRI_08.ct'...
'EEGFMRI_011.ct' 'EEGFMRI_012.ct' 'EEGFMRI_014.ct'...
'EEGFMRI_016.ct' 'EEGFMRI_018.ct' 'EEGFMRI_024.ct'...
'EEGFMRI_026.ct'};

SubPath= '/media/store3/Projects/Wess/subjects/';


for j= 1: length(Sub)
    
    
    % make directory
    mkdir(fullfile(SubPath,Sub{j},'V1ROI'))
    

    ROI= {'1_LH_V1' '2_LH_V1' '3_LH_V1' '4_LH_V1' '5_LH_V1' '6_LH_V1' '7_LH_V1' '8_LH_V1' '9_LH_V1'};

 
    for k = 1: length(ROI)
        
        %path to  label
        
        labelname=[  ROI{k} '.label'];
        
        % to make the ROI name
        FinalROI=[ ROI{k}];
        
        
        labdir = fullfile( SubPath,Sub{j}, '/label/',  labelname);
        
        
        if  exist(labdir, 'file')
            
            
            %output ROI
            outROI  = fullfile( SubPath,Sub{j}, '/V1ROI',  FinalROI);
            
            outROI =[outROI '.nii'];
            
            %             %standered label
            Mask= fullfile( SubPath,Sub{j}, '/mri/brainmask.mgz');
            
            % make the nii ROI. 
            eval(['! mri_label2vol   --label ' labdir  ' --temp ' Mask ' --o   ' outROI  '   --identity'   ])
            
            
        else
            
            display('doesnt exist')
            

            %
        end
        
    end
    
    
end



 %% move into same space as normalized anatomy and make marsbar files
spm_defaults;

global defaults;

SubPath= '/media/store3/Projects/Joe/LANESFMRI/Structurals/';
struct_path = '/media/store3/Projects/Joe/LANESFMRI/SubjData/';
Sub= {'EEGFMRI_024.ct' 'EEGFMRI_026.ct' 'EEGFMRI_04.ct' 'EEGFMRI_030.ct' 'EEGFMRI_05.ct' 'EEGFMRI_07.ct' 'EEGFMRI_08.ct' 'EEGFMRI_011.ct' 'EEGFMRI_012.ct' 'EEGFMRI_014.ct' 'EEGFMRI_016.ct' 'EEGFMRI_018.ct'}
addpath(genpath('/home/abdurahman/Desktop/marsbar-0.42'))% marsbar
marsbar('on')

for j= 1: length(Sub)
    
    % get the ROI
    ROI= {'lh.V1' 'rh.V1'};
    subj_name_struct = Sub{j}(:, 1:(length(Sub{j})-3));
    subj_struct_path = strcat(struct_path, subj_name_struct, '/SAG_3D_T1_MPRAGE_1mm_2300/');
    % get the trasformation matrix of that subject
    snmat_name =spm_select('FPlist',  subj_struct_path, 'normalize_parameter.mat', 1);
    
    %Cd to folder
    
    cd(fullfile( SubPath,Sub{j},'V1ROI'))
      
    for k = 1: length(ROI)
        
        % pick up each ROI 
        outROI  = fullfile( SubPath,Sub{j}, '/V1ROI',  [ROI{k} '.nii'] );
        
       % see if it exists
        if  exist(outROI, 'file')
            
            % make into normalized strcture
            spm_write_sn(outROI, snmat_name, defaults.normalise.write)
            
            % turn into marsbar file
            mars_img2rois(['w' ROI{k} '.nii'], pwd, ['w' ROI{k}], 'i')


        else
            
            display('doesnt exist')
            
        end
        
    end
    
    
end

dir1 = '/media/store4/Projects/LOAf/A/';
dir1file = 'tfl_ADNI';
dir1filename = 'tfl_ADNI.nii';
cwd = '/media/store3/Projects/Wess/ericanov6';




for x = 1:length(Sub)
    eval(['! mv ' '/media/store3/Projects/Wess/subjects/' Sub{x} '/V1ROI' ' ' '/media/store3/Projects/Wess/subjects/con_nif/' Sub{x}])

end

