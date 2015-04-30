%% MD volume

% cd to /media/store3/Projects/Wess/subjects/Text_FIles_created_from_FSlabels
% change to folder of interest and run corresponding line below
macD_LH_9 = {'MAC_DE_011.1_LH_V1.label.out','MAC_DE_011.2_LH_V1.label.out','MAC_DE_011.3_LH_V1.label.out','MAC_DE_011.4_LH_V1.label.out','MAC_DE_011.5_LH_V1.label.out','MAC_DE_011.6_LH_V1.label.out','MAC_DE_011.7_LH_V1.label.out','MAC_DE_011.8_LH_V1.label.out','MAC_DE_011.9_LH_V1.label.out','MAC_DE_013.1_LH_V1.label.out','MAC_DE_013.2_LH_V1.label.out','MAC_DE_013.3_LH_V1.label.out','MAC_DE_013.4_LH_V1.label.out','MAC_DE_013.5_LH_V1.label.out','MAC_DE_013.6_LH_V1.label.out','MAC_DE_013.7_LH_V1.label.out','MAC_DE_013.8_LH_V1.label.out','MAC_DE_013.9_LH_V1.label.out','MAC_DE_016.1_LH_V1.label.out','MAC_DE_016.2_LH_V1.label.out','MAC_DE_016.3_LH_V1.label.out','MAC_DE_016.4_LH_V1.label.out','MAC_DE_016.5_LH_V1.label.out','MAC_DE_016.6_LH_V1.label.out','MAC_DE_016.7_LH_V1.label.out','MAC_DE_016.8_LH_V1.label.out','MAC_DE_016.9_LH_V1.label.out','MAC_DE_018.1_LH_V1.label.out','MAC_DE_018.2_LH_V1.label.out','MAC_DE_018.3_LH_V1.label.out','MAC_DE_018.4_LH_V1.label.out','MAC_DE_018.5_LH_V1.label.out','MAC_DE_018.6_LH_V1.label.out','MAC_DE_018.7_LH_V1.label.out','MAC_DE_018.8_LH_V1.label.out','MAC_DE_018.9_LH_V1.label.out','MAC_DE_019.1_LH_V1.label.out','MAC_DE_019.2_LH_V1.label.out','MAC_DE_019.3_LH_V1.label.out','MAC_DE_019.4_LH_V1.label.out','MAC_DE_019.5_LH_V1.label.out','MAC_DE_019.6_LH_V1.label.out','MAC_DE_019.7_LH_V1.label.out','MAC_DE_019.8_LH_V1.label.out','MAC_DE_019.9_LH_V1.label.out','MAC_DE_024.1_LH_V1.label.out','MAC_DE_024.2_LH_V1.label.out','MAC_DE_024.3_LH_V1.label.out','MAC_DE_024.4_LH_V1.label.out','MAC_DE_024.5_LH_V1.label.out','MAC_DE_024.6_LH_V1.label.out','MAC_DE_024.7_LH_V1.label.out','MAC_DE_024.8_LH_V1.label.out','MAC_DE_024.9_LH_V1.label.out','MAC_DE_025.1_LH_V1.label.out','MAC_DE_025.2_LH_V1.label.out','MAC_DE_025.3_LH_V1.label.out','MAC_DE_025.4_LH_V1.label.out','MAC_DE_025.5_LH_V1.label.out','MAC_DE_025.6_LH_V1.label.out','MAC_DE_025.7_LH_V1.label.out','MAC_DE_025.8_LH_V1.label.out','MAC_DE_025.9_LH_V1.label.out','MAC_DE_026.1_LH_V1.label.out','MAC_DE_026.2_LH_V1.label.out','MAC_DE_026.3_LH_V1.label.out','MAC_DE_026.4_LH_V1.label.out','MAC_DE_026.5_LH_V1.label.out','MAC_DE_026.6_LH_V1.label.out','MAC_DE_026.7_LH_V1.label.out','MAC_DE_026.8_LH_V1.label.out','MAC_DE_026.9_LH_V1.label.out','MAC_DE_08.1_LH_V1.label.out','MAC_DE_08.2_LH_V1.label.out','MAC_DE_08.3_LH_V1.label.out','MAC_DE_08.4_LH_V1.label.out','MAC_DE_08.5_LH_V1.label.out','MAC_DE_08.6_LH_V1.label.out','MAC_DE_08.7_LH_V1.label.out','MAC_DE_08.8_LH_V1.label.out','MAC_DE_08.9_LH_V1.label.out','MAC_DE_09.1_LH_V1.label.out','MAC_DE_09.2_LH_V1.label.out','MAC_DE_09.3_LH_V1.label.out','MAC_DE_09.4_LH_V1.label.out','MAC_DE_09.5_LH_V1.label.out','MAC_DE_09.6_LH_V1.label.out','MAC_DE_09.7_LH_V1.label.out','MAC_DE_09.8_LH_V1.label.out','MAC_DE_09.9_LH_V1.label.out';};
macD_RH_9 = {'MAC_DE_011.1_RH_V1.label.out','MAC_DE_011.2_RH_V1.label.out','MAC_DE_011.3_RH_V1.label.out','MAC_DE_011.4_RH_V1.label.out','MAC_DE_011.5_RH_V1.label.out','MAC_DE_011.6_RH_V1.label.out','MAC_DE_011.7_RH_V1.label.out','MAC_DE_011.8_RH_V1.label.out','MAC_DE_011.9_RH_V1.label.out','MAC_DE_013.1_RH_V1.label.out','MAC_DE_013.2_RH_V1.label.out','MAC_DE_013.3_RH_V1.label.out','MAC_DE_013.4_RH_V1.label.out','MAC_DE_013.5_RH_V1.label.out','MAC_DE_013.6_RH_V1.label.out','MAC_DE_013.7_RH_V1.label.out','MAC_DE_013.8_RH_V1.label.out','MAC_DE_013.9_RH_V1.label.out','MAC_DE_016.1_RH_V1.label.out','MAC_DE_016.2_RH_V1.label.out','MAC_DE_016.3_RH_V1.label.out','MAC_DE_016.4_RH_V1.label.out','MAC_DE_016.5_RH_V1.label.out','MAC_DE_016.6_RH_V1.label.out','MAC_DE_016.7_RH_V1.label.out','MAC_DE_016.8_RH_V1.label.out','MAC_DE_016.9_RH_V1.label.out','MAC_DE_018.1_RH_V1.label.out','MAC_DE_018.2_RH_V1.label.out','MAC_DE_018.3_RH_V1.label.out','MAC_DE_018.4_RH_V1.label.out','MAC_DE_018.5_RH_V1.label.out','MAC_DE_018.6_RH_V1.label.out','MAC_DE_018.7_RH_V1.label.out','MAC_DE_018.8_RH_V1.label.out','MAC_DE_018.9_RH_V1.label.out','MAC_DE_019.1_RH_V1.label.out','MAC_DE_019.2_RH_V1.label.out','MAC_DE_019.3_RH_V1.label.out','MAC_DE_019.4_RH_V1.label.out','MAC_DE_019.5_RH_V1.label.out','MAC_DE_019.6_RH_V1.label.out','MAC_DE_019.7_RH_V1.label.out','MAC_DE_019.8_RH_V1.label.out','MAC_DE_019.9_RH_V1.label.out','MAC_DE_024.1_RH_V1.label.out','MAC_DE_024.2_RH_V1.label.out','MAC_DE_024.3_RH_V1.label.out','MAC_DE_024.4_RH_V1.label.out','MAC_DE_024.5_RH_V1.label.out','MAC_DE_024.6_RH_V1.label.out','MAC_DE_024.7_RH_V1.label.out','MAC_DE_024.8_RH_V1.label.out','MAC_DE_024.9_RH_V1.label.out','MAC_DE_025.1_RH_V1.label.out','MAC_DE_025.2_RH_V1.label.out','MAC_DE_025.3_RH_V1.label.out','MAC_DE_025.4_RH_V1.label.out','MAC_DE_025.5_RH_V1.label.out','MAC_DE_025.6_RH_V1.label.out','MAC_DE_025.7_RH_V1.label.out','MAC_DE_025.8_RH_V1.label.out','MAC_DE_025.9_RH_V1.label.out','MAC_DE_026.1_RH_V1.label.out','MAC_DE_026.2_RH_V1.label.out','MAC_DE_026.3_RH_V1.label.out','MAC_DE_026.4_RH_V1.label.out','MAC_DE_026.5_RH_V1.label.out','MAC_DE_026.6_RH_V1.label.out','MAC_DE_026.7_RH_V1.label.out','MAC_DE_026.8_RH_V1.label.out','MAC_DE_026.9_RH_V1.label.out','MAC_DE_08.1_RH_V1.label.out','MAC_DE_08.2_RH_V1.label.out','MAC_DE_08.3_RH_V1.label.out','MAC_DE_08.4_RH_V1.label.out','MAC_DE_08.5_RH_V1.label.out','MAC_DE_08.6_RH_V1.label.out','MAC_DE_08.7_RH_V1.label.out','MAC_DE_08.8_RH_V1.label.out','MAC_DE_08.9_RH_V1.label.out','MAC_DE_09.1_RH_V1.label.out','MAC_DE_09.2_RH_V1.label.out','MAC_DE_09.3_RH_V1.label.out','MAC_DE_09.4_RH_V1.label.out','MAC_DE_09.5_RH_V1.label.out','MAC_DE_09.6_RH_V1.label.out','MAC_DE_09.7_RH_V1.label.out','MAC_DE_09.8_RH_V1.label.out','MAC_DE_09.9_RH_V1.label.out';};
macdconLH1to9 = {'MAC_CON_011.1_LH_V1.label.out','MAC_CON_011.2_LH_V1.label.out','MAC_CON_011.3_LH_V1.label.out','MAC_CON_011.4_LH_V1.label.out','MAC_CON_011.5_LH_V1.label.out','MAC_CON_011.6_LH_V1.label.out','MAC_CON_011.7_LH_V1.label.out','MAC_CON_011.8_LH_V1.label.out','MAC_CON_011.9_LH_V1.label.out','MAC_CON_013.1_LH_V1.label.out','MAC_CON_013.2_LH_V1.label.out','MAC_CON_013.3_LH_V1.label.out','MAC_CON_013.4_LH_V1.label.out','MAC_CON_013.5_LH_V1.label.out','MAC_CON_013.6_LH_V1.label.out','MAC_CON_013.7_LH_V1.label.out','MAC_CON_013.8_LH_V1.label.out','MAC_CON_013.9_LH_V1.label.out','MAC_CON_016.1_LH_V1.label.out','MAC_CON_016.2_LH_V1.label.out','MAC_CON_016.3_LH_V1.label.out','MAC_CON_016.4_LH_V1.label.out','MAC_CON_016.5_LH_V1.label.out','MAC_CON_016.6_LH_V1.label.out','MAC_CON_016.7_LH_V1.label.out','MAC_CON_016.8_LH_V1.label.out','MAC_CON_016.9_LH_V1.label.out','MAC_CON_018.1_LH_V1.label.out','MAC_CON_018.2_LH_V1.label.out','MAC_CON_018.3_LH_V1.label.out','MAC_CON_018.4_LH_V1.label.out','MAC_CON_018.5_LH_V1.label.out','MAC_CON_018.6_LH_V1.label.out','MAC_CON_018.7_LH_V1.label.out','MAC_CON_018.8_LH_V1.label.out','MAC_CON_018.9_LH_V1.label.out','MAC_CON_019.1_LH_V1.label.out','MAC_CON_019.2_LH_V1.label.out','MAC_CON_019.3_LH_V1.label.out','MAC_CON_019.4_LH_V1.label.out','MAC_CON_019.5_LH_V1.label.out','MAC_CON_019.6_LH_V1.label.out','MAC_CON_019.7_LH_V1.label.out','MAC_CON_019.8_LH_V1.label.out','MAC_CON_019.9_LH_V1.label.out','MAC_CON_024.1_LH_V1.label.out','MAC_CON_024.2_LH_V1.label.out','MAC_CON_024.3_LH_V1.label.out','MAC_CON_024.4_LH_V1.label.out','MAC_CON_024.5_LH_V1.label.out','MAC_CON_024.6_LH_V1.label.out','MAC_CON_024.7_LH_V1.label.out','MAC_CON_024.8_LH_V1.label.out','MAC_CON_024.9_LH_V1.label.out','MAC_CON_025.1_LH_V1.label.out','MAC_CON_025.2_LH_V1.label.out','MAC_CON_025.3_LH_V1.label.out','MAC_CON_025.4_LH_V1.label.out','MAC_CON_025.5_LH_V1.label.out','MAC_CON_025.6_LH_V1.label.out','MAC_CON_025.7_LH_V1.label.out','MAC_CON_025.8_LH_V1.label.out','MAC_CON_025.9_LH_V1.label.out','MAC_CON_026.1_LH_V1.label.out','MAC_CON_026.2_LH_V1.label.out','MAC_CON_026.3_LH_V1.label.out','MAC_CON_026.4_LH_V1.label.out','MAC_CON_026.5_LH_V1.label.out','MAC_CON_026.6_LH_V1.label.out','MAC_CON_026.7_LH_V1.label.out','MAC_CON_026.8_LH_V1.label.out','MAC_CON_026.9_LH_V1.label.out','MAC_CON_08.1_LH_V1.label.out','MAC_CON_08.2_LH_V1.label.out','MAC_CON_08.3_LH_V1.label.out','MAC_CON_08.4_LH_V1.label.out','MAC_CON_08.5_LH_V1.label.out','MAC_CON_08.6_LH_V1.label.out','MAC_CON_08.7_LH_V1.label.out','MAC_CON_08.8_LH_V1.label.out','MAC_CON_08.9_LH_V1.label.out','MAC_CON_09.1_LH_V1.label.out','MAC_CON_09.2_LH_V1.label.out','MAC_CON_09.3_LH_V1.label.out','MAC_CON_09.4_LH_V1.label.out','MAC_CON_09.5_LH_V1.label.out','MAC_CON_09.6_LH_V1.label.out','MAC_CON_09.7_LH_V1.label.out','MAC_CON_09.8_LH_V1.label.out','MAC_CON_09.9_LH_V1.label.out';};
macdconRH1to9 = {'MAC_CON_011.1_RH_V1.label.out','MAC_CON_011.2_RH_V1.label.out','MAC_CON_011.3_RH_V1.label.out','MAC_CON_011.4_RH_V1.label.out','MAC_CON_011.5_RH_V1.label.out','MAC_CON_011.6_RH_V1.label.out','MAC_CON_011.7_RH_V1.label.out','MAC_CON_011.8_RH_V1.label.out','MAC_CON_011.9_RH_V1.label.out','MAC_CON_013.1_RH_V1.label.out','MAC_CON_013.2_RH_V1.label.out','MAC_CON_013.3_RH_V1.label.out','MAC_CON_013.4_RH_V1.label.out','MAC_CON_013.5_RH_V1.label.out','MAC_CON_013.6_RH_V1.label.out','MAC_CON_013.7_RH_V1.label.out','MAC_CON_013.8_RH_V1.label.out','MAC_CON_013.9_RH_V1.label.out','MAC_CON_016.1_RH_V1.label.out','MAC_CON_016.2_RH_V1.label.out','MAC_CON_016.3_RH_V1.label.out','MAC_CON_016.4_RH_V1.label.out','MAC_CON_016.5_RH_V1.label.out','MAC_CON_016.6_RH_V1.label.out','MAC_CON_016.7_RH_V1.label.out','MAC_CON_016.8_RH_V1.label.out','MAC_CON_016.9_RH_V1.label.out','MAC_CON_018.1_RH_V1.label.out','MAC_CON_018.2_RH_V1.label.out','MAC_CON_018.3_RH_V1.label.out','MAC_CON_018.4_RH_V1.label.out','MAC_CON_018.5_RH_V1.label.out','MAC_CON_018.6_RH_V1.label.out','MAC_CON_018.7_RH_V1.label.out','MAC_CON_018.8_RH_V1.label.out','MAC_CON_018.9_RH_V1.label.out','MAC_CON_019.1_RH_V1.label.out','MAC_CON_019.2_RH_V1.label.out','MAC_CON_019.3_RH_V1.label.out','MAC_CON_019.4_RH_V1.label.out','MAC_CON_019.5_RH_V1.label.out','MAC_CON_019.6_RH_V1.label.out','MAC_CON_019.7_RH_V1.label.out','MAC_CON_019.8_RH_V1.label.out','MAC_CON_019.9_RH_V1.label.out','MAC_CON_024.1_RH_V1.label.out','MAC_CON_024.2_RH_V1.label.out','MAC_CON_024.3_RH_V1.label.out','MAC_CON_024.4_RH_V1.label.out','MAC_CON_024.5_RH_V1.label.out','MAC_CON_024.6_RH_V1.label.out','MAC_CON_024.7_RH_V1.label.out','MAC_CON_024.8_RH_V1.label.out','MAC_CON_024.9_RH_V1.label.out','MAC_CON_025.1_RH_V1.label.out','MAC_CON_025.2_RH_V1.label.out','MAC_CON_025.3_RH_V1.label.out','MAC_CON_025.4_RH_V1.label.out','MAC_CON_025.5_RH_V1.label.out','MAC_CON_025.6_RH_V1.label.out','MAC_CON_025.7_RH_V1.label.out','MAC_CON_025.8_RH_V1.label.out','MAC_CON_025.9_RH_V1.label.out','MAC_CON_026.1_RH_V1.label.out','MAC_CON_026.2_RH_V1.label.out','MAC_CON_026.3_RH_V1.label.out','MAC_CON_026.4_RH_V1.label.out','MAC_CON_026.5_RH_V1.label.out','MAC_CON_026.6_RH_V1.label.out','MAC_CON_026.7_RH_V1.label.out','MAC_CON_026.8_RH_V1.label.out','MAC_CON_026.9_RH_V1.label.out','MAC_CON_08.1_RH_V1.label.out','MAC_CON_08.2_RH_V1.label.out','MAC_CON_08.3_RH_V1.label.out','MAC_CON_08.4_RH_V1.label.out','MAC_CON_08.5_RH_V1.label.out','MAC_CON_08.6_RH_V1.label.out','MAC_CON_08.7_RH_V1.label.out','MAC_CON_08.8_RH_V1.label.out','MAC_CON_08.9_RH_V1.label.out','MAC_CON_09.1_RH_V1.label.out','MAC_CON_09.2_RH_V1.label.out','MAC_CON_09.3_RH_V1.label.out','MAC_CON_09.4_RH_V1.label.out','MAC_CON_09.5_RH_V1.label.out','MAC_CON_09.6_RH_V1.label.out','MAC_CON_09.7_RH_V1.label.out','MAC_CON_09.8_RH_V1.label.out','MAC_CON_09.9_RH_V1.label.out';};
% files = variable from above



