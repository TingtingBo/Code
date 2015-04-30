Subs= {'MAC_CON_08' 'MAC_CON_011' 'MAC_CON_013' 'MAC_CON_014' 'MAC_CON_016' 'VINES_1001026'  ...
'MAC_CON_019'  'MAC_CON_024' 'MAC_CON_025' 'MAC_CON_026' 'MAC_CON_028'...
'MAC_DE_08' 'MAC_DE_014' 'MAC_DE_011' 'MAC_DE_013' 'MAC_DE_016' 'MAC_DE_024' ...
'MAC_DE_019' 'MAC_DE_021' 'MAC_DE_025' 'MAC_DE_026' 'MAC_DE_028'...
'LOAF_019' 'LOAF_020' 'LOAF_022' 'LOAF_023' 'LOAF_025' 'LOAF_028' 'LOAF_031'...
'LOAF_032' 'LOAF_033' 'LOAF_035' 'LOAF_038'};






for i=1:length(Subs)
    var = strcat('/media/store3/Projects/Wess/subjects/',Subs{i}, '/surf');
    cd(var)
    eval(['!  mris_make_face_parcellation lh.sphere.reg $FREESURFER_HOME/lib/bem/ic3.tri ./lh.ic3.annot'])
    eval(['!  mris_make_face_parcellation rh.sphere.reg $FREESURFER_HOME/lib/bem/ic3.tri ./rh.ic3.annot'])
    eval(['!  mris_anatomical_stats -a lh.ic3.annot -f ic3.tab.lh ' Subs{i} ' lh'])
    eval(['!  mris_anatomical_stats -a rh.ic3.annot -f ic3.tab.rh ' Subs{i} ' rh'])
    
end

for i=1:length(Subs)
    var = strcat('/media/store3/Projects/Wess/subjects/',Subs{i}, '/surf');
    cd(var)
    %53 = 0
    fid = fopen('ic3.tab.lh');

    ctdatalh = textscan(fid, '%s%s%s%s%s%s%s%s%s%s%s%s%s','Headerlines', 1,'EmptyValue', NaN,'CommentStyle','*');

    fclose(fid);
    
     fid = fopen('ic3.tab.rh');

    ctdatarh = textscan(fid, '%s%s%s%s%s%s%s%s%s%s%s%s%s','Headerlines', 1,'EmptyValue', NaN,'CommentStyle','*');

    fclose(fid);
    storelh(i) = str2num(ctdatalh{1,5}{478,1});
    storerh(i) = str2num(ctdatarh{1,5}{478,1});
    storelhi(i) = str2num(ctdatalh{1,5}{642,1});
    storerhi(i) = str2num(ctdatarh{1,5}{642,1});
    storelhfov(i) = str2num(ctdatalh{1,5}{490,1});
    storerhfov(i) = str2num(ctdatarh{1,5}{490,1});
    
end
mean(storelh(1:11)) / mean(storelhi(1:11))
mean(storelh(12:22)) / mean(storelhi(12:22))
mean(storelh(23:33)) / mean(storelhi(23:33))

mean(storerh(1:11)) / mean(storerhi(1:11))
mean(storerh(12:22)) / mean(storerhi(12:22))
mean(storerh(23:33)) / mean(storerhi(23:33))

 oldh = storelh(1:11) ./ (storelhi(1:11))
 macd = storelh(12:22) ./ (storelhi(12:22))
 ya = storelh(23:33) ./ (storelhi(23:33))
 oldh = oldh'; macd = macd'; ya = ya';

