function [count, goptima_found]=analyse_mm_2013_res(X,func_num,accuracy)

Dims = [1 1 1 2 2 2 2 3 3 2 2 2 2 3 3 5 5 10 10 20]; % dimensionality of benchmark functions
%global initial_flag; % the global flag used in test suite 

NP=100;
initial_flag = 0; % should set the flag to 0 for each run, each function -- should have been defined as global in the calling function

% How many global optima have been found?
[count, goptima_found] = count_goptima(X, func_num, accuracy);
