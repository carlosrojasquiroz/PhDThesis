clc;clear;close all;
%---------------------------------------------------------------------------------
addpath(genpath('Data')); addpath(genpath('Functions')); 
%---------------------------------------------------------------------------------
p = Parameters();
k = ShockKanzig(p);
d = DataManagement(p,k);
LocalProjection(p)

