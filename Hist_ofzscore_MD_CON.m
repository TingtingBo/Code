clear
clc

cd('/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_con/SPM_Level2_/Mean_z');
myfile = 'mean5_RH_CON_task.img';
temp = load_nii(myfile);
cd('/media/store3/Projects/Wess/subjects/Whole_Brain_MD/ZCorrel_con/SPM_Level2_/Mean_z');
myfile2 = 'mean5_RH_CON.img';
temp2 = load_nii(myfile2);

histtest = reshape(temp.img, 1, 79*95*68);
histtest = histtest';
hist(histtest,50)


figure;
histtest2 = reshape(temp2.img, 1, 79*95*68);
histtest2 = histtest2';
hist(histtest2,50)
h = findobj(gca,'Type','patch');
set(h,'FaceColor','r','EdgeColor','w')
hold on

md = histtest(isnan(histtest) ==0);
con = histtest2(isnan(histtest2)==0);

[h,p,ci, stats] = ttest2(md, con)
mean(histtest(isnan(histtest)==0))
mean(histtest2(isnan(histtest2)==0))
