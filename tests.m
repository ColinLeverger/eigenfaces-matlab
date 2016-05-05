addpath('./helpers');
addpath('./learning');
addpath('./tests');
addpath('./data');
addpath('./att_faces');
clear;
close all;

size_E = 48;

for size_E = 10:10:100
    randomize = 0;
    disp('DO LEARNING WITHOUT RANDOMISED IMAGE SELECTION');
    perc1 = benchmark(randomize,size_E);
    disp(' ');

    randomize = 1;
    disp('DO LEARNING WITH RANDOMISED IMAGE SELECTION');
    perc2 = benchmark(randomize,size_E);

    % Comparison between perfs
    figure();
    plot(perc1,'red');
    hold on;
    plot(perc2,'blue');
end
