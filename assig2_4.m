C=[1 1 1 0 0];  %cost of lpp
A=[1 1 0 1 0; 0 -1 1 0 1]; %constraint values
b=[1 ; 0]; % rhs of constraint

m=size(A,1);
n=size(A,2);
if n>=m
nv= nchoosek(n,m); % total number of basic solution
t= nchoosek(1:n,m); % pairs of basic solutions

sol=[];
for i=1:nv
    y=zeros(n,1);
    x=A(:,t(i,:))\b;
 if all(x>=0 & x~=inf & x~=-inf) 
    y(t(i,:))=x;
    sol=[sol y];
end
end
else
    error('Equations larger than constraints')
end
disp(sol);

Z=C*sol;

%Finding the optimal value
[Zmax, Zind]= max(Z);
BFS = sol(:,Zind); %optimal BFS values


optval= [BFS' Zmax];  %index corres to max value
OPTIMAL_BFS = array2table(optval); %print in table
OPTIMAL_BFS.Properties.VariableNames(1:size(OPTIMAL_BFS,2))={'x_1','x_2','x_3','x_4','x_5','Value_of_Z'}