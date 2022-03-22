%x1, x2 <= 4
%-x1 + x2 <= 6
%-x1+2x3 <= 4
%max(-x1 + 2x3 -x3)

n = 7;
m = 4;
C = [-1 2 -1 0 0 0 0];
A = [ 1 0 0 1 0 0 0
      0 1 0 0 1 0 0
     -1 1 0 0 0 1 0
     -1 0 2 0 0 0 1];
b = [4;4;6;4];

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
maximum_values = C*bfs;
[maximum, index] = max(maximum_values);
BFS = bfs(:, index);
bfs = [BFS', maximum]