% Add paths for tests
addpath('./helpers');
addpath('./learning');
addpath('./scripts');
addpath('./data');
addpath('./att_faces');

% Clear & close every opened windows
clear;
close all;

% Init arrays for percentages
perc_random = [];
perc_not_random = [];

% Display the results / the 5 nearest neighbours?
display_result = 0;

% For various size of E...
for size_E = 10:10:100
    disp(' ');
    e = sprintf('E = %d',size_E);
    disp(e);
    % Start timer
    tic
    randomize = 0;

    disp('DO LEARNING WITHOUT RANDOMISED IMAGE SELECTION');
    perc1 = benchmark(randomize,size_E,display_result);

    randomize = 1;
    disp('DO LEARNING WITH RANDOMISED IMAGE SELECTION');
    perc2 = benchmark(randomize,size_E,display_result);

    % Comparison between perfs
    perc_not_random = [perc_not_random ; size_E , perc1];
    perc_random = [perc_random ; size_E , perc2];
    toc
end

% Display results of overall accuracy
figure();
all=[];
for i=10:10:100
    plot(perc_random(i/10,2:end)');
    actual=sprintf('%d',i);
    all = char(all,actual);
    hold on;
end
legend(all(2:end,:),'Location','northwest')
title('Efficiency of recognition, depending of the number of images in DB & the size of E. Randomized data.')
xlabel('Number of images per individuals in DB')
ylabel('Efficiency of recognition') 

figure();
all=[];
for i=10:10:100
    plot(perc_not_random(i/10,2:end)');
    actual=sprintf('%d',i);
    all = char(all,actual);
    hold on;
end
legend(all(2:end,:))
legend(all(2:end,:),'Location','northwest')
title('Efficiency of recognition, depending of the number of images in DB & the size of E.')
xlabel('Number of images per individuals in DB')
ylabel('Efficiency of recognition') 