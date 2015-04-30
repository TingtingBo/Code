%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 4252 $)
%-----------------------------------------------------------------------
clear all
addpath(genpath('/media/store2/MATLAB/toolbox/spm8/'));  % Add SPM to matlab path (for reslicing function)
spm('Defaults','fMRI');
spm_jobman('initcfg');
out_dir = '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/Average_t_tests_noscale/Average2';
matlabbatch{1}.spm.stats.factorial_design.dir = {'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/Average_t_tests_noscale/Average2'};
%%
matlabbatch{1}.spm.stats.factorial_design.des.t2.scans1 = {
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_con/ZCorrel_MAC_CON_011_mean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_con/ZCorrel_MAC_CON_013_mean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_con/ZCorrel_MAC_CON_016_mean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_con/ZCorrel_MAC_CON_018_mean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_con/ZCorrel_MAC_CON_019_mean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_con/ZCorrel_MAC_CON_024_mean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_con/ZCorrel_MAC_CON_025_mean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_con/ZCorrel_MAC_CON_026_mean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_con/ZCorrel_MAC_CON_08_tmean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_con/ZCorrel_MAC_CON_09_tmean_roi2.img,1'
                                                           };
%%
%%
matlabbatch{1}.spm.stats.factorial_design.des.t2.scans2 = {
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_md/ZCorrel_MAC_DE_011_tmean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_md/ZCorrel_MAC_DE_013_tmean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_md/ZCorrel_MAC_DE_016_tmean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_md/ZCorrel_MAC_DE_018_tmean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_md/ZCorrel_MAC_DE_019_tmean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_md/ZCorrel_MAC_DE_024_tmean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_md/ZCorrel_MAC_DE_025_tmean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_md/ZCorrel_MAC_DE_026_tmean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_md/ZCorrel_MAC_DE_08_temean_roi2.img,1'
'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/L_R_average_md/ZCorrel_MAC_DE_09_temean_roi2.img,1'
                                                           };
%%
matlabbatch{1}.spm.stats.factorial_design.des.t2.dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.t2.variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.t2.gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.t2.ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/rest_MD_CON_cen_peri.img'};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;

spm_jobman('run',matlabbatch);

clear matlabbatch
cd(out_dir);

matlabbatch{1}.spm.stats.fmri_est.spmmat = cellstr(fullfile(pwd,'SPM.mat'));

matlabbatch{1}.spm.stats.fmri_est.method.Classical = 1;

spm_jobman('run',matlabbatch);
%%
clear matlabbatch

matlabbatch{1}.spm.stats.con.spmmat = cellstr(fullfile(pwd,'SPM.mat')); %Define path directory to Block Estimated SPM.mat file for a single subject

matlabbatch{1}.spm.stats.con.consess{1}.tcon.name = 'Tcon';
matlabbatch{1}.spm.stats.con.consess{1}.tcon.convec = [1 -1];
matlabbatch{1}.spm.stats.con.consess{1}.tcon.sessrep = 'none';

matlabbatch{1}.spm.stats.con.consess{2}.tcon.name = 'Tcon2';
matlabbatch{1}.spm.stats.con.consess{2}.tcon.convec = [-1 1];
matlabbatch{1}.spm.stats.con.consess{2}.tcon.sessrep = 'none';

matlabbatch{1}.spm.stats.con.delete = 1;

spm_jobman('run',matlabbatch);
clear matlabbatch
