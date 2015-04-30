%% code to read in and plot head circ data
% wb 1 -16 15
clear
clc
%add path for folders
addpath(genpath('/home/lauren/Lauren_analysis'));
cd('/home/lauren/Lauren_analysis');
cd('Data')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% drag and drop the data into the workspace%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% the data is headcirc.csv


matID = cell2mat(id); % convert id numbers to matrix and not cells
storenum = str2num(matID(:,1:6)); %Change to number to get unique id numbers
storeuniquenames = unique(storenum); % store unique names from ids

%loop to find the locations of start and end for unique ids
for x = 1:length(storeuniquenames)
    minstorelocations(x) = min(find(storenum == storeuniquenames(x)));
    maxstorelocations(x) = max(find(storenum == storeuniquenames(x)));
end

storegroup = group(maxstorelocations,:); % store the dx of each ppt
% sort data by group norms are coded as 2 here 
norm = find(storegroup>1);
asddm = find(storegroup >0);
asddm = setdiff(asddm, norm);
asdnorm = find(storegroup<1);

preagearray = zeros(212,20);
preagearray(preagearray==0) = NaN;
prehxarray = zeros(212,20);
prehxarray(prehxarray==0) = NaN;

for x = 1:length(minstorelocations)
    lengthtostore = maxstorelocations(x) -minstorelocations(x) +1;
    preagearray(x,1:lengthtostore) = age(minstorelocations(x):maxstorelocations(x));
    prehxarray(x,1:lengthtostore) = height(minstorelocations(x):maxstorelocations(x));
end

%% for height

for x = 1:length(minstorelocations)
    lengthtostore = maxstorelocations(x) -minstorelocations(x) +1;
    preagearray(x,1:lengthtostore) = agec(minstorelocations(x):maxstorelocations(x));
    prehxarray(x,1:lengthtostore) = height(minstorelocations(x):maxstorelocations(x));
end



plot(preagearray(asdnorm,:)',prehxarray(asdnorm,:)', 'go','LineWidth',1,...
                'MarkerEdgeColor','g',...
                'MarkerFaceColor','g',...
                'MarkerSize',3) %plot the asddm group

hold on
plot(preagearray(asddm,:)',prehxarray(asddm,:)', 'ro','LineWidth',1,...
                'MarkerEdgeColor','r',...
                'MarkerFaceColor','r',...
                'MarkerSize',3)
plot(preagearray(norm,:)', prehxarray(norm,:)', 'bo','LineWidth',1,...
                'MarkerEdgeColor','b',...
                'MarkerFaceColor','b',...
                'MarkerSize',3)
%% how to add a title and stuff
title('Head circumference by group', 'FontSize', 20);
xlabel('Age (months)', 'FontSize', 16);
ylabel('Head circumference (cm)', 'FontSize', 16);


%% plost curves

% linear

plot(preagearray(asdnorm,:)',prehxarray(asdnorm,:)', 'go','LineWidth',1,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor','g',...
    'MarkerSize',3) %plot the asddm group

hold on

yfit = (.2660)*preagearray(asdnorm,:)+33.8763;
ageasdnorm2 = ageasdnorm(:);
yfit2 = yfit(:);
[b,iasdnorm] = sort(ageasdnorm2);
plot(ageasdnorm2(iasdnorm), yfit2(iasdnorm), 'g','LineWidth',4)
hold on;
plot(preagearray(asdnorm,:),yfit,'g-.');%plot line for curv 
% TD
% intercept: 33.8763
% slope: 0.2660

plot(preagearray(asddm,:)',prehxarray(asddm,:)', 'ro','LineWidth',1,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'MarkerSize',3)

yfit = (.2441)*preagearray(asddm,:)+34.3323;
hold on;
ageasddm = preagearray(asddm,:);
ageasddm2 = ageasddm(:);
yfit2 = yfit(:);
[b,iasddm] = sort(ageasddm2);
plot(ageasddm2(iasddm),yfit2(iasddm), 'r','LineWidth',4)
% 
% ASD-DM
% intercept: 34.3323
% slope: 0.2441

plot(preagearray(norm,:)', prehxarray(norm,:)', 'bo','LineWidth',1,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'MarkerSize',3)

