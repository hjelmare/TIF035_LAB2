clear all
clc

data = zeros(4,30);
data(1,:) = dlmread('data/3to5in30_k8/4al_fcc_3to5in30_co300_k8','\t',11,0);
data(2,:) = dlmread('data/3to5in30_k8/1mg3al_fcc_3to5in30_co300_k8','\t',11,0);
data(3,:) = dlmread('data/3to5in30_k8/3mg1al_fcc_3to5in30_co300_k8','\t',11,0);
data(4,:) = dlmread('data/3to5in30_k8/4mg_fcc_3to5in30_co300_k8','\t',11,0);

x = linspace(3,5,30);
plot(x,data)

%save('dataFile.mat','data')

%% K sweep

clear all
clc

data = dlmread('sweepKData','\t');
plot(data(:,1),data(:,2))


%% cutoff sweep

clear all
clc

data = dlmread('sweepCutoffData','\t');
plot(data(:,1),data(:,2))



