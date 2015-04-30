%code to read in text files from a directory and plot frequencies of genes
% written by Wes Burge Apr 30, 2015
clear
clc
% select known genes
DialogTitle = 'Select known rat genes';
[file1, path] = uigetfile('*.txt', DialogTitle);% gene file rat_genes

fID = fopen([path file1]);
genes = textscan(fID, '%s');
fclose(fID);

%chose gene directory 
[file1, path] = uigetfile('*.txt');% 
cd(path)

% read dir of txt files
genelist = dir('*.txt');
words{1} = '';

% loop to read in data
for files = 1:length(genelist)
    fID = fopen(genelist(files).name);
    data1 = textscan(fID, '%s %s %s %s');
    fclose(fID);
    words = [words; data1{1,1}(3:end)];
end

% sort text data and find frequencies
vocabulary = unique(words); % find unique genes
vocabulary_words = length(vocabulary); % how many unique genes
[vocabulary,void,index] = unique(words); %location of unique genes
frequencies = hist(index,vocabulary_words); %find frequenceis of unique genes
[ranked_frequencies,ranking_index] = sort(frequencies,'descend'); % sort unique genes in descending order
ranked_vocabulary = vocabulary(ranking_index); % align gene names with ranked frequencies

% plot data as bar graph 
barh(ranked_frequencies(1:15));
set(gca,'yticklabel',ranked_vocabulary(1:15))
title('Overlaps')

% plot overlapping with known 
figure
[geneoverlapknown, d3O, d4O] = intersect(ranked_vocabulary, genes{1,1});
leftover = sort(d3O);
ranked_vocabularyO = ranked_vocabulary(leftover);
ranked_frequenciesO = ranked_frequencies(leftover);
barh(ranked_frequenciesO(1:15));
set(gca,'yticklabel',ranked_vocabularyO(1:15))
title('Known overlaps');