for i = 1:length(files)
    
    fid = fopen(files{i});
    
    CT_DATA = textscan(fid, '%s%s%s%s%s%s%s%s%s%s%s%s%s','Headerlines', 1,'EmptyValue', NaN,'CommentStyle','*');
    
    fclose(fid);
    
    %data of interest
    %tempctstring = CT_DATA{1,5}(52);%for CT
    tempctstring = CT_DATA{1,4}(52); %for vol
    tempctstdstring = CT_DATA{1,7}(52);
    
    %convert 2 number
    ctnum = str2num(tempctstring{1});
    ctstdnum = str2num(tempctstdstring{1});
    storedata(i) = ctnum;
    storecurv(i) = ctstdnum;
    storefile{i} = files{i};
    
    
end

%% MACD section
MD1 = storedata(1:9:end);
MD2 = storedata(2:9:end);
MD3 = storedata(3:9:end);
MD4 = storedata(4:9:end);
MD5 = storedata(5:9:end);
MD6 = storedata(6:9:end);
MD7 = storedata(7:9:end);
MD8 = storedata(8:9:end);
MD9 = storedata(9:9:end);

MDV1(:,1) = MD1;
MDV1(:,2) = MD2;
MDV1(:,3) = MD3;
MDV1(:,4) = MD4;
MDV1(:,5) = MD5;
MDV1(:,6) = MD6;
MDV1(:,7) = MD7;
MDV1(:,8) = MD8;
MDV1(:,9) = MD9;


