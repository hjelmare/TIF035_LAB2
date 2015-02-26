%% import all sc data
% The commented first part reads from data file, but we saved the data in
% variable sc.mat that is imported further down to not have to work with
% all this text!

% clear all
% clc
% %the ones from 2 to 6
% temp(1,:) = dlmread('data/2to6in60_k8/4al_sc_2to6in60_co300','\t',11,0); %(0,0,0,0)
% temp(2,:) = dlmread('data/2to6in60_k8/mgalmgal_sc_2to6in60_co300','\t',11,0); %(1,0,1,0)
% temp(3,:) = dlmread('data/2to6in60_k8/3mg1al_sc_2to6in60_co300','\t',11,0); %(1,1,1,0)
% 
% %the ones that were run in two sets from 2 to 4
% a = dlmread('data/2to3in15_k8/1mg3al_sc_2to3in15_co300','\t',11,0); %(1,0,0,0)
% b = dlmread('data/3to4in15_k8/1mg3al_sc_3to4in15_co300','\t',11,0); 
% sc(2,:) = [a; b]';
% 
% a = dlmread('data/2to3in15_k8/2al2mg_sc_2to3in15_co300','\t',11,0); %(1,1,0,0)
% b = dlmread('data/3to4in15_k8/2al2mg_sc_3to4in15_co300','\t',11,0); 
% sc(3,:) = [a; b]';
% 
% a = dlmread('data/2to3in15_k8/4mg_sc_2to3in15_co300','\t',11,0); %(1,1,1,1)
% b = dlmread('data/3to4in15_k8/4mg_sc_3to4in15_co300','\t',11,0); 
% sc(6,:) = [a; b]';
% 
% %Samlar allt i sc:
% sc(1,:) = temp(1, 1:30);
% sc(4:5,:) = temp(2:3, 1:30);

%x2to6 = linspace(2, 6, 60);
%plot(x2to6, temp) % plottar de med data för 2 till 6
clear all
clc

load('data/sc.mat')
x2to4 = linspace(2, 4, 30);
plot(x2to4, sc)
title('SC - energy over lattice parameter', 'FontSize', 14)
xlabel('lattice parameter [Å]', 'FontSize', 14)
ylabel('Energy [eV]', 'FontSize', 14)
legend('(Al, Al, Al, Al)', '(Mg, Al, Al, Al)', '(Mg, Mg, Al, Al)', '(Mg, Al, Mg, Al)', '(Mg, Mg, Mg, Al)', '(Mg, Mg, Mg, Mg)')
% x2to6 = linspace(2, 6, 60);
% x2to4 = linspace(2, 4, 30);
% hold on
% plot(x2to6, temp)
% plot(x2to4, sc)

%% fcc

data = zeros(4,30);
data(1,:) = dlmread('data/3to5in30_k8/4al_fcc_3to5in30_co300_k8','\t',11,0);
%data(2,:) = dlmread('data/3to5in30_k8/1mg3al_fcc_3to5in30_co300_k8','\t',11,0);
data(3,:) = dlmread('data/3to5in30_k8/3mg1al_fcc_3to5in30_co300_k8','\t',11,0);
data(4,:) = dlmread('data/3to5in30_k8/4mg_fcc_3to5in30_co300_k8','\t',11,0);


x = linspace(3,5,30);
plot(x,data(1:3,:))

%save('dataFile.mat','data')
legend('bcc', 'fcc', 'sc')


%% bcc, seems like we have the full range

clear all
clc

data = zeros(6,60);
data(1,:) = dlmread('data/2to6in60_k8/4al_bcc_2to6in60_co300_k8','\t',11,0);
data(2,:) = dlmread('data/2to6in60_k8/1mg3al_bcc_2to6in60_co300_k8','\t',11,0);
data(3,:) = dlmread('data/2to6in60_k8/2al2mg_bcc_2to6in60_co300_k8','\t',11,0);
data(4,:) = dlmread('data/2to6in60_k8/mgalmgal_bcc_2to6in60_co300_k8','\t',11,0);
data(5,:) = dlmread('data/2to6in60_k8/3mg1al_bcc_2to6in60_co300_k8','\t',11,0);
data(6,:) = dlmread('data/2to6in60_k8/4mg_bcc_2to6in60_co300_k8','\t',11,0);

x = linspace(2,6,60);
plot(x,data)

bcc_full = data;    

%save('data/bcc.mat','bcc_full')



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

