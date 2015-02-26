%saves result into more manegable format (.mat format)

% SC
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