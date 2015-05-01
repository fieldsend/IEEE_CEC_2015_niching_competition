function [count,conv_evals]= cec_2015_test_problems_nmmso_script(index, fold)

% [count,conv_evals]= cec_2015_test_problems_nmmso_script(index, fold)
% index = index of problem
% fold = run number
% count = number of global peaks found at each of the accuracy levels
% conv_evals = number of evalsations untill all global peaks found for each
% accuracy level, if not found, set at max_evals+1 for that problem

rng(fold); % set seed for random number generator using the fold number
cec_2015_problem_data; % get ranges etc for the problems

% using the CEC test problems
problem_used = 'niching_func'; % use the test problem provided in the competition


eval_list=[];
c_list=[];
pop_size=[];
global initial_flag; % the global flag used in test suite

initial_flag = 0;
acc = [0.1; 0.01; 0.001; 0.0001; 0.00001];

count = zeros(5,1);

state=[]; evals=0;

while (evals<gens(index)) && (count(5)~=nopt(index))
    old_count = count;
    [RES,RES_Y,evals,state]=NMMSO_iterative(10*length(mx{index}),problem_used,index, gens(index),mn{index},mx{index},evals,state);
    
    mv = max(RES_Y);
    I = find(RES_Y>(mv-0.1)); % for efficiency, only check those solutions within 0.1 of the max found so far
    for i=1:5
        count(i)=analyse_mm_2013_res(RES(I,:),index,acc(i));
    end
    eval_list = [eval_list evals];
    c_list = [c_list count];
    pop_size = [pop_size length(RES_Y)];
    %count'
end

% if overran evaluations, truncate final generation
if (evals>gens(index))
    c_list(:,end) = [];
    count = old_count;
end

% conv_evals holds the number of function evaluations required to reach
% success on all optima for each level
for j=1:5;
    I = find(c_list(j,:)==nopt(index));
    if isempty(I)==0
        conv_evals(j) = eval_list(I(1));
    else
        conv_evals(j) = gens(index)+1; % plus one to limit to denote never reached
    end
end
count = count';
fid = fopen(strcat('CEC_2015_comp_res_nmmso_problem', int2str(index), '_fold',int2str(fold),'.txt'), 'wt');
fprintf(fid, '%d ', count);
fclose(fid);
  
fid = fopen(strcat('CEC_2015_comp_res_evals_nmmso_problem', int2str(index), '_fold',int2str(fold),'.txt'), 'wt');
fprintf(fid, '%d ', conv_evals);
fclose(fid);