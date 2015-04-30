%% Function util_roi_fc_auto.m 
% This function calculates correlations in timecourses among given ROIs;
% and outputs firs-level r-statistic and z-statistic correlation matrices 
%Joseph Griffis 2014

function util_roi_fc_autowb(cfg)
%% Initialize variables
seed_path = cfg.seed_path; % Path to seed rois
data_path = cfg.data_path; % Path to columes containing timecourses
save_path = cfg.save_path; % Path to output directory
subject_vol = cfg.subject_vol; % Volume containing timecourses
name = cfg.name; % name to save files
seed_prefix = cfg.seed_prefix; % prefix to seed files for regexp

%% Get ROI files and run correlation analyses

% Get ROI files for seed and other ROIs
for i = 1:length(seed_prefix)
    cd(seed_path{i});
    seed_rois = spm_get('Files', pwd, [seed_prefix{i} '.mat']);
    mars_seed = maroi('load_cell', seed_rois);
    if i == 1 
        seed_roi_list = mars_seed;
    else
        seed_roi_list = [seed_roi_list; mars_seed];
    end
end

rois = seed_roi_list;
% Get volumes
data_loc1=spm_select('ExtFPlist',data_path, ['^' subject_vol] ,1:500);
% Extract mean signal timecourses
mY = get_marsy(rois{:}, data_loc1, 'eigen1');  % extract data into mars Y data object change to eigen1 from mean to get principle eigen value instead of average
y1 = summary_data(mY);
% Make output directory
if isdir(save_path) == 0
    mkdir(save_path);
end

cd(save_path)
[correlation.r_score correlation.p_val] = corrcoef(y1);
correlation.z_score=.5.*log((1+corrcoef(y1))./(1-corrcoef(y1))+0.00000000000000001);

save(['profile' eval('name')], 'correlation');
      
for i = 1:length(rois)
        list{i} = label(rois{i});
end
    
cd(save_path)
listname = ['list_' name];
save(listname, 'list')
end