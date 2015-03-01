%% sc
clear all
clc

load('data/sc.mat')
x2to4 = linspace(2, 4, 30);
plot(x2to4, sc)
title('SC - energy over lattice parameter', 'FontSize', 14)
xlabel('lattice parameter [Å]', 'FontSize', 14)
ylabel('Energy [eV]', 'FontSize', 14)
legend('(Al, Al, Al, Al)', '(Mg, Al, Al, Al)', '(Mg, Mg, Al, Al)', '(Mg, Al, Mg, Al)', '(Mg, Mg, Mg, Al)', '(Mg, Mg, Mg, Mg)')

scMin = min(sc, [], 2); %the minimum of each row (setup)
scMin(4) = [];% Vi räknar bara med 1 50% 50% uppsättning.


%% fcc

load('data/fcc.mat')

x = linspace(3,5,30);
plot(x,fcc)
title('FCC - energy over lattice parameter', 'FontSize', 14)
xlabel('lattice parameter [Å]', 'FontSize', 14)
ylabel('Energy [eV]', 'FontSize', 14)
legend('(Al, Al, Al, Al)', '(Mg, Al, Al, Al)', '(Mg, Mg, Al, Al)', '(Mg, Mg, Mg, Al)', '(Mg, Mg, Mg, Mg)')

fccMin = min(fcc,[],2);
latticeparameter = x(find(fcc(4,:) == fccMin(4)))
AlEnergy = fccMin(1);
%% bcc, seems like we have the full range

load('data/bcc.mat') %Gives the saved .mat file the the dlmread produces above


x = linspace(2,6,60);
plot(x,bcc_full)
title('BCC - energy over lattice parameter', 'FontSize', 14)
xlabel('lattice parameter [Å]', 'FontSize', 14)
ylabel('Energy [eV]', 'FontSize', 14)
legend('(Al, Al, Al, Al)', '(Mg, Al, Al, Al)', '(Mg, Mg, Al, Al)', '(Mg, Al, Mg, Al)', '(Mg, Mg, Mg, Al)', '(Mg, Mg, Mg, Mg)')

bccMin = min(bcc_full,[],2); %the minimum of each row (setup)
MgEnergy = bccMin(end);
bccMin(4) = []; % vi räknar bara med en 50%-50%

%% Find what structure is the optimal!

x = [0 0.25, 0.5 0.75 1];



Eref(1,:) = x.*MgEnergy + (1-x).*AlEnergy - fccMin';    %fcc
Eref(2,:) = x.*MgEnergy + (1-x).*AlEnergy - bccMin';    %bcc
Eref(3,:) = x.*MgEnergy + (1-x).*AlEnergy - scMin';    %sc
plot(x,-Eref)
legend('fcc', 'bcc', 'sc')





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

