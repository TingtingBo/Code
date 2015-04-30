function [matrix] = reformat_BWAOV2_MD(data)
% takes as input the data for a group of subjects in the format 
% data with dimensions subject, independent variable 1, (first 10 subjects
% are trained, second 10 are untrained)
% example:  data = [storedataforanova(1:2,:)'; storedataforanova(3:4,:)']
%
% Data must be a 2-dimensional vector 
% pcCorPerJND(1:condition,1:JNDvalue)
% 
% example inputs:
% data(:,:,1)=[.3 .4 .5 .6 .7 ; .8 .9 .1 .2 .3];
% data(:,:,2)=[.4 .4 .5 .6 .7 ; .8 .9 .1 .2 .3];
% modified by Wes for a condition with 2 groups (that is one between
% subjects factor)

matrix = [];
[nsubjects nconditions] = size(data);
counter = 0;

for subject = 1:nsubjects  % for each subject
    for withinSubjVbl = 1:nconditions% for each condition
        if subject <=20
            % this is a trained participant
            trained = 1;
        elseif subject >20
            % this is an untrained participant
            trained = 2;
        end
        sub = subject;
       
        counter= counter+1;
        matrix(counter,1)=data(subject, withinSubjVbl);
        matrix(counter,2)= trained; % between subjects variable (trained vs. untrained)
        matrix(counter,3)= withinSubjVbl; % within subjects variable
        matrix(counter,4)= sub;
    end
end

end


