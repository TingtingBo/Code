%% Function util_voxelwise_fc_auto.m 
% This function computes whole-brain voxelwise correlations to seed
% regions. This function outputs first-level r-statistic and z-statistic
% whole-brain images. This function uses Marsbar function get_marsy to
% extract ROI timecourses. 

function util_voxelwise_fc_auto_tempwb(cfg)
%% Initialize all input variables
data_path = cfg.data_path; % path to volumes
data_path2 = cfg.data_path2; %s
seed_path = cfg.seed_path; % path to ROI seed
seed_dir = cfg.seed_dir;
save_path = cfg.save_path; % path to output directory
mask_path = cfg.mask_path; % path to subject mask
seed_rois = cfg.seed_rois; % names of seed ROIs
roi_names = cfg.roi_names;
subject_vol = cfg.denoised_vol; % name of volumes containing timecourses
names = cfg.names; % names to save to output files
suppress = cfg.suppress; % number of images to suppress 
subject = cfg.subject; % subject name 
%% Load ROI files

maskfile=load_nii(mask_path); % load mask file of the subject.
[x,y,z] = ind2sub(size(maskfile.img),find(maskfile.img > 0)); % get coordinates of voxels with non-null value in the mask.
rois = [];

% Loop through seed regions and create list of ROIs 
for i = 1:length(seed_rois)
    cd(fullfile(seed_path, subject));
    seed_files = spm_get('Files',pwd, [seed_rois{i}  '*.mat']); % Get ROI info
    mars_seed = maroi('load_cell',seed_files); % Get ROI files
    if i == 1 % Loop through ROIs and create ROI list
        rois = [mars_seed];
    else
        rois = [rois; mars_seed];
    end
end

% Load image from first resting-state run
cd(data_path);
fprintf('\t\t Loading denoised image \n');
boldname = subject_vol;
boldfile = load_nii(boldname); % Load BOLD image
if exist(data_path2,'dir')
    cd(data_path2);
    boldname2 = 'swraMacDe_RestingState2_denoised.nii';
    boldfile2 = load_nii(boldname2); % Load BOLD image
    myimg = cat(4,boldfile.img(:,:,:,suppress:end),boldfile2.img(:,:,:,suppress:end));
else
    myimg = boldfile.img(:,:,:,suppress:end);
end
imgnum = size(myimg,4); % Get number of timepoints (fourth dimension of bold image)

for n=1:length(rois) % Loop on ROIs
    data_loc1=spm_select('ExtFPlist',data_path, ['^' subject_vol], suppress:1000);
    data_loc2=spm_select('ExtFPlist',data_path2, ['^' 'swraMacDe_RestingState2_denoised.nii'], suppress:1000);
    data_loc3 = vertcat(data_loc1, data_loc2);
    mY = get_marsy(rois{n}, data_loc3, 'mean');  % extract data into mars Y data object
    y1 = summary_data(mY);
    
    maskfile.filetype = 64; maskfile.hdr.dime.datatype = 64; maskfile.hdr.dime.bitpix = 64; % Correct file type to save double numbers!
    correl_img = maskfile; % Create a new empty image based on the mask, will contain significant correl values
    correl_img.img = zeros(size(maskfile.img))*NaN; % Filled with zeros, to be refilled with correlation coeff later
    correl_imgz = correl_img; % Create a new empty image based on the mask, will contain significant correl values, Fischer adjusted
    correl_imgzz = correl_img;
    bartlett_img = correl_img;
    
    for k=1:length(x)
        voxel = double(reshape(myimg(x(k),y(k),z(k),:),imgnum,1));
        RHO = corr(y1,voxel);
        correl_img.img(x(k),y(k),z(k)) = RHO; % Writing correl value of each voxel
        correl_imgz.img(x(k),y(k),z(k)) = 0.5*(log((1+RHO)/(1-RHO))); % Writing Fischer Z-tranformed correlation value          
        voxel2 = autocorr(voxel).*autocorr(voxel);
        bartlett_img.img(x(k),y(k),z(k)) = mean(voxel2)*length(voxel2);
        Zse = 1/(sqrt(imgnum/bartlett_img.img(x(k),y(k),z(k))-3));
        correl_imgzz.img(x(k),y(k),z(k)) = correl_imgz.img(x(k),y(k),z(k)) / Zse;
          
    end
    fprintf('...Done \n');
    
    
    fprintf('\t\t Writing and saving correlation image files');
    
    if isdir(save_path) == 0
        mkdir(save_path);
    end
    
    cd(save_path);
    
    % Make output directories
    if isdir('Correl') == 0
        mkdir('Correl');
    end
    if isdir('ZCorrel') == 0
        mkdir('ZCorrel');
    end
    if isdir('ZZCorrel') == 0 
        mkdir('ZZCorrel');
    end
    
    % Construct file names
    name_file = strcat('Correl_',subject,'_', names, '_', roi_names{n});
    name_filez = strcat('ZCorrel_',subject,'_',names, '_', roi_names{n});
    name_filezz = strcat('ZZCorrel_',subject,'_',names, '_', roi_names{n});

    % Save files
    cd(fullfile(save_path, 'Correl'));
    save_nii(correl_img,name_file);
    cd(fullfile(save_path, 'ZCorrel'));
    save_nii(correl_imgz,name_filez);
    cd(fullfile(save_path, 'ZZCorrel'));
    save_nii(correl_imgzz, name_filezz);
    
    fprintf('...Done \n');
end
end

