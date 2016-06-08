function h=TorqueRedraw(pnt,BP)
% input:
% pnt = stroke data
% BP = beam points after redraw

Ptorque = pnt;
xmin=min(Ptorque(:,1)); xmax=max(Ptorque(:,1));
ymin=min(Ptorque(:,2)); ymax=max(Ptorque(:,2));
BMy=BP(1,2)+(BP(3,2)-BP(1,2))/2; % midpoint of Beam y coordinate

R=(ymax-ymin)/2;
x0=xmin;
y0=ymin+R;
dy=y0-BMy;
y0=y0-dy;
alpha=-pi/2:0.01:pi/2;
x=R.*cos(alpha)+x0;
y=R.*sin(alpha)+y0;

h(1)=plot(x,y,'g','linewidth',3);
hold on;
A=[xmin,ymin-dy];
B=[A(1)+0.02,A(2)+0.02];
C=[A(1)+0.02,A(2)-0.02];
h(2)=plot([A(1),B(1)],[A(2),B(2)],'g','linewidth',3);
h(3)=plot([A(1),C(1)],[A(2),C(2)],'g','linewidth',3);

