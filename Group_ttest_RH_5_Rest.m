%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 4252 $)
%-----------------------------------------------------------------------
clear all
addpath(genpath('/media/store2/MATLAB/toolbox/spm8/'));  % Add SPM to matlab path (for reslicing function)
spm('Defaults','fMRI');
spm_jobman('initcfg');
out_dir = '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ttest_5_RH_rest/';
matlabbatch{1}.spm.stats.factorial_design.dir = {'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ttest_5_RH_rest/'};
%%
matlabbatch{1}.spm.stats.factorial_design.des.t2.scans1 = {
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_con/ZCorrel_MAC_CON_011_test_rMAC_CON_011.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_con/ZCorrel_MAC_CON_013_test_rMAC_CON_013.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_con/ZCorrel_MAC_CON_016_test_rMAC_CON_016.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_con/ZCorrel_MAC_CON_018_test_rMAC_CON_018.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_con/ZCorrel_MAC_CON_019_test_rMAC_CON_019.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_con/ZCorrel_MAC_CON_024_test_rMAC_CON_024.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_con/ZCorrel_MAC_CON_025_test_rMAC_CON_025.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_con/ZCorrel_MAC_CON_026_test_rMAC_CON_026.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_con/ZCorrel_MAC_CON_08_test_rMAC_CON_08.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_con/ZCorrel_MAC_CON_09_test_rMAC_CON_09.5_RH_V1.label_roi.img,1'
                                                           };
%%
%%
matlabbatch{1}.spm.stats.factorial_design.des.t2.scans2 = {
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_md/ZCorrel_MAC_DE_011_test_rMAC_DE_011.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_md/ZCorrel_MAC_DE_013_test_rMAC_DE_013.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_md/ZCorrel_MAC_DE_016_test_rMAC_DE_016.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_md/ZCorrel_MAC_DE_018_test_rMAC_DE_018.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_md/ZCorrel_MAC_DE_019_test_rMAC_DE_019.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_md/ZCorrel_MAC_DE_024_test_rMAC_DE_024.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_md/ZCorrel_MAC_DE_025_test_rMAC_DE_025.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_md/ZCorrel_MAC_DE_026_test_rMAC_DE_026.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_md/ZCorrel_MAC_DE_08_test_rMAC_DE_08.5_RH_V1.label_roi.img,1'
                                                           '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_md/ZCorrel_MAC_DE_09_test_rMAC_DE_09.5_RH_V1.label_roi.img,1'
                                                           };
%%
matlabbatch{1}.spm.stats.factorial_design.des.t2.dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.t2.variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.t2.gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.t2.ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_yes.gmscv = 1;
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
