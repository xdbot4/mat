A = [1 3; 1 1];
I1 = eye(2);
I2 = [-1 0; 0 -1];
bi = [3; 2];
A = [A I2 I1 bi]
cost = [0 0 0 0 -1 -1 0];
v = [5, 6];

disp("1ST PHASE STARTED");
[A, v] = simplex_twophase(cost, A, v);

A(:, end - 1) = [];
A(:, end - 1) = [];
% CHANGE
cost = [-3 -5 0 0 0];
disp("2ND PHASE STARTED");
[A, v] = simplex_twophase(cost, A, v);