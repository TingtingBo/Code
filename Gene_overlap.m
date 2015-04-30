%% code to read in a master list of genes and two gene files. This will plot them
% as a venn diagram 
addpath(genpath('/Volumes/CANON_DC/files (1)/venn')) % NEED TO CHANGE
% read in gene file
[file1, path] = uigetfile('*.txt');% gene file rat_genes

fID = fopen([path file1]);
genes = textscan(fID, '%s');
fclose(fID);

% read in data 1 file
[file2, path] = uigetfile('*.txt');% data file

fID = fopen([path file2]);
data1 = textscan(fID, '%s %s %s %s');
fclose(fID);

% read in data 2 file
[file3, path] = uigetfile('*.txt');% data file

fID = fopen([path file3]);
data2 = textscan(fID, '%s %s %s %s');
fclose(fID);

% find overlap
[geneoverlap, d1O, d2O] = intersect(data1{1,1}, data2{1,1});% d1O index into data1 of locations that overlap

%compare overlap to known
[geneoverlapknown, d3O, d4O] = intersect(geneoverlap, genes{1,1});

%plot overlap venn style
h = venn([length(data1{1,1}) length(data2{1,1})], length(geneoverlapknown));
vtitle = ['Gene Overlap: ' file2(1:(length(file2)-4)) ' and ' file3(1:(length(file3)-4))];
title(vtitle)

overlapammount = length(geneoverlapknown); overlapammount = num2str(overlapammount);
xlabel([' # of overlap: ' overlapammount]);

fileID = fopen([file2(1:(length(file2)-4)) '_' file3(1:(length(file3)-4)) '_Overlap.txt'], 'w');
fprintf(fileID,'%s\n',geneoverlapknown{1:end});
fclose('all');




