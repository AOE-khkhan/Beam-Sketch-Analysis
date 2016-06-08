function h=SlopeforceRedraw(pnt,BP)
% input:
% pnt = stroke data
% BP = beam points after redraw

Pslopeforce = pnt;
xmin=min(Pslopeforce(:,1)); xmax=max(Pslopeforce(:,1));
ymin=min(Pslopeforce(:,2)); ymax=max(Pslopeforce(:,2));
BTy=BP(3,2); % y coordinate of beam top
dy=ymin-BTy; % distance between beam top and force point

A=[Pslopeforce(min(find(Pslopeforce(:,2)==ymin)),1),ymin-dy];
B=[Pslopeforce(min(find(Pslopeforce(:,2)==ymin)),1),ymin+(ymax-ymin)/2-dy];
C=[xmin,ymax-dy];
D=[xmin,ymin-dy];
E=[xmin+(Pslopeforce(min(find(Pslopeforce(:,2)==ymin)),1)-xmin)/2,ymin+(ymax-ymin)/4*3-dy];
F=[xmin+(Pslopeforce(min(find(Pslopeforce(:,2)==ymin)),1)-xmin)/2,ymin-dy];

h(1)=plot([C(1),B(1)],[C(2),B(2)],'m','linewidth',2);
hold on
h(2)=plot([C(1),D(1)],[C(2),D(2)],'m','linewidth',2);
h(3)=plot([E(1),F(1)],[E(2),F(2)],'m','linewidth',2);
h(4)=plot([B(1),A(1)],[B(2),A(2)],'m','linewidth',2);
% Arrow
h(5)=plot([D(1),D(1)-0.01],[D(2),D(2)+0.01],'m','linewidth',2);
h(6)=plot([D(1),D(1)+0.01],[D(2),D(2)+0.01],'m','linewidth',2);

h(7)=plot([F(1),F(1)-0.01],[F(2),F(2)+0.01],'m','linewidth',2);
h(8)=plot([F(1),F(1)+0.01],[F(2),F(2)+0.01],'m','linewidth',2);

h(9)=plot([A(1),A(1)-0.01],[A(2),A(2)+0.01],'m','linewidth',2);
h(10)=plot([A(1),A(1)+0.01],[A(2),A(2)+0.01],'m','linewidth',2);






