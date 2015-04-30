% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'/media/store3/Projects/Wess/subjects/Whole_Brain_MD/SPM_Factorial/pairtest_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('serial', jobs, '', inputs{:});
