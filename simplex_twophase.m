function [A, v] = simplex_twophase(cost, A, v)
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
                disp(A(: ,end));
               break
           end
           %leaving
           solution = A(:, end);
           col = A(:, pivot_column);
           if all(col < 0)
               disp("Unbounded")
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
            disp(A(: ,end));
            break;
       end
    end
end