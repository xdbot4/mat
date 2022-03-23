A = [-1 1; 1 1];
I = eye(2);
bi = [1; 2];
A = [A I bi]
cost = [1, 2, 0, 0, 0];
v = [3, 4];

B = A(:, v);
A = inv(B) * A;
zjcj = cost(v) * A - cost

% print table
zcj = [zjcj; A];

while (1)
	zc = zjcj(:, 1:end -1)
	if any(zc < 0)
		disp("Current BFS is not optimal");
	
		[Entval, pvt_col] = min(zc);
		sol = A(:, end);
		col = A(:, pvt_col);
       if all(col < 0)
           disp("Unbounded")
           break; 
       else
            for i=1:size(A, 1)
                if col(i)>0
                    ratio(i) = sol(i) ./ col(i);
                else
                    ratio(i) = inf;
                end
            end
       end
        [minR, pvt_row] = min(ratio);
        
		v(pvt_row) = pvt_col;
		B = A(:, v);
		A = inv(B) * A;
		zjcj = cost(v) * A - cost
	else
		disp("Current BFS is optimal");
		break;
    end
end

final_bfs = zeros(1, size(A, 2));
final_bfs(v) = A(:, end);
final_bfs(end) = sum(final_bfs.*cost)