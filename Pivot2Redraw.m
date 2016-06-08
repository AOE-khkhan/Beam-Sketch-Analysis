function h=Pivot2Redraw(pnt,BP)
% input:
% pnt = stroke data
% BP = beam points after redraw

Ppivot2 = pnt;
xmin=min(Ppivot2(:,1)); xmax=max(Ppivot2(:,1));
ymin=min(Ppivot2(:,2)); ymax=max(Ppivot2(:,2));
BBy=BP(1,2); % y coordinate of beam bottom
dy=BBy-ymax; % distance between beam bottom and Pivot top


A=[xmin,Ppivot2(min(find(Ppivot2(:,1)==xmin)),2)+dy];
B=[xmax,Ppivot2(min(find(Ppivot2(:,1)==xmin)),2)+dy];
C=[Ppivot2(min(find(Ppivot2(:,2)==ymax)),1),ymax+dy];

R=(xmax-xmin)/8;
alpha=0:0.01:2*pi;
x1=xmin+2*R; y1=Ppivot2(min(find(Ppivot2(:,1)==xmin)),2)-R+dy;
x2=xmin+6*R; y2=Ppivot2(min(find(Ppivot2(:,1)==xmin)),2)-R+dy;
x=R.*cos(alpha)+x1;
y=R.*sin(alpha)+y1;
xx=R.*cos(alpha)+x2;
yy=R.*sin(alpha)+y2;

h(1)=plot([A(1),B(1),C(1),A(1)],[A(2),B(2),C(2),A(2)],'r','linewidth',3);
hold on
h(2)=plot(x,y,'r','linewidth',3);
h(3)=plot(xx,yy,'r','linewidth',3);