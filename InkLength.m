function L = InkLength(P)
% input:
% P = points set in original coordinate
% output:
% L = arc length of the entire ink


x=P(:,1);
y=P(:,2);
d=sqrt((x(2:end)-x(1:end-1)).^2+(y(2:end)-y(1:end-1)).^2);

m=size(d,1);
% seperate multi stroke condition by threshold 0.1

L=sum(d);