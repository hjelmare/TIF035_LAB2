%%saves result into more manegable format (.mat format)

%% SC
clear all
clc
%the ones from 2 to 6
temp(1,:) = dlmread('data/2to6in60_k8/4al_sc_2to6in60_co300','\t',11,0); %(0,0,0,0)
temp(2,:) = dlmread('data/2to6in60_k8/mgalmgal_sc_2to6in60_co300','\t',11,0); %(1,0,1,0)
temp(3,:) = dlmread('data/2to6in60_k8/3mg1al_sc_2to6in60_co300','\t',11,0); %(1,1,1,0)

%the ones that were run in two sets from 2 to 4
a = dlmread('data/2to3in15_k8/1mg3al_sc_2to3in15_co300','\t',11,0); %(1,0,0,0)
b = dlmread('data/3to4in15_k8/1mg3al_sc_3to4in15_co300','\t',11,0); 
sc(2,:) = [a; b]';

a = dlmread('data/2to3in15_k8/2al2mg_sc_2to3in15_co300','\t',11,0); %(1,1,0,0)
b = dlmread('data/3to4in15_k8/2al2mg_sc_3to4in15_co300','\t',11,0); 
sc(3,:) = [a; b]';

a = dlmread('data/2to3in15_k8/4mg_sc_2to3in15_co300','\t',11,0); %(1,1,1,1)
b = dlmread('data/3to4in15_k8/4mg_sc_3to4in15_co300','\t',11,0); 
sc(6,:) = [a; b]';

%Samlar allt i sc:
sc(1,:) = temp(1, 1:30);
sc(4:5,:) = temp(2:3, 1:30);

save('sc','sc');

%% FCC
clear all
clc

data = zeros(5,30);
data(1,:) = dlmread('data/3to5in30_k8/4al_fcc_3to5in30_co300_k8','\t',11,0);
data(2,:) = dlmread('data/3to5in30_k8/1mg3al_fcc_3to5in30_co300_k8','\t',11,0);

temp = dlmread('data/2to6in60_k8/2al2mg_fcc_2to6in60_co300_k8','\t',11,0);
temp = temp(16:end-15);
data(3,:) = temp';

data(4,:) = dlmread('data/3to5in30_k8/3mg1al_fcc_3to5in30_co300_k8','\t',11,0);
data(5,:) = dlmread('data/3to5in30_k8/4mg_fcc_3to5in30_co300_k8','\t',11,0);

fcc = data;
save('data/fcc.mat','fcc')

%% BCC

data = zeros(6,60);
data(1,:) = dlmread('data/2to6in60_k8/4al_bcc_2to6in60_co300_k8','\t',11,0);
data(2,:) = dlmread('data/2to6in60_k8/1mg3al_bcc_2to6in60_co300_k8','\t',11,0);
data(3,:) = dlmread('data/2to6in60_k8/2al2mg_bcc_2to6in60_co300_k8','\t',11,0);
data(4,:) = dlmread('data/2to6in60_k8/mgalmgal_bcc_2to6in60_co300_k8','\t',11,0);
data(5,:) = dlmread('data/2to6in60_k8/3mg1al_bcc_2to6in60_co300_k8','\t',11,0);
data(6,:) = dlmread('data/2to6in60_k8/4mg_bcc_2to6in60_co300_k8','\t',11,0);

bcc_full = data;
save('data/bcc.mat','bcc_full')