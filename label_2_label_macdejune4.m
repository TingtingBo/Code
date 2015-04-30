Subs= {'MAC_CON_08' 'MAC_CON_011' 'MAC_CON_013' 'MAC_CON_014' 'MAC_CON_016' 'VINES_1001026'  ...
'MAC_CON_019'  'MAC_CON_024' 'MAC_CON_025' 'MAC_CON_026' 'MAC_CON_028'...
'MAC_DE_08' 'MAC_DE_014' 'MAC_DE_011' 'MAC_DE_013' 'MAC_DE_016' 'MAC_DE_024' ...
'MAC_DE_019' 'MAC_DE_021' 'MAC_DE_025' 'MAC_DE_026' 'MAC_DE_028'...
'LOAF_019' 'LOAF_020' 'LOAF_022' 'LOAF_023' 'LOAF_025' 'LOAF_028' 'LOAF_031'...
'LOAF_032' 'LOAF_033' 'LOAF_035' 'LOAF_038'};

labelslh = {'1_sup_lh_V1.label' '3_sup_lh_V1.label' '5_inf_lh_V1.label' '7_inf_lh_V1.label'...
'2_sup_lh_V1.label' '4_sup_lh_V1.label' '6_inf_lh_V1.label' '8_inf_lh_V1.label' };
labelsrh = {'1_sup_rh_V1.label' '3_sup_rh_V1.label' '5_inf_rh_V1.label' '7_inf_rh_V1.label'...
'2_sup_rh_V1.label' '4_sup_rh_V1.label' '6_inf_rh_V1.label' '8_inf_rh_V1.label'};

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

%% lh stats files created from each label
for j=1:length(labelsrh)
    for i=1:length(Subs)
        
        eval(['! mris_anatomical_stats -l ' labelslh{j} ' -f ' Subs{i} '.' labelslh{j} '.out '  Subs{i} ' lh'])
      
    end
end
%% rh stats files created from each label 
for j=1:length(labelsrh)
    for i=1:length(Subs)
        
        eval(['! mris_anatomical_stats -l ' labelsrh{j} ' -f ' Subs{i} '.' labelsrh{j} '.out '  Subs{i} ' rh'])
      
    end
end


