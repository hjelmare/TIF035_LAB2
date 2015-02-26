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

x = linspace(3,5,30);
plot(x,data(1:3,:))

%save('dataFile.mat','data')
legend('bcc', 'fcc', 'sc')