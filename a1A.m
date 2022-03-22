%3x1 + 2x2 - max
%2x1 + 4x2 <= 6
%3x1 + 5x2 >= 15
%x1, x2 >=0

C = [3 2];
A = [2 4; 3 5];
B = [8; 15];

rangex1 = 0:1:100;


%%
x21 = 6 - (A(1, 1) .* rangex1) ./ A(1, 2);
x22 = 15 - (A(2, 2) .* rangex1) ./ A(2, 2);

x21=max(0, x21);
x22=max(0, x22);

plot(rangex1, x21, 'g', rangex1, x22, 'b');
grid on;

%A1 = A[1,:];
%A3(1, :) = A1(1,);
%A3 = (A(1,:); A(2,:));
%B3 = cat(2, B(1,:), B(2,:));
sol = A\B;
%x1 = sol(:, 1)
%sol;
%x2 = sol(:, 2)