%% Read in files and get data together
for x = 1
%files
label_files = {'LOAF_019.1_sup_lh_V1.label.out'
'LOAF_019.1_sup_rh_V1.label.out'
'LOAF_019.2_sup_lh_V1.label.out'
'LOAF_019.2_sup_rh_V1.label.out'
'LOAF_019.3_sup_lh_V1.label.out'
'LOAF_019.3_sup_rh_V1.label.out'
'LOAF_019.4_sup_lh_V1.label.out'
'LOAF_019.4_sup_rh_V1.label.out'
'LOAF_019.5_inf_lh_V1.label.out'
'LOAF_019.5_inf_rh_V1.label.out'
'LOAF_019.6_inf_lh_V1.label.out'
'LOAF_019.6_inf_rh_V1.label.out'
'LOAF_019.7_inf_lh_V1.label.out'
'LOAF_019.7_inf_rh_V1.label.out'
'LOAF_019.8_inf_lh_V1.label.out'
'LOAF_019.8_inf_rh_V1.label.out'
'LOAF_020.1_sup_lh_V1.label.out'
'LOAF_020.1_sup_rh_V1.label.out'
'LOAF_020.2_sup_lh_V1.label.out'
'LOAF_020.2_sup_rh_V1.label.out'
'LOAF_020.3_sup_lh_V1.label.out'
'LOAF_020.3_sup_rh_V1.label.out'
'LOAF_020.4_sup_lh_V1.label.out'
'LOAF_020.4_sup_rh_V1.label.out'
'LOAF_020.5_inf_lh_V1.label.out'
'LOAF_020.5_inf_rh_V1.label.out'
'LOAF_020.6_inf_lh_V1.label.out'
'LOAF_020.6_inf_rh_V1.label.out'
'LOAF_020.7_inf_lh_V1.label.out'
'LOAF_020.7_inf_rh_V1.label.out'
'LOAF_020.8_inf_lh_V1.label.out'
'LOAF_020.8_inf_rh_V1.label.out'
'LOAF_022.1_sup_lh_V1.label.out'
'LOAF_022.1_sup_rh_V1.label.out'
'LOAF_022.2_sup_lh_V1.label.out'
'LOAF_022.2_sup_rh_V1.label.out'
'LOAF_022.3_sup_lh_V1.label.out'
'LOAF_022.3_sup_rh_V1.label.out'
'LOAF_022.4_sup_lh_V1.label.out'
'LOAF_022.4_sup_rh_V1.label.out'
'LOAF_022.5_inf_lh_V1.label.out'
'LOAF_022.5_inf_rh_V1.label.out'
'LOAF_022.6_inf_lh_V1.label.out'
'LOAF_022.6_inf_rh_V1.label.out'
'LOAF_022.7_inf_lh_V1.label.out'
'LOAF_022.7_inf_rh_V1.label.out'
'LOAF_022.8_inf_lh_V1.label.out'
'LOAF_022.8_inf_rh_V1.label.out'
'LOAF_023.1_sup_lh_V1.label.out'
'LOAF_023.1_sup_rh_V1.label.out'
'LOAF_023.2_sup_lh_V1.label.out'
'LOAF_023.2_sup_rh_V1.label.out'
'LOAF_023.3_sup_lh_V1.label.out'
'LOAF_023.3_sup_rh_V1.label.out'
'LOAF_023.4_sup_lh_V1.label.out'
'LOAF_023.4_sup_rh_V1.label.out'
'LOAF_023.5_inf_lh_V1.label.out'
'LOAF_023.5_inf_rh_V1.label.out'
'LOAF_023.6_inf_lh_V1.label.out'
'LOAF_023.6_inf_rh_V1.label.out'
'LOAF_023.7_inf_lh_V1.label.out'
'LOAF_023.7_inf_rh_V1.label.out'
'LOAF_023.8_inf_lh_V1.label.out'
'LOAF_023.8_inf_rh_V1.label.out'
'LOAF_025.1_sup_lh_V1.label.out'
'LOAF_025.1_sup_rh_V1.label.out'
'LOAF_025.2_sup_lh_V1.label.out'
'LOAF_025.2_sup_rh_V1.label.out'
'LOAF_025.3_sup_lh_V1.label.out'
'LOAF_025.3_sup_rh_V1.label.out'
'LOAF_025.4_sup_lh_V1.label.out'
'LOAF_025.4_sup_rh_V1.label.out'
'LOAF_025.5_inf_lh_V1.label.out'
'LOAF_025.5_inf_rh_V1.label.out'
'LOAF_025.6_inf_lh_V1.label.out'
'LOAF_025.6_inf_rh_V1.label.out'
'LOAF_025.7_inf_lh_V1.label.out'
'LOAF_025.7_inf_rh_V1.label.out'
'LOAF_025.8_inf_lh_V1.label.out'
'LOAF_025.8_inf_rh_V1.label.out'
'LOAF_028.1_sup_lh_V1.label.out'
'LOAF_028.1_sup_rh_V1.label.out'
'LOAF_028.2_sup_lh_V1.label.out'
'LOAF_028.2_sup_rh_V1.label.out'
'LOAF_028.3_sup_lh_V1.label.out'
'LOAF_028.3_sup_rh_V1.label.out'
'LOAF_028.4_sup_lh_V1.label.out'
'LOAF_028.4_sup_rh_V1.label.out'
'LOAF_028.5_inf_lh_V1.label.out'
'LOAF_028.5_inf_rh_V1.label.out'
'LOAF_028.6_inf_lh_V1.label.out'
'LOAF_028.6_inf_rh_V1.label.out'
'LOAF_028.7_inf_lh_V1.label.out'
'LOAF_028.7_inf_rh_V1.label.out'
'LOAF_028.8_inf_lh_V1.label.out'
'LOAF_028.8_inf_rh_V1.label.out'
'LOAF_031.1_sup_lh_V1.label.out'
'LOAF_031.1_sup_rh_V1.label.out'
'LOAF_031.2_sup_lh_V1.label.out'
'LOAF_031.2_sup_rh_V1.label.out'
'LOAF_031.3_sup_lh_V1.label.out'
'LOAF_031.3_sup_rh_V1.label.out'
'LOAF_031.4_sup_lh_V1.label.out'
'LOAF_031.4_sup_rh_V1.label.out'
'LOAF_031.5_inf_lh_V1.label.out'
'LOAF_031.5_inf_rh_V1.label.out'
'LOAF_031.6_inf_lh_V1.label.out'
'LOAF_031.6_inf_rh_V1.label.out'
'LOAF_031.7_inf_lh_V1.label.out'
'LOAF_031.7_inf_rh_V1.label.out'
'LOAF_031.8_inf_lh_V1.label.out'
'LOAF_031.8_inf_rh_V1.label.out'
'LOAF_032.1_sup_lh_V1.label.out'
'LOAF_032.1_sup_rh_V1.label.out'
'LOAF_032.2_sup_lh_V1.label.out'
'LOAF_032.2_sup_rh_V1.label.out'
'LOAF_032.3_sup_lh_V1.label.out'
'LOAF_032.3_sup_rh_V1.label.out'
'LOAF_032.4_sup_lh_V1.label.out'
'LOAF_032.4_sup_rh_V1.label.out'
'LOAF_032.5_inf_lh_V1.label.out'
'LOAF_032.5_inf_rh_V1.label.out'
'LOAF_032.6_inf_lh_V1.label.out'
'LOAF_032.6_inf_rh_V1.label.out'
'LOAF_032.7_inf_lh_V1.label.out'
'LOAF_032.7_inf_rh_V1.label.out'
'LOAF_032.8_inf_lh_V1.label.out'
'LOAF_032.8_inf_rh_V1.label.out'
'LOAF_033.1_sup_lh_V1.label.out'
'LOAF_033.1_sup_rh_V1.label.out'
'LOAF_033.2_sup_lh_V1.label.out'
'LOAF_033.2_sup_rh_V1.label.out'
'LOAF_033.3_sup_lh_V1.label.out'
'LOAF_033.3_sup_rh_V1.label.out'
'LOAF_033.4_sup_lh_V1.label.out'
'LOAF_033.4_sup_rh_V1.label.out'
'LOAF_033.5_inf_lh_V1.label.out'
'LOAF_033.5_inf_rh_V1.label.out'
'LOAF_033.6_inf_lh_V1.label.out'
'LOAF_033.6_inf_rh_V1.label.out'
'LOAF_033.7_inf_lh_V1.label.out'
'LOAF_033.7_inf_rh_V1.label.out'
'LOAF_033.8_inf_lh_V1.label.out'
'LOAF_033.8_inf_rh_V1.label.out'
'LOAF_035.1_sup_lh_V1.label.out'
'LOAF_035.1_sup_rh_V1.label.out'
'LOAF_035.2_sup_lh_V1.label.out'
'LOAF_035.2_sup_rh_V1.label.out'
'LOAF_035.3_sup_lh_V1.label.out'
'LOAF_035.3_sup_rh_V1.label.out'
'LOAF_035.4_sup_lh_V1.label.out'
'LOAF_035.4_sup_rh_V1.label.out'
'LOAF_035.5_inf_lh_V1.label.out'
'LOAF_035.5_inf_rh_V1.label.out'
'LOAF_035.6_inf_lh_V1.label.out'
'LOAF_035.6_inf_rh_V1.label.out'
'LOAF_035.7_inf_lh_V1.label.out'
'LOAF_035.7_inf_rh_V1.label.out'
'LOAF_035.8_inf_lh_V1.label.out'
'LOAF_035.8_inf_rh_V1.label.out'
'LOAF_038.1_sup_lh_V1.label.out'
'LOAF_038.1_sup_rh_V1.label.out'
'LOAF_038.2_sup_lh_V1.label.out'
'LOAF_038.2_sup_rh_V1.label.out'
'LOAF_038.3_sup_lh_V1.label.out'
'LOAF_038.3_sup_rh_V1.label.out'
'LOAF_038.4_sup_lh_V1.label.out'
'LOAF_038.4_sup_rh_V1.label.out'
'LOAF_038.5_inf_lh_V1.label.out'
'LOAF_038.5_inf_rh_V1.label.out'
'LOAF_038.6_inf_lh_V1.label.out'
'LOAF_038.6_inf_rh_V1.label.out'
'LOAF_038.7_inf_lh_V1.label.out'
'LOAF_038.7_inf_rh_V1.label.out'
'LOAF_038.8_inf_lh_V1.label.out'
'LOAF_038.8_inf_rh_V1.label.out'
'VINES_1001026.1_sup_lh_V1.label.out'
'VINES_1001026.1_sup_rh_V1.label.out'
'VINES_1001026.2_sup_lh_V1.label.out'
'VINES_1001026.2_sup_rh_V1.label.out'
'VINES_1001026.3_sup_lh_V1.label.out'
'VINES_1001026.3_sup_rh_V1.label.out'
'VINES_1001026.4_sup_lh_V1.label.out'
'VINES_1001026.4_sup_rh_V1.label.out'
'VINES_1001026.5_inf_lh_V1.label.out'
'VINES_1001026.5_inf_rh_V1.label.out'
'VINES_1001026.6_inf_lh_V1.label.out'
'VINES_1001026.6_inf_rh_V1.label.out'
'VINES_1001026.7_inf_lh_V1.label.out'
'VINES_1001026.7_inf_rh_V1.label.out'
'VINES_1001026.8_inf_lh_V1.label.out'
'VINES_1001026.8_inf_rh_V1.label.out'
'MAC_CON_011.1_sup_lh_V1.label.out'
'MAC_CON_011.1_sup_rh_V1.label.out'
'MAC_CON_011.2_sup_lh_V1.label.out'
'MAC_CON_011.2_sup_rh_V1.label.out'
'MAC_CON_011.3_sup_lh_V1.label.out'
'MAC_CON_011.3_sup_rh_V1.label.out'
'MAC_CON_011.4_sup_lh_V1.label.out'
'MAC_CON_011.4_sup_rh_V1.label.out'
'MAC_CON_011.5_inf_lh_V1.label.out'
'MAC_CON_011.5_inf_rh_V1.label.out'
'MAC_CON_011.6_inf_lh_V1.label.out'
'MAC_CON_011.6_inf_rh_V1.label.out'
'MAC_CON_011.7_inf_lh_V1.label.out'
'MAC_CON_011.7_inf_rh_V1.label.out'
'MAC_CON_011.8_inf_lh_V1.label.out'
'MAC_CON_011.8_inf_rh_V1.label.out'
'MAC_CON_013.1_sup_lh_V1.label.out'
'MAC_CON_013.1_sup_rh_V1.label.out'
'MAC_CON_013.2_sup_lh_V1.label.out'
'MAC_CON_013.2_sup_rh_V1.label.out'
'MAC_CON_013.3_sup_lh_V1.label.out'
'MAC_CON_013.3_sup_rh_V1.label.out'
'MAC_CON_013.4_sup_lh_V1.label.out'
'MAC_CON_013.4_sup_rh_V1.label.out'
'MAC_CON_013.5_inf_lh_V1.label.out'
'MAC_CON_013.5_inf_rh_V1.label.out'
'MAC_CON_013.6_inf_lh_V1.label.out'
'MAC_CON_013.6_inf_rh_V1.label.out'
'MAC_CON_013.7_inf_lh_V1.label.out'
'MAC_CON_013.7_inf_rh_V1.label.out'
'MAC_CON_013.8_inf_lh_V1.label.out'
'MAC_CON_013.8_inf_rh_V1.label.out'
'MAC_CON_014.1_sup_lh_V1.label.out'
'MAC_CON_014.1_sup_rh_V1.label.out'
'MAC_CON_014.2_sup_lh_V1.label.out'
'MAC_CON_014.2_sup_rh_V1.label.out'
'MAC_CON_014.3_sup_lh_V1.label.out'
'MAC_CON_014.3_sup_rh_V1.label.out'
'MAC_CON_014.4_sup_lh_V1.label.out'
'MAC_CON_014.4_sup_rh_V1.label.out'
'MAC_CON_014.5_inf_lh_V1.label.out'
'MAC_CON_014.5_inf_rh_V1.label.out'
'MAC_CON_014.6_inf_lh_V1.label.out'
'MAC_CON_014.6_inf_rh_V1.label.out'
'MAC_CON_014.7_inf_lh_V1.label.out'
'MAC_CON_014.7_inf_rh_V1.label.out'
'MAC_CON_014.8_inf_lh_V1.label.out'
'MAC_CON_014.8_inf_rh_V1.label.out'
'MAC_CON_016.1_sup_lh_V1.label.out'
'MAC_CON_016.1_sup_rh_V1.label.out'
'MAC_CON_016.2_sup_lh_V1.label.out'
'MAC_CON_016.2_sup_rh_V1.label.out'
'MAC_CON_016.3_sup_lh_V1.label.out'
'MAC_CON_016.3_sup_rh_V1.label.out'
'MAC_CON_016.4_sup_lh_V1.label.out'
'MAC_CON_016.4_sup_rh_V1.label.out'
'MAC_CON_016.5_inf_lh_V1.label.out'
'MAC_CON_016.5_inf_rh_V1.label.out'
'MAC_CON_016.6_inf_lh_V1.label.out'
'MAC_CON_016.6_inf_rh_V1.label.out'
'MAC_CON_016.7_inf_lh_V1.label.out'
'MAC_CON_016.7_inf_rh_V1.label.out'
'MAC_CON_016.8_inf_lh_V1.label.out'
'MAC_CON_016.8_inf_rh_V1.label.out'
'MAC_CON_019.1_sup_lh_V1.label.out'
'MAC_CON_019.1_sup_rh_V1.label.out'
'MAC_CON_019.2_sup_lh_V1.label.out'
'MAC_CON_019.2_sup_rh_V1.label.out'
'MAC_CON_019.3_sup_lh_V1.label.out'
'MAC_CON_019.3_sup_rh_V1.label.out'
'MAC_CON_019.4_sup_lh_V1.label.out'
'MAC_CON_019.4_sup_rh_V1.label.out'
'MAC_CON_019.5_inf_lh_V1.label.out'
'MAC_CON_019.5_inf_rh_V1.label.out'
'MAC_CON_019.6_inf_lh_V1.label.out'
'MAC_CON_019.6_inf_rh_V1.label.out'
'MAC_CON_019.7_inf_lh_V1.label.out'
'MAC_CON_019.7_inf_rh_V1.label.out'
'MAC_CON_019.8_inf_lh_V1.label.out'
'MAC_CON_019.8_inf_rh_V1.label.out'
'MAC_CON_024.1_sup_lh_V1.label.out'
'MAC_CON_024.1_sup_rh_V1.label.out'
'MAC_CON_024.2_sup_lh_V1.label.out'
'MAC_CON_024.2_sup_rh_V1.label.out'
'MAC_CON_024.3_sup_lh_V1.label.out'
'MAC_CON_024.3_sup_rh_V1.label.out'
'MAC_CON_024.4_sup_lh_V1.label.out'
'MAC_CON_024.4_sup_rh_V1.label.out'
'MAC_CON_024.5_inf_lh_V1.label.out'
'MAC_CON_024.5_inf_rh_V1.label.out'
'MAC_CON_024.6_inf_lh_V1.label.out'
'MAC_CON_024.6_inf_rh_V1.label.out'
'MAC_CON_024.7_inf_lh_V1.label.out'
'MAC_CON_024.7_inf_rh_V1.label.out'
'MAC_CON_024.8_inf_lh_V1.label.out'
'MAC_CON_024.8_inf_rh_V1.label.out'
'MAC_CON_025.1_sup_lh_V1.label.out'
'MAC_CON_025.1_sup_rh_V1.label.out'
'MAC_CON_025.2_sup_lh_V1.label.out'
'MAC_CON_025.2_sup_rh_V1.label.out'
'MAC_CON_025.3_sup_lh_V1.label.out'
'MAC_CON_025.3_sup_rh_V1.label.out'
'MAC_CON_025.4_sup_lh_V1.label.out'
'MAC_CON_025.4_sup_rh_V1.label.out'
'MAC_CON_025.5_inf_lh_V1.label.out'
'MAC_CON_025.5_inf_rh_V1.label.out'
'MAC_CON_025.6_inf_lh_V1.label.out'
'MAC_CON_025.6_inf_rh_V1.label.out'
'MAC_CON_025.7_inf_lh_V1.label.out'
'MAC_CON_025.7_inf_rh_V1.label.out'
'MAC_CON_025.8_inf_lh_V1.label.out'
'MAC_CON_025.8_inf_rh_V1.label.out'
'MAC_CON_026.1_sup_lh_V1.label.out'
'MAC_CON_026.1_sup_rh_V1.label.out'
'MAC_CON_026.2_sup_lh_V1.label.out'
'MAC_CON_026.2_sup_rh_V1.label.out'
'MAC_CON_026.3_sup_lh_V1.label.out'
'MAC_CON_026.3_sup_rh_V1.label.out'
'MAC_CON_026.4_sup_lh_V1.label.out'
'MAC_CON_026.4_sup_rh_V1.label.out'
'MAC_CON_026.5_inf_lh_V1.label.out'
'MAC_CON_026.5_inf_rh_V1.label.out'
'MAC_CON_026.6_inf_lh_V1.label.out'
'MAC_CON_026.6_inf_rh_V1.label.out'
'MAC_CON_026.7_inf_lh_V1.label.out'
'MAC_CON_026.7_inf_rh_V1.label.out'
'MAC_CON_026.8_inf_lh_V1.label.out'
'MAC_CON_026.8_inf_rh_V1.label.out'
'MAC_CON_028.1_sup_lh_V1.label.out'
'MAC_CON_028.1_sup_rh_V1.label.out'
'MAC_CON_028.2_sup_lh_V1.label.out'
'MAC_CON_028.2_sup_rh_V1.label.out'
'MAC_CON_028.3_sup_lh_V1.label.out'
'MAC_CON_028.3_sup_rh_V1.label.out'
'MAC_CON_028.4_sup_lh_V1.label.out'
'MAC_CON_028.4_sup_rh_V1.label.out'
'MAC_CON_028.5_inf_lh_V1.label.out'
'MAC_CON_028.5_inf_rh_V1.label.out'
'MAC_CON_028.6_inf_lh_V1.label.out'
'MAC_CON_028.6_inf_rh_V1.label.out'
'MAC_CON_028.7_inf_lh_V1.label.out'
'MAC_CON_028.7_inf_rh_V1.label.out'
'MAC_CON_028.8_inf_lh_V1.label.out'
'MAC_CON_028.8_inf_rh_V1.label.out'
'MAC_CON_08.1_sup_lh_V1.label.out'
'MAC_CON_08.1_sup_rh_V1.label.out'
'MAC_CON_08.2_sup_lh_V1.label.out'
'MAC_CON_08.2_sup_rh_V1.label.out'
'MAC_CON_08.3_sup_lh_V1.label.out'
'MAC_CON_08.3_sup_rh_V1.label.out'
'MAC_CON_08.4_sup_lh_V1.label.out'
'MAC_CON_08.4_sup_rh_V1.label.out'
'MAC_CON_08.5_inf_lh_V1.label.out'
'MAC_CON_08.5_inf_rh_V1.label.out'
'MAC_CON_08.6_inf_lh_V1.label.out'
'MAC_CON_08.6_inf_rh_V1.label.out'
'MAC_CON_08.7_inf_lh_V1.label.out'
'MAC_CON_08.7_inf_rh_V1.label.out'
'MAC_CON_08.8_inf_lh_V1.label.out'
'MAC_CON_08.8_inf_rh_V1.label.out'
'MAC_DE_011.1_sup_lh_V1.label.out'
'MAC_DE_011.1_sup_rh_V1.label.out'
'MAC_DE_011.2_sup_lh_V1.label.out'
'MAC_DE_011.2_sup_rh_V1.label.out'
'MAC_DE_011.3_sup_lh_V1.label.out'
'MAC_DE_011.3_sup_rh_V1.label.out'
'MAC_DE_011.4_sup_lh_V1.label.out'
'MAC_DE_011.4_sup_rh_V1.label.out'
'MAC_DE_011.5_inf_lh_V1.label.out'
'MAC_DE_011.5_inf_rh_V1.label.out'
'MAC_DE_011.6_inf_lh_V1.label.out'
'MAC_DE_011.6_inf_rh_V1.label.out'
'MAC_DE_011.7_inf_lh_V1.label.out'
'MAC_DE_011.7_inf_rh_V1.label.out'
'MAC_DE_011.8_inf_lh_V1.label.out'
'MAC_DE_011.8_inf_rh_V1.label.out'
'MAC_DE_013.1_sup_lh_V1.label.out'
'MAC_DE_013.1_sup_rh_V1.label.out'
'MAC_DE_013.2_sup_lh_V1.label.out'
'MAC_DE_013.2_sup_rh_V1.label.out'
'MAC_DE_013.3_sup_lh_V1.label.out'
'MAC_DE_013.3_sup_rh_V1.label.out'
'MAC_DE_013.4_sup_lh_V1.label.out'
'MAC_DE_013.4_sup_rh_V1.label.out'
'MAC_DE_013.5_inf_lh_V1.label.out'
'MAC_DE_013.5_inf_rh_V1.label.out'
'MAC_DE_013.6_inf_lh_V1.label.out'
'MAC_DE_013.6_inf_rh_V1.label.out'
'MAC_DE_013.7_inf_lh_V1.label.out'
'MAC_DE_013.7_inf_rh_V1.label.out'
'MAC_DE_013.8_inf_lh_V1.label.out'
'MAC_DE_013.8_inf_rh_V1.label.out'
'MAC_DE_014.1_sup_lh_V1.label.out'
'MAC_DE_014.1_sup_rh_V1.label.out'
'MAC_DE_014.2_sup_lh_V1.label.out'
'MAC_DE_014.2_sup_rh_V1.label.out'
'MAC_DE_014.3_sup_lh_V1.label.out'
'MAC_DE_014.3_sup_rh_V1.label.out'
'MAC_DE_014.4_sup_lh_V1.label.out'
'MAC_DE_014.4_sup_rh_V1.label.out'
'MAC_DE_014.5_inf_lh_V1.label.out'
'MAC_DE_014.5_inf_rh_V1.label.out'
'MAC_DE_014.6_inf_lh_V1.label.out'
'MAC_DE_014.6_inf_rh_V1.label.out'
'MAC_DE_014.7_inf_lh_V1.label.out'
'MAC_DE_014.7_inf_rh_V1.label.out'
'MAC_DE_014.8_inf_lh_V1.label.out'
'MAC_DE_014.8_inf_rh_V1.label.out'
'MAC_DE_016.1_sup_lh_V1.label.out'
'MAC_DE_016.1_sup_rh_V1.label.out'
'MAC_DE_016.2_sup_lh_V1.label.out'
'MAC_DE_016.2_sup_rh_V1.label.out'
'MAC_DE_016.3_sup_lh_V1.label.out'
'MAC_DE_016.3_sup_rh_V1.label.out'
'MAC_DE_016.4_sup_lh_V1.label.out'
'MAC_DE_016.4_sup_rh_V1.label.out'
'MAC_DE_016.5_inf_lh_V1.label.out'
'MAC_DE_016.5_inf_rh_V1.label.out'
'MAC_DE_016.6_inf_lh_V1.label.out'
'MAC_DE_016.6_inf_rh_V1.label.out'
'MAC_DE_016.7_inf_lh_V1.label.out'
'MAC_DE_016.7_inf_rh_V1.label.out'
'MAC_DE_016.8_inf_lh_V1.label.out'
'MAC_DE_016.8_inf_rh_V1.label.out'
'MAC_DE_019.1_sup_lh_V1.label.out'
'MAC_DE_019.1_sup_rh_V1.label.out'
'MAC_DE_019.2_sup_lh_V1.label.out'
'MAC_DE_019.2_sup_rh_V1.label.out'
'MAC_DE_019.3_sup_lh_V1.label.out'
'MAC_DE_019.3_sup_rh_V1.label.out'
'MAC_DE_019.4_sup_lh_V1.label.out'
'MAC_DE_019.4_sup_rh_V1.label.out'
'MAC_DE_019.5_inf_lh_V1.label.out'
'MAC_DE_019.5_inf_rh_V1.label.out'
'MAC_DE_019.6_inf_lh_V1.label.out'
'MAC_DE_019.6_inf_rh_V1.label.out'
'MAC_DE_019.7_inf_lh_V1.label.out'
'MAC_DE_019.7_inf_rh_V1.label.out'
'MAC_DE_019.8_inf_lh_V1.label.out'
'MAC_DE_019.8_inf_rh_V1.label.out'
'MAC_DE_021.1_sup_lh_V1.label.out'
'MAC_DE_021.1_sup_rh_V1.label.out'
'MAC_DE_021.2_sup_lh_V1.label.out'
'MAC_DE_021.2_sup_rh_V1.label.out'
'MAC_DE_021.3_sup_lh_V1.label.out'
'MAC_DE_021.3_sup_rh_V1.label.out'
'MAC_DE_021.4_sup_lh_V1.label.out'
'MAC_DE_021.4_sup_rh_V1.label.out'
'MAC_DE_021.5_inf_lh_V1.label.out'
'MAC_DE_021.5_inf_rh_V1.label.out'
'MAC_DE_021.6_inf_lh_V1.label.out'
'MAC_DE_021.6_inf_rh_V1.label.out'
'MAC_DE_021.7_inf_lh_V1.label.out'
'MAC_DE_021.7_inf_rh_V1.label.out'
'MAC_DE_021.8_inf_lh_V1.label.out'
'MAC_DE_021.8_inf_rh_V1.label.out'
'MAC_DE_024.1_sup_lh_V1.label.out'
'MAC_DE_024.1_sup_rh_V1.label.out'
'MAC_DE_024.2_sup_lh_V1.label.out'
'MAC_DE_024.2_sup_rh_V1.label.out'
'MAC_DE_024.3_sup_lh_V1.label.out'
'MAC_DE_024.3_sup_rh_V1.label.out'
'MAC_DE_024.4_sup_lh_V1.label.out'
'MAC_DE_024.4_sup_rh_V1.label.out'
'MAC_DE_024.5_inf_lh_V1.label.out'
'MAC_DE_024.5_inf_rh_V1.label.out'
'MAC_DE_024.6_inf_lh_V1.label.out'
'MAC_DE_024.6_inf_rh_V1.label.out'
'MAC_DE_024.7_inf_lh_V1.label.out'
'MAC_DE_024.7_inf_rh_V1.label.out'
'MAC_DE_024.8_inf_lh_V1.label.out'
'MAC_DE_024.8_inf_rh_V1.label.out'
'MAC_DE_025.1_sup_lh_V1.label.out'
'MAC_DE_025.1_sup_rh_V1.label.out'
'MAC_DE_025.2_sup_lh_V1.label.out'
'MAC_DE_025.2_sup_rh_V1.label.out'
'MAC_DE_025.3_sup_lh_V1.label.out'
'MAC_DE_025.3_sup_rh_V1.label.out'
'MAC_DE_025.4_sup_lh_V1.label.out'
'MAC_DE_025.4_sup_rh_V1.label.out'
'MAC_DE_025.5_inf_lh_V1.label.out'
'MAC_DE_025.5_inf_rh_V1.label.out'
'MAC_DE_025.6_inf_lh_V1.label.out'
'MAC_DE_025.6_inf_rh_V1.label.out'
'MAC_DE_025.7_inf_lh_V1.label.out'
'MAC_DE_025.7_inf_rh_V1.label.out'
'MAC_DE_025.8_inf_lh_V1.label.out'
'MAC_DE_025.8_inf_rh_V1.label.out'
'MAC_DE_026.1_sup_lh_V1.label.out'
'MAC_DE_026.1_sup_rh_V1.label.out'
'MAC_DE_026.2_sup_lh_V1.label.out'
'MAC_DE_026.2_sup_rh_V1.label.out'
'MAC_DE_026.3_sup_lh_V1.label.out'
'MAC_DE_026.3_sup_rh_V1.label.out'
'MAC_DE_026.4_sup_lh_V1.label.out'
'MAC_DE_026.4_sup_rh_V1.label.out'
'MAC_DE_026.5_inf_lh_V1.label.out'
'MAC_DE_026.5_inf_rh_V1.label.out'
'MAC_DE_026.6_inf_lh_V1.label.out'
'MAC_DE_026.6_inf_rh_V1.label.out'
'MAC_DE_026.7_inf_lh_V1.label.out'
'MAC_DE_026.7_inf_rh_V1.label.out'
'MAC_DE_026.8_inf_lh_V1.label.out'
'MAC_DE_026.8_inf_rh_V1.label.out'
'MAC_DE_028.1_sup_lh_V1.label.out'
'MAC_DE_028.1_sup_rh_V1.label.out'
'MAC_DE_028.2_sup_lh_V1.label.out'
'MAC_DE_028.2_sup_rh_V1.label.out'
'MAC_DE_028.3_sup_lh_V1.label.out'
'MAC_DE_028.3_sup_rh_V1.label.out'
'MAC_DE_028.4_sup_lh_V1.label.out'
'MAC_DE_028.4_sup_rh_V1.label.out'
'MAC_DE_028.5_inf_lh_V1.label.out'
'MAC_DE_028.5_inf_rh_V1.label.out'
'MAC_DE_028.6_inf_lh_V1.label.out'
'MAC_DE_028.6_inf_rh_V1.label.out'
'MAC_DE_028.7_inf_lh_V1.label.out'
'MAC_DE_028.7_inf_rh_V1.label.out'
'MAC_DE_028.8_inf_lh_V1.label.out'
'MAC_DE_028.8_inf_rh_V1.label.out'
'MAC_DE_08.1_sup_lh_V1.label.out'
'MAC_DE_08.1_sup_rh_V1.label.out'
'MAC_DE_08.2_sup_lh_V1.label.out'
'MAC_DE_08.2_sup_rh_V1.label.out'
'MAC_DE_08.3_sup_lh_V1.label.out'
'MAC_DE_08.3_sup_rh_V1.label.out'
'MAC_DE_08.4_sup_lh_V1.label.out'
'MAC_DE_08.4_sup_rh_V1.label.out'
'MAC_DE_08.5_inf_lh_V1.label.out'
'MAC_DE_08.5_inf_rh_V1.label.out'
'MAC_DE_08.6_inf_lh_V1.label.out'
'MAC_DE_08.6_inf_rh_V1.label.out'
'MAC_DE_08.7_inf_lh_V1.label.out'
'MAC_DE_08.7_inf_rh_V1.label.out'
'MAC_DE_08.8_inf_lh_V1.label.out'
'MAC_DE_08.8_inf_rh_V1.label.out'
};
end

