%load('MD_PRL_MODUL.mat')
clear all 
addpath('/media/store4/Projects/Elkhetali/LOAf/AE/BlockAuto');addpath('/home/abdurahman/Desktop/codes')
addpath('/media/store3/Projects/Joe/LANES_FMRI/A/FMRI_Scripts/Analysis_Scripts');
% LOAF Directory
con_dir = '/media/store4/Projects/Richard/WesVisionConnectivity/Connectivity Profiles/MAC_DE';
cd(con_dir);
subjects = dir('MAC_DE*');

%maccon 19 and 26 have no task
%macDe 26 has no task

% LANES Directory
%con_dir = '/media/store4/Projects/Richard/WesVisionConnectivity/Connectivity Profiles/EEG_fMRI';
%cd(con_dir);
%subjects = dir('EEG*');

% VINES Directory
%con_dir = '/media/store4/Projects/Richard/WesVisionConnectivity/Connectivity Profiles/VINES';
%cd(con_dir);
%subjects = dir('10*');

% Pre-allocating for R/L ROIs to R/L V1
series_r = {};
series_l = {};

roi_name = { '1' '2' '3' '4' '5' '6' '7' '8' '9' }; 

n_rois = 51;
n_subjects = length(subjects);
% to store data for gorup analysis
con = 1;
con = 0;
rest = 1;
rest = 0;


for i = 1:n_subjects
    
    scon_dir = con_dir;
    
    sub_con_dir = fullfile(con_dir, subjects(i).name);
    
    cd(sub_con_dir);
    %if exist('ConnectivityProfile_rest1.mat');
    sub_con = load('ConnectivityProfile_rest1.mat');
    %else
    %sub_con = load('ConnectivityProfile_rest2.mat');
    %end
    cor = sub_con.correlation.z_score;
    list = sub_con.list(1:n_rois);
    
    for j = 1:n_rois
        
        % ROI 1 to 9 for left and right hemi
        series_r.sub_val{i,j} = [ cor(j,53); cor(j,55); cor(j, 57); cor(j, 59); cor(j, 61); cor(j, 63); cor(j, 65); cor(j, 67); cor(j, 69)];
        series_l.sub_val{i,j} = [ cor(j,52); cor(j,54); cor(j, 56); cor(j, 58); cor(j, 60); cor(j, 62); cor(j, 64); cor(j, 66); cor(j, 68)];
        
     
    end
    
    
end

for k = 1:n_rois

    series_r.all_val{k} = horzcat(series_r.sub_val{:,k});
    series_r.all_val{k} = transpose(series_r.all_val{k});
    
            
    series_l.all_val{k} = horzcat(series_l.sub_val{:,k});
    series_l.all_val{k} = transpose(series_l.all_val{k});
    
end


% store data for use later
if con ==1
    if rest == 0
        storeconrT = series_r;
        storeconlT =  series_l;
       clearvars -except storeconrT storeconlT storeconrR storeconlR storeMDrR storeMDlR storeMDrT storeMDlT

    else
        storeconrR = series_r;
        storeconlR =  series_l;
     clearvars -except storeconrT storeconlT storeconrR storeconlR storeMDrR storeMDlR storeMDrT storeMDlT

    end
else
    if rest == 1
        storeMDrR = series_r;
        storeMDlR = series_l;
        clearvars -except storeconrT storeconlT storeconrR storeconlR storeMDrR storeMDlR storeMDrT storeMDlT
    else
        storeMDrT = series_r;
        storeMDlT = series_l;
        clearvars -except storeconrT storeconlT storeconrR storeconlR storeMDrR storeMDlR storeMDrT storeMDlT

    end
end
%%
sz = 16; % size of figures
for i = 1:n_rois
    
