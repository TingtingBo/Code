i = 1

for x = 1:length(Rawpre)
    if isnan(Rawpre(x,2))==0
        Rawpre2(i,:) = Rawpre(x,:);
        i = i + 1;
    end
end
[correctedRawpre] = timecalculator(Rawpre);
function [corrected] = timecalculator(raw)
%TIMECALCULATOR Corrects times for TIADL tasks given the task and accuracy
m = 1;
corrected(:,1) = raw(:,1);
corrected(:,2) = raw(:,2);
corrected(:,3) = raw(:,4);
for z = 6:2:10
    [x] = find(ismember(raw(:,z+1),1));
    for i = 1:length(x)
        stdnumbers{m}(i) = raw(x(i),z);
    end
    standarddeviations(m) = std(stdnumbers{m});
    
    [y] = find(ismember(raw(:,z+1),2));
    for j = 1:length(y)
        raw(y(j),z) = raw(y(j),z)+standarddeviations(m);
    end
    m = m+1;
end
corrected(:,4) = raw(:,6);
corrected(:,5) = raw(:,8);
corrected(:,6) = raw(:,10);
end

Zpre = zscore(correctedRawpre(:,2:6));
Zpre(:,6) = mean(Zpre(:,1:5),2);
Zpre = horzcat(correctedRawpre(:,1),Zpre);