% cec_2015_problem_data

% set up problem data (values taken from example competition scripts)
gens = [50000*ones(1,5) 200000 200000 400000 400000 200000*ones(1,4) 400000*ones(1,7)];
nopt = [2 5 1 4 2 18 36 81 216 12 6 8 6 6 8 6 8 6 6 8];
Dims = [1 1 1 2 2 2 2 3 3 2 2 2 2 3 3 5 5 10 10 20];

mn{1}=0;
mn{2}=0;
mn{3}=0;
mn{4}=[-6 -6];
mn{5}=[-1.9 -1.1];
mn{6}=[-10 -10];
mn{7}=[0.25 0.25];
mn{8}=[-10 -10 -10];
mn{9}=[0.25 0.25 0.25];
mn{10}=[0 0];
mn{11}=-5*ones(1,2);
mn{12}=-5*ones(1,Dims(12));
mn{13}=-5*ones(1,Dims(13));
mn{14}=-5*ones(1,Dims(14));
mn{15}=-5*ones(1,Dims(15));
mn{16}=-5*ones(1,Dims(16));
mn{17}=-5*ones(1,Dims(17));
mn{18}=-5*ones(1,Dims(18));
mn{19}=-5*ones(1,Dims(19));
mn{20}=-5*ones(1,Dims(20));


mx{1}=30;
mx{2}=1;
mx{3}=1;
mx{4}=[6 6];
mx{5}=[1.9 1.1];
mx{6}=[10 10];
mx{7}=[10 10];
mx{8}=[10 10 10];
mx{9}=[10 10 10];
mx{10}=[1 1];
mx{11}=5*ones(1,2);
mx{12}=5*ones(1,Dims(12));
mx{13}=5*ones(1,Dims(13));
mx{14}=5*ones(1,Dims(14));
mx{15}=5*ones(1,Dims(15));
mx{16}=5*ones(1,Dims(16));
mx{17}=5*ones(1,Dims(17));
mx{18}=5*ones(1,Dims(18));
mx{19}=5*ones(1,Dims(19));
mx{20}=5*ones(1,Dims(20));