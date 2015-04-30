% cortical thickness data: 
% /media/store3/Projects/Wess/subjects/Text_FIles_created_from_FSlabels/YA_V1_9_LH
% /media/store3/Projects/Wess/subjects/Text_FIles_created_from_FSlabels/YA_V1_9_RH

% JND data:
% /media/store4/Projects/LOAf/B/Scripts/SubjData
% sub_avJND.mat
% JND_wr = audio JND_og = visual just noticable difference


%% how to read in data

for i = 1:length(files) 
    
    fid = fopen(files{i});
    CT_DATA = textscan(fid, '%s%s%s%s%s%s%s%s%s%s%s%s%s','Headerlines', 1,'EmptyValue', NaN,'CommentStyle','*');
    fclose(fid);
    tempctstring = CT_DATA{1,5}(52);% pull cortical thickness string from file

    %convert 2 number
    ctnum = str2num(tempctstring{1}); % convert CT string to number
    storedata(i) = ctnum; % store CT numerical data
    storefile{i} = files{i}; % store string with subject name
    
    
end
