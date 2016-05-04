addpath('./helpers');
addpath('./learning');
addpath('./tests');
addpath('./data');
addpath('./att_faces');
clear;
close all;

disp('DO LEARNING WITHOUT RANDOMISED IMAGE SELECTION');
perc1 = benchmark(0);
disp(' ');
disp('DO LEARNING WITH RANDOMISED IMAGE SELECTION');
perc2 = benchmark(1);

% Comparison between perfs
plot(perc1,'red');
hold on;
plot(perc2,'blue');
