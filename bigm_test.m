A = [2 1; 1 7];
I = [-1 0; 0 -1];
I2 = eye(2);
bi = [4;7];
A = [A I I2 bi];
M = 1000;
cost = [-1 -1 0 0 -M -M 0];
v = [5 6];

%zj - cj
zj_cj = cost(v)*A - cost;
zcj = [zj_cj; A];

while(1)
   %zcj
   A
   if any(zj_cj<0)
       % entering
       [entering , pivot_column] = min(zj_cj(1:end - 1));
       
       %leaving
       solution = A(:, end);
       col = A(:, pivot_column);
       if all(col < 0)
           disp("Unbounded")
           col
           break;
       else
           for i=1:2
               if (col(i) <= 0)
                   ratio(i) = Inf;
               else
                   ratio(i) = solution(i)./col(i);
               end
           end
           [minimum_ration, pivot_row] = min(ratio);
       end
       %break;
       save = v(pivot_row);
       v(pivot_row) = pivot_column;
       pivot_element = A(pivot_row, pivot_column);
       %dividing pivot row by pivot element 
       A(pivot_row, :) = A(pivot_row, :) ./ pivot_element;
       zcj = [zj_cj; A];
       for i = 1:2
           if i~=pivot_row
               A(i, :) = A(i, :) - A(i, pivot_column) .* A(pivot_row, :);
           end
       end
       zj_cj=zj_cj-zj_cj(pivot_column).*A(pivot_row,:);
       zcj=[zj_cj;A];
       zj_cj(:, pivot_column) = [];
       A(:, save) = [];
   else
       disp("Final solution = ")
       solution
       break;
   end
end