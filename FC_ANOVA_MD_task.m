%% 3-Way ANOVA Script for Background Connectivity
% Takes all .txt data structures from directory and runs 3-way ANOVA
% Creates new output directory and outputs ANOVA tables as .txt files.
% Joseph Griffis 2014
clear all
clc
addpath('/media/store3/Projects/Wess/subjects/SCRIPTS');

data_dir= '/media/store3/Projects/Wess/subjects/Extracted_data/MD_REST';
% analysis_dir = fullfile(data_dir, 'LOAF_BGFC_Task_Rest');
% cd(analysis_dir);
cd(data_dir);
series = dir('*.txt');
out_dir = 'ANOVA_tables';

for i = 1:length(series)
    cd(data_dir);
    my_data = load(series(i).name);
    n_subj = length(my_data)/2;
    mymat=[]; % create matrix
    for j=1:n_subj % for each subject
        for fact1=1:9 % for each ROI
            for fact2=1:2 % for each group
                if fact2== 1
                    n = j;
                elseif fact2== 2
                    n = j + n_subj;
                end
                mymat(j,fact1,fact2) = my_data(n,fact1); % set up matrix
            end
        end
    end
    
    % set up factorial design
    data=mymat;
    
    matrix = [];
    [nsubjects nIV1 nIV2] = size(data);
    counter = 0;
    
    for IV2 = 1:nIV2  % for each group
        for IV1 = 1:nIV1 % for each roi in v1
            for subject = 1:nsubjects
                counter= counter+1;
                matrix(counter,1)=data(subject, IV1, IV2);
                matrix(counter,2)= IV1;
                matrix(counter,3)= IV2;
                matrix(counter,4) = subject;
            end
        end
    end
    % X - data matrix (Size of matrix must be n-by-4;dependent variable=column 1;
    %              independent variable 1 [between-subject]=column 2;independent variable 2
    %              [within-subject]=column 3; subject=column 4).
    % create data output directory
    if isdir(fullfile(data_dir, out_dir)) == 0
        mkdir(fullfile(data_dir, out_dir));
    end
    save_dir = fullfile(data_dir, out_dir);
    cd(save_dir);
    % save command window output as .txt file
    out_dat = strcat(series(i).name(1:length(series(i).name)-4), '_ANOVA_table', '.txt');
    diary(out_dat);
    % run ANOVA and output table to command window
    RMAOV2(matrix)
    % stop saving command window output and clear window
    diary off
    clc
end
