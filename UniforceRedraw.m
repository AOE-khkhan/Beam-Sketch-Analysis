function h = UniforceRedraw(pnt,BP)
% input:
% pnt = stroke data
% BP = beam points after redraw
Puniforce = pnt;
xmin=min(Puniforce(:,1)); xmax=max(Puniforce(:,1));
ymin=min(Puniforce(:,2)); ymax=max(Puniforce(:,2));
BTy=BP(3,2); % y coordinate of beam top
dy=ymin-BTy; % distance between beam top and force point


A=[Puniforce(min(find(Puniforce(:,2)==ymin)),1),ymin-dy];
B=[Puniforce(min(find(Puniforce(:,2)==ymin)),1),ymax-dy];
C=[xmax,ymax-dy];
D=[xmax,ymin-dy];
E=[xmax-(xmax-Puniforce(min(find(Puniforce(:,2)==ymin)),1))/2,ymax-dy];
F=[xmax-(xmax-Puniforce(min(find(Puniforce(:,2)==ymin)),1))/2,ymin-dy];

h(1)=plot([B(1),C(1)],[B(2),C(2)],'m','linewidth',2);
hold on
h(2)=plot([B(1),A(1)],[B(2),A(2)],'m','linewidth',2);
h(3)=plot([E(1),F(1)],[E(2),F(2)],'m','linewidth',2);
h(4)=plot([C(1),D(1)],[C(2),D(2)],'m','linewidth',2);
% Arrow
h(5)=plot([A(1),A(1)-0.01],[A(2),A(2)+0.01],'m','linewidth',2);
h(6)=plot([A(1),A(1)+0.01],[A(2),A(2)+0.01],'m','linewidth',2);

h(7)=plot([F(1),F(1)-0.01],[F(2),F(2)+0.01],'m','linewidth',2);
h(8)=plot([F(1),F(1)+0.01],[F(2),F(2)+0.01],'m','linewidth',2);

h(9)=plot([D(1),D(1)-0.01],[D(2),D(2)+0.01],'m','linewidth',2);
h(10)=plot([D(1),D(1)+0.01],[D(2),D(2)+0.01],'m','linewidth',2);










