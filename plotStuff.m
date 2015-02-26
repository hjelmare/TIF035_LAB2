clear all
clc

data = zeros(15,30);
data(1,:) = dlmread('data/1mg3al_bcc_3to5in30_co300','\t',10,0);
data(2,:) = dlmread('data/1mg3al_fcc_3to5in30_co300','\t',10,0);
data(3,:) = dlmread('data/1mg3al_sc_3to5in30_co300','\t',10,0);
% data(4,:) = dlmread('data/2al2mg_bcc_3to5in30_co300','\t',10,0);
% data(5,:) = dlmread('data/2al2mg_fcc_3to5in30_co300','\t',10,0);
% data(6,:) = dlmread('data/2al2mg_sc_3to5in30_co300','\t',10,0);
% data(7,:) = dlmread('data/3mg1al_bcc_3to5in30_co300','\t',10,0);
% data(8,:) = dlmread('data/3mg1al_fcc_3to5in30_co300','\t',10,0);
% data(9,:) = dlmread('data/3mg1al_sc_3to5in30_co300','\t',10,0);
% data(10,:) = dlmread('data/4al_bcc_3to5in30_co300','\t',10,0);
% data(11,:) = dlmread('data/4al_fcc_3to5in30_co300','\t',10,0);
% data(12,:) = dlmread('data/4al_sc_3to5in30_co300','\t',10,0);
% data(13,:) = dlmread('data/4mg_bcc_3to5in30_co300','\t',10,0);
% data(14,:) = dlmread('data/4mg_fcc_3to5in30_co300','\t',10,0);
% data(15,:) = dlmread('data/4mg_sc_3to5in30_co300','\t',10,0);

%% import all sc data
%the ones from 2 to 6
temp(1,:) = dlmread('data/4al_sc_2to6in60_co300','\t',11,0); %(0,0,0,0)
temp(2,:) = dlmread('data/3mg1al_sc_2to6in60_co300','\t',11,0); %(1,1,1,0)
%temp(3,:) = dlmread('data/mgalmgal_sc_2to6in60_co300','\t',11,0); %(1,0,1,0)

%the ones that were run in two sets from 2 to 4
sc(1,:) = dlmread('data/1mg3al_sc_2to3in15_co300','\t',11,0); %(1,0,0,0)
a = dlmread('data/1mg3al_sc_3to4in15_co300','\t',11,0); 
sc(1,:) = [sc(1,:) a];

sc(2,:) = dlmread('data/2mg2al_sc_2to3in15_co300','\t',11,0); %(1,1,0,0)
a = dlmread('data/2mg2al_sc_3to4in15_co300','\t',11,0); 
sc(2,:) = [sc(2,:) a];

sc(3,:) = dlmread('data/4mg_sc_2to3in15_co300','\t',11,0); %(1,1,1,1)
a = dlmread('data/4mg_sc_3to4in15_co300','\t',11,0); 
sc(3,:) = [sc(3,:) a];



%%

x = linspace(3,5,30);
plot(x,data(1:3,:))

%save('dataFile.mat','data')
legend('bcc', 'fcc', 'sc')


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