%% read in the files
for i = 1:length(label_files)
    
fid = fopen(label_files{i});

CT_DATA = textscan(fid, '%s%s%s%s%s%s%s%s%s%s%s%s%s','Headerlines', 1,'EmptyValue', NaN,'CommentStyle','*');

fclose(fid);

%data of interest
tempctstring = CT_DATA{1,5}(52);


storesublabel(i,1) = tempctstring;

tempctstring = [];

end
storesublabel(:,2) =  label_files;

g = 1;

for x = 1:(length(storesublabel)/16)
    temp1 = str2num(storesublabel{g,1,1});
    temp2 = str2num(storesublabel{g+1,1});
    temp3 = str2num(storesublabel{g+2,1});
    temp4 = str2num(storesublabel{g+3,1});
    temp5 = str2num(storesublabel{g+4,1});
    temp6 = str2num(storesublabel{g+5,1});
    temp7 = str2num(storesublabel{g+6,1});
    temp8 = str2num(storesublabel{g+7,1});
    temp9 = str2num(storesublabel{g+8,1});
    temp10 = str2num(storesublabel{g+9,1});
    temp11 = str2num(storesublabel{g+10,1});
    temp12 = str2num(storesublabel{g+11,1});
    temp13 = str2num(storesublabel{g+12,1});
    temp14 = str2num(storesublabel{g+13,1});
    temp15 = str2num(storesublabel{g+14,1});
    temp16 = str2num(storesublabel{g+15,1});
    
    storeaverage{x,1} = (temp1 + temp2 + temp9 + temp10)/4 ;
    storeaverage{x,2} = (temp3 + temp4 + temp11 + temp12)/4 ;
    storeaverage{x,3} = (temp5 + temp6 + temp13 + temp14)/4 ;
    storeaverage{x,4} = (temp7 + temp8 + temp15 + temp16)/4 ;
    g = g + 16;
    
    
