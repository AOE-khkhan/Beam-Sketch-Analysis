function h=TorqueRedraw(pnt)
% input:
% pnt = stroke data

Ptorque = pnt;
xmin=min(Ptorque(:,1)); xmax=max(Ptorque(:,1));
ymin=min(Ptorque(:,2)); ymax=max(Ptorque(:,2));

R=(ymax-ymin)/2;
x0=xmin;
y0=ymin+R;
alpha=-pi/2:0.01:pi/2;
x=R.*cos(alpha)+x0;
y=R.*sin(alpha)+y0;
h(1)=plot(x,y,'g','linewidth',3);
hold on;

A=[xmin,ymin];
B=[xmin+R/3,ymin+R/2];
C=[xmin+R/3,ymin-R/2];
h(2)=plot([A(1),B(1)],[A(2),B(2)],'g','linewidth',3);
h(3)=plot([A(1),C(1)],[A(2),C(2)],'g','linewidth',3);