%     plot_series_r = [mean(series_r.all_val{i}(:,1)); mean(series_r.all_val{i}(:,2)); mean(series_r.all_val{i}(:,3)); mean(series_r.all_val{i}(:,4)); mean(series_r.all_val{i}(:,5)); mean(series_r.all_val{i}(:,6)); mean(series_r.all_val{i}(:,7)); mean(series_r.all_val{i}(:,8)); mean(series_r.all_val{i}(:,9))];
%     plot_series_l = [mean(series_l.all_val{i}(:,1)); mean(series_l.all_val{i}(:,2)); mean(series_l.all_val{i}(:,3)); mean(series_l.all_val{i}(:,4)); mean(series_l.all_val{i}(:,5)); mean(series_l.all_val{i}(:,6)); mean(series_l.all_val{i}(:,7)); mean(series_l.all_val{i}(:,8)); mean(series_l.all_val{i}(:,9))];
%     
%     
%     h = figure;
%     
%     error_r = std_error(series_r.all_val{i}, n_subjects);
%     error_l = std_error(series_l.all_val{i}, n_subjects);

    plot_series_r = [mean(storeMDrT.all_val{i}(:,1)); mean(storeMDrT.all_val{i}(:,2)); mean(storeMDrT.all_val{i}(:,3)); mean(storeMDrT.all_val{i}(:,4)); mean(storeMDrT.all_val{i}(:,5)); mean(storeMDrT.all_val{i}(:,6)); mean(storeMDrT.all_val{i}(:,7)); mean(storeMDrT.all_val{i}(:,8)); mean(storeMDrT.all_val{i}(:,9))];
    plot_series_l = [mean(storeMDlT.all_val{i}(:,1)); mean(storeMDlT.all_val{i}(:,2)); mean(storeMDlT.all_val{i}(:,3)); mean(storeMDlT.all_val{i}(:,4)); mean(storeMDlT.all_val{i}(:,5)); mean(storeMDlT.all_val{i}(:,6)); mean(storeMDlT.all_val{i}(:,7)); mean(storeMDlT.all_val{i}(:,8)); mean(storeMDlT.all_val{i}(:,9))];
    plot_series_rR = [mean(storeMDrR.all_val{i}(:,1)); mean(storeMDrR.all_val{i}(:,2)); mean(storeMDrR.all_val{i}(:,3)); mean(storeMDrR.all_val{i}(:,4)); mean(storeMDrR.all_val{i}(:,5)); mean(storeMDrR.all_val{i}(:,6)); mean(storeMDrR.all_val{i}(:,7)); mean(storeMDrR.all_val{i}(:,8)); mean(storeMDrR.all_val{i}(:,9))];
    plot_series_lR = [mean(storeMDlR.all_val{i}(:,1)); mean(storeMDlR.all_val{i}(:,2)); mean(storeMDlR.all_val{i}(:,3)); mean(storeMDlR.all_val{i}(:,4)); mean(storeMDlR.all_val{i}(:,5)); mean(storeMDlR.all_val{i}(:,6)); mean(storeMDlR.all_val{i}(:,7)); mean(storeMDlR.all_val{i}(:,8)); mean(storeMDlR.all_val{i}(:,9))];
    plot_series_r = [((plot_series_rR)+ (plot_series_lR))/2];

    
    plot_series_rcon = [mean(storeconrT.all_val{i}(:,1)); mean(storeconrT.all_val{i}(:,2)); mean(storeconrT.all_val{i}(:,3)); mean(storeconrT.all_val{i}(:,4)); mean(storeconrT.all_val{i}(:,5)); mean(storeconrT.all_val{i}(:,6)); mean(storeconrT.all_val{i}(:,7)); mean(storeconrT.all_val{i}(:,8)); mean(storeconrT.all_val{i}(:,9))];
    plot_series_lcon = [mean(storeconlT.all_val{i}(:,1)); mean(storeconlT.all_val{i}(:,2)); mean(storeconlT.all_val{i}(:,3)); mean(storeconlT.all_val{i}(:,4)); mean(storeconlT.all_val{i}(:,5)); mean(storeconlT.all_val{i}(:,6)); mean(storeconlT.all_val{i}(:,7)); mean(storeconlT.all_val{i}(:,8)); mean(storeconlT.all_val{i}(:,9))];
    plot_series_rconR = [mean(storeconrR.all_val{i}(:,1)); mean(storeconrR.all_val{i}(:,2)); mean(storeconrR.all_val{i}(:,3)); mean(storeconrR.all_val{i}(:,4)); mean(storeconrR.all_val{i}(:,5)); mean(storeconrR.all_val{i}(:,6)); mean(storeconrR.all_val{i}(:,7)); mean(storeconrR.all_val{i}(:,8)); mean(storeconrR.all_val{i}(:,9))];
    plot_series_lconR = [mean(storeconlR.all_val{i}(:,1)); mean(storeconlR.all_val{i}(:,2)); mean(storeconlR.all_val{i}(:,3)); mean(storeconlR.all_val{i}(:,4)); mean(storeconlR.all_val{i}(:,5)); mean(storeconlR.all_val{i}(:,6)); mean(storeconlR.all_val{i}(:,7)); mean(storeconlR.all_val{i}(:,8)); mean(storeconlR.all_val{i}(:,9))];
    plot_series_rcon = [(( plot_series_rconR) + ( plot_series_lconR))/2];

    
   mddiffr = storeMDrR.all_val{i};
   mddiffl = storeMDlR.all_val{i};
   mddiff = (mddiffr + mddiffl)/2;
   condiffr = storeconrR.all_val{i};
   condiffl = storeconlR.all_val{i};
   condiff = (condiffr +condiffl)/2;
    
    h = figure;
    
    error_r = std_error_ws(mddiff); 
