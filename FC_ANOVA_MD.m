%% 3-Way ANOVA Script for Background Connectivity
% Takes all .txt data structures from directory and runs 3-way ANOVA 
% Creates new output directory and outputs ANOVA tables as .txt files. 
% Joseph Griffis 2014
clear all 
clc

data_dir= '/media/store3/Projects/Wess/subjects/Extracted_data/Module_MD';
% analysis_dir = fullfile(data_dir, 'LOAF_BGFC_Task_Rest'); 
% cd(analysis_dir);
cd(data_dir);
series = dir('*.txt');
out_dir = 'ANOVA_tables';

for i = 1:length(series)
    
    cd(data_dir);
    
    my_data = load(series(i).name);
    n_subj = length(my_data)/4; 
        
    mymat=[]; % create matrix 
    
    
    for j=1:n_subj % for each subject
        
        for fact1=1:9 % for each ROI
            
            for fact2=1:2 % for each group
                
                for fact3=1:2 % for each task
                    
                    if fact2== 1 && fact3 == 1 % MD rest
                        n = j;
                    elseif fact2== 2 && fact3 == 1% con rest
                        n = j + n_subj; 
                    elseif fact2 == 1 && fact3 == 2% md task 
                        n = j + n_subj*2;
                    elseif fact2 == 2 && fact3 == 2% con task
                        n = j + n_subj*3;
                    end
                    
                    mymat(j,fact1,fact2,fact3) = my_data(n,fact1); % set up matrix
                    
                end
                
                
                
            end
        end
    end
    
    % set up factorial design
    data=mymat;
    
    matrix = [];
    [nsubjects nIV1 nIV2 nIV3] = size(data);
    counter = 0;
    
    for IV2 = 1:nIV2  % for each group
        for IV3 = 1:nIV3 % for each task
            for IV1 = 1:nIV1 % for each roi in v1
                for subject = 1:nsubjects
                counter= counter+1;
                matrix(counter,1)=data(subject, IV1, IV2, IV3);
                matrix(counter,2)= IV1;
                matrix(counter,3)= IV2;
                matrix(counter,4)= IV3;
                matrix(counter,5) = subject;
                end
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
    RMAOV33(matrix)
    % stop saving command window output and clear window
    diary off 
    clc 
    
end