end

youngadult = cell2mat(storeaverage(1:11,:));
olderHadult = cell2mat(storeaverage(12:22,:));
macdadult = cell2mat(storeaverage(23:33,:));

data = youngadult'; yameans = mean(data');
data = olderHadult'; oameans = mean(data');
data =macdadult'; macdameans = mean(data');

g = 1;
for x = 1:16
    z(1:22,x) = a(g:g+21,2);
   
    
    g = g +22;
end
data = z;
[matrix] = reformat_BWAOV2_trainedvsUntrained(data);
BWAOV2(matrix)
mixed_between_within_anova(matrix)
% 
% '     Source                          SSq        df       MSq         F         p        
% -------------------------------------------------------------------------------------
%      Between-subjects factor    3725.153         1  3725.153     1.560 0.2260478
%      Between-subjects error    47750.010        20  2387.501
%      Within-subjects factor    189240.080        15 12616.005    24.341 0.0000000
%      Within x between int.     13941.532        15   929.435     1.793 0.0348694
%      Within-subjects error     155489.468       300   518.298
    
figure

[nconditions nsubject] = size(data);

MeanSubtractedData=data-repmat(mean(data,1),nconditions,1);

withinSubjectStandardError=std(MeanSubtractedData,0,2)/sqrt(nsubject); 

bar(mean(data'))
hold on

errorbar(mean(data'), withinSubjectStandardError)

data = data';
size(data);
con = data(1:11,:);
macd = data(12:22,:);
con =con';
macd = macd';
[nconditions nsubject] = size(con);

MeanSubtractedData=con-repmat(mean(con,1),nconditions,1);

withinSubjectStandardError=std(MeanSubtractedData,0,2)/sqrt(nsubject); 


bar(mean(con'))
hold on
errorbar(mean(con'), withinSubjectStandardError)

figure
[nconditions nsubject] = size(macd);

MeanSubtractedData=macd-repmat(mean(macd,1),nconditions,1);

withinSubjectStandardError=std(MeanSubtractedData,0,2)/sqrt(nsubject); 

bar(mean(macd'))
hold on
errorbar(mean(macd'), withinSubjectStandardError)


