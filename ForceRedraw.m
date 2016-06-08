function h=ForceRedraw(pnt,BP)
% input:
% pnt = stroke data
% BP = beam points after redraw

Pforce = pnt;
xmin=min(Pforce(:,1)); xmax=max(Pforce(:,1));
ymin=min(Pforce(:,2)); ymax=max(Pforce(:,2));
BTy=BP(3,2); % y coordinate of beam top
dy=ymin-BTy; % distance between beam top and force point


A=[Pforce(min(find(Pforce(:,2)==ymin)),1),ymin-dy+0.01];
B=[Pforce(min(find(Pforce(:,2)==ymin)),1),ymax-dy+0.01];
C=[A(1)-0.02,A(2)+0.02];
D=[A(1)+0.02,A(2)+0.02];

h(1)=plot([A(1),B(1)],[A(2),B(2)],'g','linewidth',3);
hold on
h(2)=plot([A(1),C(1)],[A(2),C(2)],'g','linewidth',3);
h(3)=plot([A(1),D(1)],[A(2),D(2)],'g','linewidth',3);
