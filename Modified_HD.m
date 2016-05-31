function d = Modified_HD(A,B)
% input:
% A,B = distance from points dataset A to B
% output:
% dm = modified Hausdorff distance 

% initialization
x1=A(:,1);
y1=A(:,2);
x2=B(:,1);
y2=B(:,2);

m=size(A,1);
n=size(B,1);

% distance caculation
dd=zeros(m,1);  
temp=zeros(n,1);
for i=1:m
    for j=1:n
        temp(j)=sqrt((x1(i)-x2(j)).^2+(y1(i)-y2(j)).^2);
    end
    dd(i)=min(temp);
end

d=sum(dd)/m;


        
        
        
        