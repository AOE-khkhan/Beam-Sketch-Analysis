function h=WallRightRedraw(pnt)

PRwall = pnt;
xmin=min(PRwall(:,1)); xmax=max(PRwall(:,1));
ymin=min(PRwall(:,2)); ymax=max(PRwall(:,2));

A=[xmin,ymax];
B=[xmin,ymin];
C=[xmin,ymax-(ymax-ymin)/4];
D=[xmin,ymax-2*(ymax-ymin)/4];
E=[xmin,ymax-3*(ymax-ymin)/4];
CC=[xmax,ymax-3*(ymax-ymin)/8];
DD=[xmax,ymax-5*(ymax-ymin)/8];
EE=[xmax,ymax-7*(ymax-ymin)/8];
h(1)=plot([A(1),B(1)],[A(2),B(2)],'k','linewidth',3);
hold on
h(2)=plot([C(1),CC(1)],[C(2),CC(2)],'k','linewidth',3);
h(3)=plot([D(1),DD(1)],[D(2),DD(2)],'k','linewidth',3);
h(4)=plot([E(1),EE(1)],[E(2),EE(2)],'k','linewidth',3);