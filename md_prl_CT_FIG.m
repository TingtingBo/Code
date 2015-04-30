mdfd = [1.950, 1.547, 1.671, 2.371]; mdfd = mdfd';
mdid = [1.458, 1.117, 1.486, 1.723]; mdid = mdid';
confd = [1.460, 1.305, 2.124, 2.124]; confd = confd';
conid = [0.933, 1.201, 1.801, 1.956]; conid = conid';

data(:,3) = conid;
data(:,4) = confd;
data(:,1) = mdid;
data(:,2) = mdfd;

