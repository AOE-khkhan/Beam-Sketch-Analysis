function [F]=getfeature(pnt)
% input:
% pnt = points dataset
% output:
% F = features vector after computation

% initial parameters related features:
x1=pnt(1,1);y1=pnt(1,2);
x3=pnt(3,1);y3=pnt(3,2);
xmax=max(pnt(:,1));xmin=min(pnt(:,1));
ymax=max(pnt(:,2));ymin=min(pnt(:,2));
P=size(pnt,1); % number of points
xp=pnt(P,1);yp=pnt(P,2);
delta_x(1:P-1,1)=pnt(2:P,1)-pnt(1:P-1,1);
delta_y(1:P-1,1)=pnt(2:P,2)-pnt(1:P-1,2);
delta_t(1:P-1,1)=pnt(2:P,3)-pnt(1:P-1,3);
for i=2:P-1   % compute theta
    theta(i,1)=atan((delta_x(i)*delta_y(i-1)-delta_x(i-1)*delta_y(i))/...
        (delta_x(i)*delta_x(i-1)+delta_y(i-1)*delta_y(i)));
end 
tp=pnt(P,3);t1=pnt(1,3); % time parameter


% 13 features caculation:
% cosine of initial angle
f1=(x3-x1)/sqrt((x3-x1)^2+(y3-y1)^2);
% sine of initial angle
f2=(y3-y1)/sqrt((x3-x1)^2+(y3-y1)^2);
% length of bounding box diagonal
f3=sqrt((xmax-xmin)^2+(ymax-ymin)^2);
% angle of bounding box diagonal(by rad)
f4=atan((ymax-ymin)/(xmax-xmin));
% distance between first and last point
f5=sqrt((xp-x1)^2+(yp-y1)^2);
% cosine of the angle between first and last point
f6=(xp-x1)/f5;
% sine of the angle between first and last point
f7=(yp-y1)/f5;
% total gesture length
f8=sum(sqrt(delta_x(1:P-1).^2+delta_y(1:P-1).^2));
% total angle 
f9=sum(theta(2:P-1));
% total absolute angle
f10=sum(abs(theta(2:P-1)));
% sum of the squared value of angle
f11=sum(theta(2:P-1).^2);
% maximum speed of the gesture
for i=1:P-1
    v(i,1)=(delta_x(i).^2+delta_y(i).^2)/delta_t(i).^2;
f12=max(v(:,1));
end
% duration of the gesture
f13=tp-t1;

% output of feature F:
F=[f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13];