yfit = 0.2637*preagearray(norm,:)+34.4395;
agenorm = preagearray(norm,:);
agenorm2 = agenorm(:);
yfit2 = yfit(:);
[b,inorm] = sort(agenorm2);
plot(agenorm2(inorm), yfit2(inorm), 'b' ,'LineWidth',4)
% ASD-norm
% intercept: 34.4395
% slope: 0.2637

% quadratic
%% non age centered linear
% linear

plot(preagearray(asdnorm,:)',prehxarray(asdnorm,:)', 'go','LineWidth',1,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor','g',...
    'MarkerSize',3) %plot the asddm group

hold on

yfit = (.2660)*preagearray(asdnorm,:)+ 27.4650;
ageasdnorm = preagearray(asdnorm,:);
ageasdnorm2 = ageasdnorm(:);
yfit2 = yfit(:);
[b,iasdnorm] = sort(ageasdnorm2);
plot(ageasdnorm2(iasdnorm), yfit2(iasdnorm), 'g','LineWidth',4)
hold on;
plot(preagearray(asdnorm,:),yfit,'g-.');%plot line for curv 
% TD
% intercept: 27.4650
% slope: 0.2660

plot(preagearray(asddm,:)',prehxarray(asddm,:)', 'ro','LineWidth',1,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'MarkerSize',3)

yfit = (.2441)*preagearray(asddm,:)+28.4498;
hold on;
ageasddm = preagearray(asddm,:);
ageasddm2 = ageasddm(:);
yfit2 = yfit(:);
[b,iasddm] = sort(ageasddm2);
plot(ageasddm2(iasddm),yfit2(iasddm), 'r','LineWidth',4)
% 
% ASD-DM
% intercept: 28.4498
% slope: 0.2441

plot(preagearray(norm,:)', prehxarray(norm,:)', 'bo','LineWidth',1,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'MarkerSize',3)

yfit = 0.2637*preagearray(norm,:)+28.0845;
agenorm = preagearray(norm,:);
agenorm2 = agenorm(:);
yfit2 = yfit(:);
[b,inorm] = sort(agenorm2);
plot(agenorm2(inorm), yfit2(inorm), 'b' ,'LineWidth',4)
% ASD-norm
% intercept: 28.0845
% slope: 0.2637


%%



plot(preagearray(asdnorm,:)',prehxarray(asdnorm,:)', 'go','LineWidth',1,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor','g',...
    'MarkerSize',3) %plot the asddm group

hold on

fitresults =[-.00541+.000597, .5928-.03114, 37.7882+.488]; %fit results from sas
xplot1 = ~isnan(preagearray(asdnorm,:)); %find nan values
xplot2 = find(xplot1); % find where the nans are
asddmstore = preagearray(asdnorm,:);% make new var of nans
xplot3 = asddmstore(xplot2);% only get non nan values
yplot1 = polyval(fitresults,sort(xplot3)); % evaluate the polynomial equation on sorted data
 plot(sort(xplot3),yplot1, 'g') % plot it


plot(preagearray(asddm,:)',prehxarray(asddm,:)', 'ro','LineWidth',1,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'MarkerSize',3)
hold on

fitresults =[-.00541-.00199, .5928+ .1063, 37.7882+1.0476]; %fit results from sas
xplot1 = ~isnan(preagearray(asddm,:)); %find nan values
xplot2 = find(xplot1); % find where the nans are
asddmstore = preagearray(asddm,:);% make new var of nans
xplot3 = asddmstore(xplot2);% only get non nan values
yplot1 = polyval(fitresults,sort(xplot3)); % evaluate the polynomial equation on sorted data
 plot(sort(xplot3),yplot1, 'r') % plot it


plot(preagearray(norm,:)', prehxarray(norm,:)', 'bo','LineWidth',1,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'MarkerSize',3)
hold on

fitresults =[-.00541, .5928, 37.7882]; %fit results from sas
xplot1 = ~isnan(preagearray(norm,:)); %find nan values
xplot2 = find(xplot1); % find where the nans are
asddmstore = preagearray(norm,:);% make new var of nans
xplot3 = asddmstore(xplot2);% only get non nan values
yplot1 = polyval(fitresults,sort(xplot3)); % evaluate the polynomial equation on sorted data
 plot(sort(xplot3),yplot1, 'b') % plot it


storedm = preagearray(asddm,:)';
storedm2 = prehxarray(asddm,:)';


