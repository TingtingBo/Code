clear
clc
%% script to add labels to individual subjects to eventually use as volumes for FC analysis
% make sure you are in the subjects directory 
labelsrh = { 'rh.CON_over_MD_fwhm20_VOL.label' 'rh.MD_over_CON_fwhm20.label'};
labelslh  = {'lh.MD_over_CON_fwhm20.label' 'lh.CON_over_MD_fwhm20_SULC.label' 'lh.MD_over_CON_fwhm20_VOL.label'};

Subs = {'MAC_DE_011' 'MAC_DE_013' 'MAC_DE_016' 'MAC_DE_018' 'MAC_DE_019' 'MAC_DE_024' 'MAC_DE_025'...
'MAC_DE_026' 'MAC_DE_08' 'MAC_DE_09'  'MAC_CON_011' 'MAC_CON_013' 'MAC_CON_016' 'MAC_CON_018'... 
'MAC_CON_019' 'MAC_CON_024' 'MAC_CON_025' 'MAC_CON_026' 'MAC_CON_08' 'MAC_CON_09'};

%% lh labels from fsaverage spread to participants
for j=1:length(labelslh)
    for i=1:length(Subs)
        
        eval(['! mri_label2label --srcsubject fsaverage --srclabel fsaverage/label/' labelslh{j}...
            ' --trgsubject ' Subs{i} ' --trglabel ' Subs{i} '/label/' labelslh{j} ...
            ' --regmethod surface --hemi lh'])
      
    end
end
%% rh labels from fsaverage spread to participants
for j=1:length(labelsrh)
    for i=1:length(Subs)
        
        eval(['! mri_label2label --srcsubject fsaverage --srclabel fsaverage/label/' labelsrh{j}...
            ' --trgsubject ' Subs{i} ' --trglabel ' Subs{i} '/label/' labelsrh{j} ...
            ' --regmethod surface --hemi rh'])
      
    end
end

