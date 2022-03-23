A = [1 3; 1 1];
I2 = eye(2);
I1 = [-1 0; 0 -1];
bi = [3; 2];
A = [A I1 I2 bi]

cost = [0, 0, 0, 0, -1, -1, 0];
v = [5, 6];

%zj - cj
zj_cj = cost(v)*A - cost;
zcj = [zj_cj; A];
entering = -1;
count = 0;
while(1)
   disp(A);
   if any(zj_cj<0)
       entering
       [entering , pivot_column] = min(zj_cj(1:end - 1));
       if (entering >= 0)
           disp("Final solution = ")
           disp(solution)
           break
       end
       %leaving
       solution = A(:, end);
       col = A(:, pivot_column);
       if all(col < 0)
           disp("\nUnbounded\n")
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
%    else
%        disp("Final solution = ")
%        disp(solution)
%        break;
   end
   count = count + 1;
   if count == 2
    break;
   end
end
disp("PAHSE TWO")
A(:, end - 1) = [];
A(:, end - 1) = [];
cost = [-3, -5, 0, 0, 0];
v = [4, 5];
zj_cj = cost(v)*A - cost;
zcj = [zj_cj; A];
entering = -1;
while(1)
   A
   if any(zj_cj<0)
       % entering
       [entering , pivot_column] = min(zj_cj(1:end - 1));
       if (entering >= 0)
           disp("Final solution = ")
           disp(solution)
           break
       end
       %leaving
       solution = A(:, end);
       col = A(:, pivot_column);
       if all(col < 0)
           disp("\nUnbounded\n")
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
   else
       disp("Final solution = ")
       disp(A(:, end))
       break;
   end
end