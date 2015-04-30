Subs = {'LOAF_019' 'LOAF_020' 'LOAF_022' 'LOAF_023' 'LOAF_025' 'LOAF_028' 'LOAF_031'...
'LOAF_032' 'LOAF_033' 'LOAF_035' 'LOAF_038'};

labels = {'lhv1sulc1.label' 'lhv1sulc2.label' 'lhv1sulc3.label' 'lhv1sulc4.label'};

for j=1:length(labels)
    for i=1:length(Subs)
        
        eval(['! mris_anatomical_stats -l ' labels{j} ' -f ' Subs{i} '.' labels{j} '.out '  Subs{i} ' lh'])
      
    end
end

for x = 1
    label_files = { 'LOAF_019.lhv1sulc1.label.out'  'LOAF_023.lhv1sulc3.label.out'  'LOAF_032.lhv1sulc2.label.out'...
'LOAF_019.lhv1sulc2.label.out'  'LOAF_023.lhv1sulc4.label.out'  'LOAF_032.lhv1sulc3.label.out'...
'LOAF_019.lhv1sulc3.label.out'  'LOAF_025.lhv1sulc1.label.out'  'LOAF_032.lhv1sulc4.label.out'...
'LOAF_019.lhv1sulc4.label.out'  'LOAF_025.lhv1sulc2.label.out'  'LOAF_033.lhv1sulc1.label.out'...
'LOAF_025.lhv1sulc3.label.out'  'LOAF_033.lhv1sulc2.label.out'...
'LOAF_020.lhv1sulc1.label.out'  'LOAF_025.lhv1sulc4.label.out'  'LOAF_033.lhv1sulc3.label.out'...
'LOAF_020.lhv1sulc2.label.out'  'LOAF_028.lhv1sulc1.label.out'  'LOAF_033.lhv1sulc4.label.out'...
'LOAF_020.lhv1sulc3.label.out'  'LOAF_028.lhv1sulc2.label.out'  'LOAF_035.lhv1sulc1.label.out'...
'LOAF_020.lhv1sulc4.label.out'  'LOAF_028.lhv1sulc3.label.out'  'LOAF_035.lhv1sulc2.label.out'...
'LOAF_022.lhv1sulc1.label.out'  'LOAF_028.lhv1sulc4.label.out'  'LOAF_035.lhv1sulc3.label.out'...
'LOAF_022.lhv1sulc2.label.out'  'LOAF_031.lhv1sulc1.label.out'  'LOAF_035.lhv1sulc4.label.out'...
'LOAF_022.lhv1sulc3.label.out'  'LOAF_031.lhv1sulc2.label.out'  'LOAF_038.lhv1sulc1.label.out'...
'LOAF_022.lhv1sulc4.label.out'  'LOAF_031.lhv1sulc3.label.out'  'LOAF_038.lhv1sulc2.label.out'...
'LOAF_023.lhv1sulc1.label.out'  'LOAF_031.lhv1sulc4.label.out'  'LOAF_038.lhv1sulc3.label.out'...
'LOAF_023.lhv1sulc2.label.out'  'LOAF_032.lhv1sulc1.label.out'  'LOAF_038.lhv1sulc4.label.out'};
end
label_files = label_files';

%% sort by ascending after transposing

%% read in the files
for i = 1:length(label_files)
    
fid = fopen(label_files{i});

CT_DATA = textscan(fid, '%s%s%s%s%s%s%s%s%s%s%s%s%s','Headerlines', 1,'EmptyValue', NaN,'CommentStyle','*');

fclose(fid);

%data of interest
tempctstring = CT_DATA{1,5}(52);
tempctstring = str2num(tempctstring{1})

storesublabel(i,1) = tempctstring;

tempctstring = [];

end
storebyorder(:,1) = storesublabel(1:4);
storebyorder(:,2) = storesublabel(5:8);
storebyorder(:,3) = storesublabel(9:12);
storebyorder(:,4) = storesublabel(13:16);
storebyorder(:,5) = storesublabel(17:20);
storebyorder(:,6) = storesublabel(21:24);
storebyorder(:,7) = storesublabel(25:28);
storebyorder(:,8) = storesublabel(29:32);
storebyorder(:,9) = storesublabel(33:36);
storebyorder(:,10) = storesublabel(37:40);
storebyorder(:,11) = storesublabel(41:44);


a(1) = mean(storebyorder(1,:));
a(2) = mean(storebyorder(2,:));
a(3) = mean(storebyorder(3,:));
a(4) = mean(storebyorder(4,:));
bar(a)

figure
data = storebyorder;
[nconditions nsubject] = size(data);

MeanSubtractedData=data-repmat(mean(data,1),nconditions,1);

withinSubjectStandardError=std(MeanSubtractedData,0,2)/sqrt(nsubject); 

bar(mean(data'))
hold on

errorbar(mean(data'), withinSubjectStandardError)



    