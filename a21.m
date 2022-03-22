%-x1 + x2 <= 1;
%x1 + x2 <= 2

%max -> x1 + 2x2

n = 4;
m = 2;
C = [1 2 0 0];
A = [-1 1 1 0; 1 1 0 1];
b = [1; 2];
nv = nchoosek(n, m);
t = nchoosek(1:n, m);
bfs =[];
if n >= m
    for i=1:nv
        y = zeros(n, 1);
        x = A(:,t(i, :))\b;
        if all(x>=0 & x~=inf & x~=-inf)
            y(t(i, :)) = x;
            bfs = [bfs y];
        end
    end
end
Z = C*bfs;

[maximum, index] = max(Z);
bfs = bfs(:, index);
bfs = bfs'
