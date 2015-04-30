subjects = { 'MAC_DE_08'};

controls = { 'MAC_CON_014' };
label={'Func_Def_ROI.label', 'INF_ROI.label'};

for x = 1:length(subjects)
eval(['! mri_label2label --srclabel ' label{2} ' --srcsubject ' subjects{x} ' --trglabel ' label{1} ' --trgsubject ' controls{x} ' --regmethod surface --hemi lh'])
end

for x = 1:length(subjects)
var = strcat('/media/store3/Projects/Wess/subjects/',subjects{x}, '/label');
cd(var)
eval(['! mris_anatomical_stats -l Func_Def_ROI.label -f Func_Def_ROI.tab.lh ' subjects{x} ' lh'])
end
for x = 1:length(controls)
var = strcat('/media/store3/Projects/Wess/subjects/',controls{x}, '/label');
cd(var)
eval(['! mris_anatomical_stats -l INF_ROI.label -f Func_Def_ROI.tab.lh ' controls{x} ' lh'])
end

cd('/media/store3/Projects/Rodolphe/Macular/A/Postdata/SPM/Mixed_1stlvl')

vol= 'spmT_0001.img'
MACID='MAC_DE_016'
eval(['! tksurfer ' MACID ' rh inflated -gray '...
' -overlay ' vol ' -mni152reg -fminmax 1.7291 10 ' ])

vol= 'L_4_roi.nii'
MACID='fsaverage'
eval(['! tksurfer ' MACID ' lh partially_inflated2 -gray '...
' -overlay ' vol ' -mni152reg -fminmax 1 10 ' ])