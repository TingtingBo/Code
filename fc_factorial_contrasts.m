% Creates 2nd-level factorial design contrasts for functional connectivity data. Uses
% single-subject z-score connectivity profiles.
% Joseph Grififs 2014

clear all
addpath(genpath('/media/store2/MATLAB/toolbox/spm8/'));  % Add SPM to matlab path (for reslicing function)
data_dir1 = '/media/storage/Projects/Joe/LANES_FC_V1/Task_Visual_ROI/ZCorrel/Smoothed';
data_dir2 = '/media/storage/Projects/Joe/LANES_FC_V1/Task_Visual_ROI/ZCorrel/Smoothed';
spm('Defaults','fMRI');
spm_jobman('initcfg');
result_dir = '/media/storage/Projects/Joe/LANES_FC_V1/Task_Visual_ROI/ZCorrel/Smoothed';

p11 = spm_select('FPList',data_dir1, [ 'VR_L_inf_occ'  '.img']);
p12 = spm_select('FPList',data_dir1, [ 'AB_L_inf_occ'  '.img']);

out_dir = fullfile(result_dir, 'SPM_Factorial');

if isdir(out_dir) ~= 1
    mkdir(out_dir);
end

clear matlabbatch

matlabbatch{1}.spm.stats.factorial_design.dir = out_dir;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).name = 'Task1';
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).levels = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).variance = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).name = 'Task2';
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).levels = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).variance = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).ancova = 0;

matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(1).levels = [1 1];
matlabbatch{1}.spm.stats.factorial_design.dir = cellstr(out_dir); %Define output directory
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(1).scans = cellstr(p11);
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(2).levels = [1 2];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(2).scans = cellstr(p12);

matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
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
% 
% matlabbatch{1}.spm.stats.con.consess{1}.tcon.name = 'TCon01';
% matlabbatch{1}.spm.stats.con.consess{1}.tcon.convec = [1 0 0 0 ];
% matlabbatch{1}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
% 
% matlabbatch{1}.spm.stats.con.consess{2}.tcon.name = 'TCon01';
% matlabbatch{1}.spm.stats.con.consess{2}.tcon.convec = [0 1 0 0];
% matlabbatch{1}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
% 
% matlabbatch{1}.spm.stats.con.consess{3}.tcon.name = 'TCon03';
% matlabbatch{1}.spm.stats.con.consess{3}.tcon.convec = [0 0 1 0];
% matlabbatch{1}.spm.stats.con.consess{3}.tcon.sessrep = 'none';
% % 
% matlabbatch{1}.spm.stats.con.consess{4}.tcon.name = 'TCon04';
% matlabbatch{1}.spm.stats.con.consess{4}.tcon.convec = [0 0 0 1 ];
% matlabbatch{1}.spm.stats.con.consess{4}.tcon.sessrep = 'none';

% matlabbatch{1}.spm.stats.con.consess{5}.tcon.name = 'TCon05';
% matlabbatch{1}.spm.stats.con.consess{5}.tcon.convec = [1 0 0 0 ];
% matlabbatch{1}.spm.stats.con.consess{5}.tcon.sessrep = 'none';
% 
% matlabbatch{1}.spm.stats.con.consess{6}.tcon.name = 'TCon05';
% matlabbatch{1}.spm.stats.con.consess{6}.tcon.convec = [0 1 0 0 ];
% matlabbatch{1}.spm.stats.con.consess{6}.tcon.sessrep = 'none';
% 
% matlabbatch{1}.spm.stats.con.delete = 1;


spm_jobman('run',matlabbatch);

        
