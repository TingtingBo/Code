function [matrix] = reformat_RMAOV1(data)
% takes as input the data for a group of subjects in the format 
% data with dimensions subject, independent variable 1
% Data must be a 2-dimensional vector 
% pcCorPerJND(1:condition,1:JNDvalue)
% 
% example inputs:
% data(:,:)=[.3 .4 .5 .6 .7 ; .8 .9 .1 .2 .3; .3 .5 .6 .7 .8];
% modified by KMV on July 4, 2011


matrix = [];
[nsubjects nIV1 ] = size(data);
counter = 0;

for subject = 1:nsubjects  % for each subject
    for IV1 = 1:nIV1% for each independent variable 1
            counter= counter+1;
            matrix(counter,1)=data(subject, IV1);
            matrix(counter,2)= IV1;
            matrix(counter,3)=subject;
  
    end
    
end