%     error_r2 = std_error(series_l.all_val{i}, n_subjects);
%     error_r = (error_r + error_r2)/2;
    error_rCon = std_error_ws(condiff); 
%     error_rCon2 = std_error(storeconl.all_val{i}, n_subjects);
%     error_rCon = (error_rCon + error_rCon2)/2;

    % plotting stuff
    hold on;
    set(gcf, 'Visible', 'off')
    p1= plot(plot_series_rcon, '--rs');
    p2= plot(plot_series_r, '-.bo');
    errorb(plot_series_rcon,error_rCon);
    errorb(plot_series_r,error_r);
    hold off 
    axis square
    set(p1, 'LineWidth', 4)
    set(p2, 'LineWidth', 4)
    set(gca,'Fontsize',sz);
    set(gca, 'LineWidth',1.5);
    title([list(i) ' to V1']);
    t=get(gca,'Title');
    set(t,'FontSize',sz);
    set(gca,'XTick', [1:9]); 
    set(gca,'xtickLabel',  roi_name);
    ylabel('\Delta Z-score');
    M = ['Right V1' 'Left V1'];
   legend(gca, 'Con', 'MacD');
    
    
        
        
    fig(h,'border', 'off', 'units', 'inches', 'width', 6, 'height', 6 );
    box on
    set(gcf, 'Visible','off')
    cd '/media/store3/Projects/Wess/subjects/Figs_MD_AND_CON_task'
      
    out_file = strcat(list{i}, num2str(i));
    export_fig(h, eval('out_file'), '-eps');
    plot_series_r = [];
    plot_series_rcon = [];
end 
close all

 list =   {'PostCingulate','dACCmsFC','lMidOccipital','rFrontalC','rLingual','rTPJ','rThalamus','lFusiform','rFusiform','lIPS','rIPS','lPrecuneus','rPrecuneus','laIfO','raIfO','dACCmsFC','lAntFusiform','lIPL','lMidOccipital','laIfO','raIfO','vmPFC','lTempPole','rTempPole','lMidTemporal','rMidTemporal','lPostCingulate','rPostCingulate','lPostTemporal','rPostTemporal','lTPJ','rTPJ','MPFC','OFC_MPFC_vACC','PCCPrecuneus','lIPC','lPHG','ldlPFC','rIPC','lIPS','rIPS','lFEF','rFEF','rAG','HeschlLatL','HeschlLatR','HeschlMedL','HeschlMedR','lFusiform','rFusiform','DorsalStreamV5';};
 
 
 for i = 1:n_rois
    % chaned to 1:8 so that I could do an anova
    roi_series_r = (storeMDrR.all_val{i}(1:8,:) + storeMDlR.all_val{i}(1:8,:))/2;
    roi_series_r(:,10) = 1; roi_series_r(:,11) = 1;
    roi_series_l = (storeconrR.all_val{i} + storeconlR.all_val{i})/2;
    roi_series_l(:,10) = 0; roi_series_l(:,11) = 1;
    roi_series_mdT = (storeMDrT.all_val{i}(1:8,:) + storeMDlT.all_val{i}(1:8,:))/2;
    roi_series_mdT(:,10) = 1; roi_series_mdT(:,11) = 0;
    roi_series_conT = (storeconrT.all_val{i} + storeconlT.all_val{i})/2;
    roi_series_conT(:,10) = 0; roi_series_conT(:,11) = 0;
    
    roi_data = vertcat(roi_series_r, roi_series_l, roi_series_mdT, roi_series_conT);

    cd('/media/store3/Projects/Wess/subjects/Extracted_data/Module_MD');
    out_dat = strcat(list{i}, num2str(i), '_fcdata', '.txt');
    dlmwrite(eval('out_dat'), roi_data, 'delimiter', '\t', 'precision', 6);
  
end

