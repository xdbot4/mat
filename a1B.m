a=[2, 4; 3 ,5];
b=[8; 15];
y=0:1:15;
x11=(b(1)-a(1,2)*y)/a(1,1);
x21=(b(2)-a(2,2)*y)/a(2,1);
x11=max(0,x11);
x21=max(0,x21);

plot(y,x11,'r',y,x21,'b')
title('Graphical method');
xlabel('y');
ylabel('x');

c1=find(y==0);
c2=find(x11==0);

line1=[y(:,[c2,c1]) ; x11(:,[c2,c1])];

c1=find(y==0);
c2=find(x21==0);
line2=[y(:,[c2,c1]) ; x21(:,[c2,c1])];
corpt=unique([line1, line2], 'rows');
%1
pts=[];
for i=1:2
    for j=i+1:2
        P=[a(i,:);a(j,:)];
        Q=[b(i);b(j)];
        x=inv(P)*Q;
        pts=[x;pts]
    end
end