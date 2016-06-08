function h=WallLeftRedraw(pnt,BP)
% BP = beam points after redraw

PLwall = pnt;
xmin=min(PLwall(:,1)); xmax=max(PLwall(:,1));
ymin=min(PLwall(:,2)); ymax=max(PLwall(:,2));
BLx=BP(1,1); % x coordinate of Beam left point
dx=BLx-xmax; % distance between WL and BeamLeft
xmax=xmax+dx;
xmin=xmin+dx;

A=[xmax,ymax];
B=[xmax,ymin];
C=[xmax,ymax-(ymax-ymin)/4];
D=[xmax,ymax-2*(ymax-ymin)/4];
E=[xmax,ymax-3*(ymax-ymin)/4];
CC=[xmin,ymax-3*(ymax-ymin)/8];
DD=[xmin,ymax-5*(ymax-ymin)/8];
EE=[xmin,ymax-7*(ymax-ymin)/8];
h(1)=plot([A(1),B(1)],[A(2),B(2)],'k','linewidth',3);
hold on
h(2)=plot([C(1),CC(1)],[C(2),CC(2)],'k','linewidth',3);
h(3)=plot([D(1),DD(1)],[D(2),DD(2)],'k','linewidth',3);
h(4)=plot([E(1),EE(1)],[E(2),EE(2)],'k','linewidth',3);