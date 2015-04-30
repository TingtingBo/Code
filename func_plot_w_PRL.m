clear all 
addpath('/media/store4/Projects/Elkhetali/LOAf/AE/BlockAuto');addpath('/home/abdurahman/Desktop/codes')
addpath('/media/store3/Projects/Joe/LANES_FMRI/A/FMRI_Scripts/Analysis_Scripts');
% LOAF Directory
con_dir = '/media/store4/Projects/Richard/WesVisionConnectivity/Connectivity Profiles/MAC_DE_PRL';
cd(con_dir);
subjects = dir('MAC_DE*');

% LANES Directory
%con_dir = '/media/store4/Projects/Richard/WesVisionConnectivity/Connectivity Profiles/EEG_fMRI';
%cd(con_dir);
%subjects = dir('EEG*');

% VINES Directory
%con_dir = '/media/store4/Projects/Richard/WesVisionConnectivity/Connectivity Profiles/VINES';
%cd(con_dir);
%subjects = dir('10*');

% Pre-allocating for R/L ROIs to R/L V1
series_INF = {};
series_FuncDef = {};

% roi_name = { '1' '2' '3' '4' '5' '6' '7' '8' '9' }; 
roi_name = { 'Inf' 'FuncDef' };
n_rois = 51;
n_subjects = length(subjects);
con = 1;
con = 0;
rest = 1;
rest = 0;

for i = 1:n_subjects
    
    scon_dir = con_dir;
    
    sub_con_dir = fullfile(con_dir, subjects(i).name);
    
    cd(sub_con_dir);
    %if exist('ConnectivityProfile_rest1.mat');
    sub_con = load('ConnectivityProfile_task.mat');
    %else
%     sub_con2 = load('ConnectivityProfile_rest2.mat');
    %end
    cor = sub_con.correlation.z_score;
%     cor2 = sub_con2.correlation.z_score;
    list = sub_con.list(1:n_rois);
    
    for j = 1:n_rois
        
        % ROI 1 to R/L V1
%         series_r.sub_val{i,j} = [ cor(j,53); cor(j,55); cor(j, 57); cor(j, 59); cor(j, 61); cor(j, 63); cor(j, 65); cor(j, 67); cor(j, 69)];
%         series_l.sub_val{i,j} = [ cor(j,52); cor(j,54); cor(j, 56); cor(j, 58); cor(j, 60); cor(j, 62); cor(j, 64); cor(j, 66); cor(j, 68)];
        series_INF.sub_val{i,j} = [ cor(j,53)  ];
        series_FuncDef.sub_val{i,j} = [ cor(j,52)];
  

        
     
    end
    
    
end

for k = 1:n_rois

    series_INF.all_val{k} = horzcat(series_INF.sub_val{:,k});
    series_INF.all_val{k} = transpose(series_INF.all_val{k});
    
            
    series_FuncDef.all_val{k} = horzcat(series_FuncDef.sub_val{:,k});
    series_FuncDef.all_val{k} = transpose(series_FuncDef.all_val{k});
    
end
if con ==1
    if rest == 1
        storeconInfR = series_INF;
        storeconFuncR =  series_FuncDef;
        clearvars -except storeconInfR storeconFuncR storeMDInfR storeMDFuncR storeMDInfT storeMDFuncT storeconInfT storeconFuncT
    end
    if rest == 0
        storeconInfT = series_INF;
        storeconFuncT =  series_FuncDef;
         clearvars -except storeconInfR storeconFuncR storeMDInfR storeMDFuncR storeMDInfT storeMDFuncT storeconInfT storeconFuncT
    end
end
if con ==0
    if rest == 1
        storeMDInfR = series_INF;
        storeMDFuncR =  series_FuncDef;
        clearvars -except storeconInfR storeconFuncR storeMDInfR storeMDFuncR storeMDInfT storeMDFuncT storeconInfT storeconFuncT
    end
    if rest == 0
        storeMDInfT = series_INF;
        storeMDFuncT =  series_FuncDef;
        clearvars -except storeconInfR storeconFuncR storeMDInfR storeMDFuncR storeMDInfT storeMDFuncT storeconInfT storeconFuncT
    end
end
%%
sz = 15;
for i = 1:n_rois
    
