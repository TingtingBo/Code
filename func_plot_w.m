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
con = 1;
con = 0;

for i = 1:n_subjects
    
    scon_dir = con_dir;
    
    sub_con_dir = fullfile(con_dir, subjects(i).name);
    
    cd(sub_con_dir);
    %if exist('ConnectivityProfile_rest1.mat');
    sub_con = load('ConnectivityProfile_rest2.mat');
    %else
    %sub_con = load('ConnectivityProfile_rest2.mat');
    %end
    cor = sub_con.correlation.z_score;
    list = sub_con.list(1:n_rois);
    
    for j = 1:n_rois
        
        % ROI 1 to R/L V1
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

if con ==1
    storeconr = series_r;
    storeconl =  series_l;
    clearvars -except storeconr storeconl
end
%%
sz = 15;
for i = 1:n_rois
    
%     plot_series_r = [mean(series_r.all_val{i}(:,1)); mean(series_r.all_val{i}(:,2)); mean(series_r.all_val{i}(:,3)); mean(series_r.all_val{i}(:,4)); mean(series_r.all_val{i}(:,5)); mean(series_r.all_val{i}(:,6)); mean(series_r.all_val{i}(:,7)); mean(series_r.all_val{i}(:,8)); mean(series_r.all_val{i}(:,9))];
%     plot_series_l = [mean(series_l.all_val{i}(:,1)); mean(series_l.all_val{i}(:,2)); mean(series_l.all_val{i}(:,3)); mean(series_l.all_val{i}(:,4)); mean(series_l.all_val{i}(:,5)); mean(series_l.all_val{i}(:,6)); mean(series_l.all_val{i}(:,7)); mean(series_l.all_val{i}(:,8)); mean(series_l.all_val{i}(:,9))];
%     
%     
%     h = figure;
%     
%     error_r = std_error(series_r.all_val{i}, n_subjects);
%     error_l = std_error(series_l.all_val{i}, n_subjects);

    plot_series_r = [mean(series_r.all_val{i}(:,1)); mean(series_r.all_val{i}(:,2)); mean(series_r.all_val{i}(:,3)); mean(series_r.all_val{i}(:,4)); mean(series_r.all_val{i}(:,5)); mean(series_r.all_val{i}(:,6)); mean(series_r.all_val{i}(:,7)); mean(series_r.all_val{i}(:,8)); mean(series_r.all_val{i}(:,9))];
    plot_series_l = [mean(series_l.all_val{i}(:,1)); mean(series_l.all_val{i}(:,2)); mean(series_l.all_val{i}(:,3)); mean(series_l.all_val{i}(:,4)); mean(series_l.all_val{i}(:,5)); mean(series_l.all_val{i}(:,6)); mean(series_l.all_val{i}(:,7)); mean(series_l.all_val{i}(:,8)); mean(series_l.all_val{i}(:,9))];
    
    plot_series_r = [(plot_series_r+ plot_series_l)/2];
    
    plot_series_rcon = [mean(storeconr.all_val{i}(:,1)); mean(storeconr.all_val{i}(:,2)); mean(storeconr.all_val{i}(:,3)); mean(storeconr.all_val{i}(:,4)); mean(storeconr.all_val{i}(:,5)); mean(storeconr.all_val{i}(:,6)); mean(storeconr.all_val{i}(:,7)); mean(storeconr.all_val{i}(:,8)); mean(storeconr.all_val{i}(:,9))];
    plot_series_lcon =   [mean(storeconl.all_val{i}(:,1)); mean(storeconl.all_val{i}(:,2)); mean(storeconl.all_val{i}(:,3)); mean(storeconl.all_val{i}(:,4)); mean(storeconl.all_val{i}(:,5)); mean(storeconl.all_val{i}(:,6)); mean(storeconl.all_val{i}(:,7)); mean(storeconl.all_val{i}(:,8)); mean(storeconl.all_val{i}(:,9))];
   
    plot_series_rcon = [(plot_series_rcon + plot_series_lcon)/2];
    h = figure;
 
    error_r = std_error(series_r.all_val{i}, n_subjects); 
    error_r2 = std_error(series_l.all_val{i}, n_subjects);
    error_r = (error_r + error_r2)/2;
    error_rCon = std_error(storeconr.all_val{i}, n_subjects); 
    error_rCon2 = std_error(storeconl.all_val{i}, n_subjects);
    error_rCon = (error_rCon + error_rCon2)/2;

    
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
    title([list(i) ' ' 'to V1']);
    t=get(gca,'Title');
    set(t,'FontSize',sz);
    set(gca,'XTick', [1:9]); 
    set(gca,'xtickLabel',  roi_name);
    ylabel('Z-score');
    M = ['Right V1' 'Left V1'];
    legend(gca, 'Con', 'MacD');
    
    
        
        
    fig(h,'border', 'off', 'units', 'inches', 'width', 10, 'height', 10 );
    box on
    set(gcf, 'Visible','off')
    cd '/media/store3/Projects/Wess/subjects/Figs_MD_AND_CON_REST_FC_2'
      
    out_file = strcat(list{i}, num2str(i));
    export_fig(h, eval('out_file'), '-jpg');
end 
    
    
list =   {'PostCingulate','dACCmsFC','lMidOccipital','rFrontalC','rLingual','rTPJ','rThalamus','lFusiform','rFusiform','lIPS','rIPS','lPrecuneus','rPrecuneus','laIfO','raIfO','dACCmsFC','lAntFusiform','lIPL','lMidOccipital','laIfO','raIfO','vmPFC','lTempPole','rTempPole','lMidTemporal','rMidTemporal','lPostCingulate','rPostCingulate','lPostTemporal','rPostTemporal','lTPJ','rTPJ','MPFC','OFC_MPFC_vACC','PCCPrecuneus','lIPC','lPHG','ldlPFC','rIPC','lIPS','rIPS','lFEF','rFEF','rAG','HeschlLatL','HeschlLatR','HeschlMedL','HeschlMedR','lFusiform','rFusiform','DorsalStreamV5';};
 for i = 1:n_rois

    roi_series_r = (storeMDrR.all_val{i} + storeMDlR.all_val{i})/2;
    roi_series_r(:,10) = 1; roi_series_r(:,11) = 1;
    roi_series_l = (storeconrR.all_val{i} + storeconlR.all_val{i})/2;
    roi_series_l(:,10) = 0; roi_series_l(:,11) = 1;
    roi_series_mdT = (storeMDrT.all_val{i} + storeMDlT.all_val{i})/2;
    roi_series_mdT(:,10) = 1; roi_series_mdT(:,11) = 0;
    roi_series_conT = (storeconrT.all_val{i} + storeconlT.all_val{i})/2;
    roi_series_conT(:,10) = 0; roi_series_conT(:,11) = 0;
    
    roi_data = vertcat(roi_series_r, roi_series_l, roi_series_mdT, roi_series_conT);

    cd('/media/store3/Projects/Wess/subjects/Extracted_data');
    out_dat = strcat(list{i}, num2str(i), '_fcdata', '.txt');
    dlmwrite(eval('out_dat'), roi_data, 'delimiter', '\t', 'precision', 6);
  
end


