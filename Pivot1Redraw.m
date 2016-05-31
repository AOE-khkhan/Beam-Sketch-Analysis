function h=Pivot1Redraw(pnt)
% input:
% pnt = stroke data

Ppivot1 = pnt;

xmin=min(Ppivot1(:,1)); xmax=max(Ppivot1(:,1));
ymin=min(Ppivot1(:,2)); ymax=max(Ppivot1(:,2));

A=[xmin,Ppivot1(min(find(Ppivot1(:,1)==xmin)),2)];
B=[xmax,Ppivot1(min(find(Ppivot1(:,1)==xmin)),2)];
C=[Ppivot1(min(find(Ppivot1(:,2)==ymax)),1),ymax];
D=[xmin+(xmax-xmin)/4,Ppivot1(min(find(Ppivot1(:,1)==xmin)),2)];
E=[xmin+2*(xmax-xmin)/4,Ppivot1(min(find(Ppivot1(:,1)==xmin)),2)];
F=[xmin+3*(xmax-xmin)/4,Ppivot1(min(find(Ppivot1(:,1)==xmin)),2)];
DD=[xmin+(xmax-xmin)/8,ymin];
EE=[xmin+3*(xmax-xmin)/8,ymin];
FF=[xmin+5*(xmax-xmin)/8,ymin];
h(1)=plot([A(1),B(1),C(1),A(1)],[A(2),B(2),C(2),A(2)],'r','linewidth',3);
hold on
h(2)=plot([D(1),DD(1)],[D(2),DD(2)],'r','linewidth',3);
h(3)=plot([E(1),EE(1)],[E(2),EE(2)],'r','linewidth',3);
h(4)=plot([F(1),FF(1)],[F(2),FF(2)],'r','linewidth',3);