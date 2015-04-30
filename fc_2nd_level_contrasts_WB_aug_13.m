% Creates 2nd-level SPM Contrasts for functional connectivity data. Uses
% single-subject z-score connectivity profiles.
% Joseph Grififs 2014

clear all
addpath(genpath('/media/store2/MATLAB/toolbox/spm8/'));  % Add SPM to matlab path (for reslicing function)
spm('Defaults','fMRI');
spm_jobman('initcfg');

data_dir = '/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_con';
n_rois = 1;
conditions = {'L_2v6_'};
names = {'.2_LH_V1.label_roi' '.6_LH_V1.label_roi'};

for i = 1:length(conditions)
    for n = 1:length(names)
        cd(data_dir)
        p = spm_select('FPList',data_dir, [ names{n} '.img']);
        out_dir = fullfile( 'SPM_Level2_', [ conditions{i} '_' names{n}]);       
        if isdir(out_dir) ~= 1
            mkdir(out_dir);
        end
        
        clear matlabbatch
        matlabbatch{1}.spm.stats.factorial_design.dir = cellstr(out_dir); %Define output directory
        matlabbatch{1}.spm.stats.factorial_design.des.t1.scans = cellstr(p); %Cell array that defines path directories to all contrasts of the same type, e.g., spmF_0001.img for all subjects
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
        
        clear matlabbatch
        
        matlabbatch{1}.spm.stats.con.spmmat = cellstr(fullfile(pwd,'SPM.mat')); %Define path directory to Block Estimated SPM.mat file for a single subject
        
        matlabbatch{1}.spm.stats.con.consess{1}.tcon.name = 'Tcon';
        matlabbatch{1}.spm.stats.con.consess{1}.tcon.convec = [1];
        matlabbatch{1}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
        
        matlabbatch{1}.spm.stats.con.consess{2}.tcon.name = 'Tcon';
        matlabbatch{1}.spm.stats.con.consess{2}.tcon.convec = [-1];
        matlabbatch{1}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
        
        matlabbatch{1}.spm.stats.con.delete = 1;
        
        spm_jobman('run',matlabbatch);
        clear matlabbatch
        
    end
    
end

