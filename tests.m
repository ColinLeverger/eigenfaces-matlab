addpath('./helpers');
addpath('./learning');
addpath('./tests');
addpath('./data');
addpath('./att_faces');
clear;
close all;

tic
do_learning(5);
test_learning('./att_faces/s1/8.pgm');
toc