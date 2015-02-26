clear all
clc

data = zeros(15,30);
data(1,:) = dlmread('1mg3al_bcc_3to5in30_co300','\t',10,0);
data(2,:) = dlmread('1mg3al_fcc_3to5in30_co300','\t',10,0);
data(3,:) = dlmread('1mg3al_sc_3to5in30_co300','\t',10,0);
data(4,:) = dlmread('2al2mg_bcc_3to5in30_co300','\t',10,0);
data(5,:) = dlmread('2al2mg_fcc_3to5in30_co300','\t',10,0);
data(6,:) = dlmread('2al2mg_sc_3to5in30_co300','\t',10,0);
data(7,:) = dlmread('3mg1al_bcc_3to5in30_co300','\t',10,0);
data(8,:) = dlmread('3mg1al_fcc_3to5in30_co300','\t',10,0);
data(9,:) = dlmread('3mg1al_sc_3to5in30_co300','\t',10,0);
data(10,:) = dlmread('4al_bcc_3to5in30_co300','\t',10,0);
data(11,:) = dlmread('4al_fcc_3to5in30_co300','\t',10,0);
data(12,:) = dlmread('4al_sc_3to5in30_co300','\t',10,0);
data(13,:) = dlmread('4mg_bcc_3to5in30_co300','\t',10,0);
data(14,:) = dlmread('4mg_fcc_3to5in30_co300','\t',10,0);
data(15,:) = dlmread('4mg_sc_3to5in30_co300','\t',10,0);

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