%     plot_series_r = [mean(series_r.all_val{i}(:,1)); mean(series_r.all_val{i}(:,2)); mean(series_r.all_val{i}(:,3)); mean(series_r.all_val{i}(:,4)); mean(series_r.all_val{i}(:,5)); mean(series_r.all_val{i}(:,6)); mean(series_r.all_val{i}(:,7)); mean(series_r.all_val{i}(:,8)); mean(series_r.all_val{i}(:,9))];
%     plot_series_l = [mean(series_l.all_val{i}(:,1)); mean(series_l.all_val{i}(:,2)); mean(series_l.all_val{i}(:,3)); mean(series_l.all_val{i}(:,4)); mean(series_l.all_val{i}(:,5)); mean(series_l.all_val{i}(:,6)); mean(series_l.all_val{i}(:,7)); mean(series_l.all_val{i}(:,8)); mean(series_l.all_val{i}(:,9))];
%     plot_series_r = [mean(series_INF.all_val{i}(:,1))];
%     plot_series_l = [mean(series_FuncDef.all_val{i}(:,1))];
%     plot_series_r = [plot_series_r, plot_series_l];
%     
%     plot_series_rcon = [mean(storeconInf.all_val{i}(:,1))];
%     plot_series_lcon = [mean(storeconFunc.all_val{i}(:,1))];
%     plot_series_rcon = [plot_series_rcon,  plot_series_lcon];
%% section added to do muldulation 
% md rest
    plot_series_rR = [mean(storeMDInfR.all_val{i}(:,1))];
    plot_series_lR = [mean(storeMDFuncR.all_val{i}(:,1))];
    plot_series_rR = [plot_series_rR, plot_series_lR];
% md task 
    plot_series_rT = [mean(storeMDInfT.all_val{i}(:,1))];
    plot_series_lT = [mean(storeMDFuncT.all_val{i}(:,1))];
    plot_series_rT = [plot_series_rT, plot_series_lT];
% md diff 
    plot_series_modMD = (plot_series_rT - plot_series_rR);
% Con rest
    plot_series_rconR = [mean(storeconInfR.all_val{i}(:,1))];
    plot_series_lconR = [mean(storeconFuncR.all_val{i}(:,1))];
    plot_series_rconR = [plot_series_rconR,  plot_series_lconR];
%con task
    plot_series_rconT = [mean(storeconInfT.all_val{i}(:,1))];
    plot_series_lconT = [mean(storeconFuncT.all_val{i}(:,1))];
    plot_series_rconT = [plot_series_rconT,  plot_series_lconT];
% con diff
    plot_series_modCON = (plot_series_rconT - plot_series_rconR);
    
    
%     error_r = std_error_ws([series_INF.all_val{i} series_FuncDef.all_val{i}]); 
%     error_rCon = std_error_ws([storeconInf.all_val{i} storeconFunc.all_val{i}]); 
  
   mddiffINF = storeMDInfT.all_val{i} - storeMDInfR.all_val{i};
   mddifflFUNC =  storeMDFuncT.all_val{i} - storeMDFuncR.all_val{i};
   mddiffINF = [mddiffINF  mddifflFUNC];
   condiffrINF = storeconInfT.all_val{i} - storeconInfR.all_val{i};
   condifflFunc = storeconFuncT.all_val{i} - storeconFuncR.all_val{i};
   condiff = [condiffrINF condifflFunc];
    
    h = figure;
    
    error_r = std_error_ws(mddiffINF); 
    error_rCon = std_error_ws(condiff); 
    
    hold on;
    set(gcf, 'Visible', 'off')
    p1= plot(plot_series_modCON, '-.bo');
    p2= plot(plot_series_modMD, '--ro');
    errorb(plot_series_modCON,error_rCon);
    errorb(plot_series_modMD,error_r);
    hold off 
    axis square
    set(p1, 'LineWidth', 4)
    
    set(gca,'Fontsize',sz);
    set(gca, 'LineWidth',1.5);
    title([list(i) ' ' 'to V1']);
    t=get(gca,'Title');
    set(t,'FontSize',sz);
    set(gca,'XTick', [1:2]); 
    set(gca,'xtickLabel',  roi_name);
    ylabel('Z-score');
    M = ['Inf V1' 'PRL V1'];
    legend(gca, 'Con_ V1', 'MD_ V1');
    
    
        
        
    fig(h,'border', 'off', 'units', 'inches', 'width', 10, 'height', 10 );
    box on
    set(gcf, 'Visible','off')
    cd '/media/store3/Projects/Wess/subjects/FIGs_MD_PRL_MODUL'
        
    out_file = strcat(list{i}, num2str(i));
    export_fig(h, eval('out_file'), '-jpg');
end 


list =   {'PostCingulate','dACCmsFC','lMidOccipital','rFrontalC','rLingual','rTPJ','rThalamus','lFusiform','rFusiform','lIPS','rIPS','lPrecuneus','rPrecuneus','laIfO','raIfO','dACCmsFC','lAntFusiform','lIPL','lMidOccipital','laIfO','raIfO','vmPFC','lTempPole','rTempPole','lMidTemporal','rMidTemporal','lPostCingulate','rPostCingulate','lPostTemporal','rPostTemporal','lTPJ','rTPJ','MPFC','OFC_MPFC_vACC','PCCPrecuneus','lIPC','lPHG','ldlPFC','rIPC','lIPS','rIPS','lFEF','rFEF','rAG','HeschlLatL','HeschlLatR','HeschlMedL','HeschlMedR','lFusiform','rFusiform','DorsalStreamV5';};

   for i = 1:n_rois
    % chaned to 1:8 so that I could do an anova
    roi_series_r = (storeconInfR.all_val{i}(1:8,:) + storeMDlR.all_val{i}(1:8,:))/2;
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
  

