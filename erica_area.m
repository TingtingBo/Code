clear
clc
%% code to read in vines data and give average area in mm^2
subs = dir('1*');
subs = dir('MAC_*')



for i = 1:length(subs)
    fid = fopen(subs(i).name);
    CT_DATA = textscan(fid, '%s%s%s%s%s%s%s%s%s%s%s%s%s','Headerlines', 1,'EmptyValue', NaN,'CommentStyle','*');
    fclose(fid);
    %data of interest
    tempctstring = CT_DATA{1,3}(52);%for sa
    %tempctstring = CT_DATA{1,4}(52); %for vol
    tempctstdstring = CT_DATA{1,7}(52);
    %convert 2 number
    ctnum = str2num(tempctstring{1});
    ctstdnum = str2num(tempctstdstring{1});
    storedata(i) = ctnum;
    storecurv(i) = ctstdnum;
    storefile{i} = subs(i).name;
end

mean(storedata)


%% read in files
clear
clc
for x = 1
Subs = {'1000326.ct'...
'1000426.ct'...
'1000726.ct'...
'1001026.ct'...
'1001226.ct'...
'1001326.ct'...
'1002126.ct'...
'1002826.ct'...
'1002926.ct'...
'1003426.ct'...
'1003626.ct'...
'1004226.ct'...
'1004326.ct'...
'1005226.ct'...
'1005426.ct'...
'1005726.ct'...
'1005826.ct'...
'1006626.ct'...
'1006726.ct'...
'1006926.ct'...
'1007726.ct'...
'1007826.ct'...
'1008126.ct'...
'1008626.ct'...
'1009126.ct'...
'1009226.ct'...
'1009326.ct'...
'1009526.ct'...
'1009626.ct'...
'1009926.ct'...
'1010226.ct'...
'1010426.ct'...
'1011026.ct'...
'1011226.ct'...
'1011426.ct'...
'1011526.ct'...
'1012526.ct'...
'1013526.ct'...
'1014526r2'...
'1010826r2' ...
'1010726r2'};
end

labelslh = {'L_IS.label' 'L_PREC.label' 'L_DAC.label' 'L_FRONT.label' 'L_IPL.label' 'L_DLPFC.label' 'L_AINS.label' 'L_APFC.label' };
labelsrh = {'R_IS.label' 'R_PREC.label' 'R_MIDCING.label' 'R_FRONT.label' 'R_IPL.label' 'R_DLPFC.label' 'R_AINS.label' 'R_APFC.label' };
%make label folders
for x =1:length(labelsrh)
    eval(['! mkdir ' labelslh{x}])
end


for j=1:length(labelslh)
    
    for i=1:length(Subs)
        
        eval(['! mris_anatomical_stats -l ' labelslh{j} ' -f /media/store3/Projects/Wess/subjects/Text_FIles_created_from_FSlabels/For_erica/' labelslh{j} '/' Subs{i} '.' labelslh{j} '.out ' Subs{i} ' lh'])
      
    end
end


for j=1:length(labelsrh)
    
    for i=1:length(Subs)
        
        eval(['! mris_anatomical_stats -l ' labelsrh{j} ' -f /media/store3/Projects/Wess/subjects/Text_FIles_created_from_FSlabels/For_erica/' labelsrh{j} '/' Subs{i} '.' labelsrh{j} '.out ' Subs{i} ' rh'])
      
    end
end
