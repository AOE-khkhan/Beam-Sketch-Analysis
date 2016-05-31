function C = ModifiedCenter(P)
% input:
% P = points set in original coordinate
% output:
% C = New modified center point

% initialization
x=P(:,1);
y=P(:,2);
d=sqrt((x(2:end)-x(1:end-1)).^2+(y(2:end)-y(1:end-1)).^2);
S=size(d,1); % number of segments
% caculation
l=zeros(S,1);
xtemp=zeros(1,2);
ytemp=zeros(1,2);
for i=1:S
    l(i)=d(i);
    xtemp(i)=x(i+1)*l(i);
    ytemp(i)=y(i+1)*l(i);
end
xc=sum(xtemp)/sum(l);
yc=sum(ytemp)/sum(l);

C=[xc,yc];