RMD1 = storedata(1:9:end);
RMD2 = storedata(2:9:end);
RMD3 = storedata(3:9:end);
RMD4 = storedata(4:9:end);
RMD5 = storedata(5:9:end);
RMD6 = storedata(6:9:end);
RMD7 = storedata(7:9:end);
RMD8 = storedata(8:9:end);
RMD9 = storedata(9:9:end);

RMDV1(:,1) = RMD1;
RMDV1(:,2) = RMD2;
RMDV1(:,3) = RMD3;
RMDV1(:,4) = RMD4;
RMDV1(:,5) = RMD5;
RMDV1(:,6) = RMD6;
RMDV1(:,7) = RMD7;
RMDV1(:,8) = RMD8;
RMDV1(:,9) = RMD9;
combinedMD = (MDV1 + RMDV1)/2;

% con section

MD1 = storedata(1:9:end);
MD2 = storedata(2:9:end);
MD3 = storedata(3:9:end);
MD4 = storedata(4:9:end);
MD5 = storedata(5:9:end);
MD6 = storedata(6:9:end);
MD7 = storedata(7:9:end);
MD8 = storedata(8:9:end);
MD9 = storedata(9:9:end);

MDCV1(:,1) = MD1;
MDCV1(:,2) = MD2;
MDCV1(:,3) = MD3;
MDCV1(:,4) = MD4;
MDCV1(:,5) = MD5;
MDCV1(:,6) = MD6;
MDCV1(:,7) = MD7;
MDCV1(:,8) = MD8;
MDCV1(:,9) = MD9;


