clear
clc
dirtask = '/media/store3/Projects/Wess/subjects/Extracted_data/MD_TASK/ANOVA_tables';
cd(dirtask)

a = dir;
storeP = [];
for x = 3:length(a)
    fid = fopen(a(x).name);
    FC_TASK = textscan(fid, '%s%s%s%s%s%s%s%s%s%s%s%s%s','Headerlines', 1,'EmptyValue', NaN,'CommentStyle','*');
    fclose(fid);
    IV1 = FC_TASK{1,6}{8}; IV1 = str2num(IV1);
    IV2 = FC_TASK{1,6}{10};IV2 = str2num(IV2);
    IV1xIV2 = FC_TASK{1,6}{12};IV1xIV2 = str2num(IV1xIV2);
    storelocal = [IV1; IV2; IV1xIV2];
    storeP = [storeP; storelocal];
    storename{x-2} = a(x).name;
    
end

 fdr(storeP,0.05)
 fdrp =  0.0145;
