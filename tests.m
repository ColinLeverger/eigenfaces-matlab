addpath('./helpers');
addpath('./learning');
addpath('./tests');
addpath('./data');
addpath('./att_faces');
clear;
close all;

do_learning(9);
test_learning('./att_faces/s1/10.pgm');