RMD1 = storedata(1:9:end);
RMD2 = storedata(2:9:end);
RMD3 = storedata(3:9:end);
RMD4 = storedata(4:9:end);
RMD5 = storedata(5:9:end);
RMD6 = storedata(6:9:end);
RMD7 = storedata(7:9:end);
RMD8 = storedata(8:9:end);
RMD9 = storedata(9:9:end);

RMDCV1(:,1) = RMD1;
RMDCV1(:,2) = RMD2;
RMDCV1(:,3) = RMD3;
RMDCV1(:,4) = RMD4;
RMDCV1(:,5) = RMD5;
RMDCV1(:,6) = RMD6;
RMDCV1(:,7) = RMD7;
RMDCV1(:,8) = RMD8;
RMDCV1(:,9) = RMD9;
combinedMDCon = (MDCV1 + RMDCV1)/2;
% i saved all of this to /media/store3/Projects/Wess/subjects/Saved_DOT_MAT_files


%% data analysis and graphing
% cd to /media/store3/Projects/Wess/subjects/Saved_DOT_MAT_files
load('storeMDVol.mat')
load('storeMDCONVol.mat')

data = data';
[nconditions nsubject] = size(data)
figure
% bar and error within subject
MeanSubtractedData=data-repmat(mean(data,1),nconditions,1);
withinSubjectStandardError=std(MeanSubtractedData,0,2)/sqrt(nsubject);
bar(mean(data'))
hold on
errorbar(mean(data'), withinSubjectStandardError)

% error bar line graph standard error of the mean
sem=std(data')/sqrt(length(data'))
errorbar(mean(data'), sem)
hold on

%% stats
datatrans = [combinedMD;combinedMDCon];
[matrix] = reformat_BWAOV2_trainedvsUntrained(datatrans);
BWAOV2(matrix)


[h,p,ci,stats] = ttest2(combinedMD(:,1), combinedMDCon(:,1))
[h,p,ci,stats] = ttest2(combinedMD(:,2), combinedMDCon(:,2))
[h,p,ci,stats] = ttest2(combinedMD(:,3), combinedMDCon(:,3))
[h,p,ci,stats] = ttest2(combinedMD(:,4), combinedMDCon(:,4))
[h,p,ci,stats] = ttest2(combinedMD(:,5), combinedMDCon(:,5))
[h,p,ci,stats] = ttest2(combinedMD(:,6), combinedMDCon(:,6))
[h,p,ci,stats] = ttest2(combinedMD(:,7), combinedMDCon(:,7))
[h,p,ci,stats] = ttest2(combinedMD(:,8), combinedMDCon(:,8))
[h,p,ci,stats] = ttest2(combinedMD(:,9), combinedMDCon(:,9))






