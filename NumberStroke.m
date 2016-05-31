function [Ns,index] = NumberStroke(pnt)
% input:
% pnt = points set
% output:
% Ns = number of strokes
% index = index of break points 

N = size(pnt,1);
x=pnt(:,1);
y=pnt(:,2);
t=pnt(:,3);

d=sqrt((x(2:end)-x(1:end-1)).^2+(y(2:end)-y(1:end-1)).^2);
arc=zeros(N,1);
arc(1)=0;
for i=1:N-1;
    arc(i+1)=d(i);
end
Bp=find(arc>0.1); % distance to classify 2 stroke

% use time to discriminate wrong decision
temp=t(2:end)-t(1:end-1);
dt=zeros(N,1);
dt(1)=0;
for i=1:N-1
    dt(i+1)=temp(i);
end
Bpt=find(dt>0.1);

if size(Bp,1)==0
    Ns=1;
elseif size(Bpt,1)==0
    Ns=1;
else
    Ns=size(intersect(Bp,Bpt),1)+1;
end
index=(intersect(Bp,Bpt));






