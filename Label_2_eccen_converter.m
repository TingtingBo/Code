clear
clc

fname = 'mh.V1.ecctmp.sym.mgh';
addpath('/media/store2/freesurfer/matlab');
addpath('/media/store3/Projects/Wess/subjects/fsaverage/mri');
addpath('/media/store3/Projects/Wess/subjects/fsaverage/label');

labelN = '2_LH_depth_V1';
[vol, M, mr_parms, volsz] = load_mgh(fname);
labeldat = read_label('fsaverage', labelN);

storeinfo = vol(labeldat(:,1));
labelmean = mean(storeinfo(storeinfo(:)~=0))
labelmin = min(storeinfo(storeinfo(:)~=0))
labelmax = max(storeinfo(storeinfo(:)~=0))


