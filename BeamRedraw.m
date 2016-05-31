function h=BeamRedraw(pnt)
% input:
% pnt = stroke point
Pbeam = pnt;
A=[min(Pbeam(:,1)),min(Pbeam(:,2))];
B=[max(Pbeam(:,1)),min(Pbeam(:,2))];
C=[max(Pbeam(:,1)),max(Pbeam(:,2))];
D=[min(Pbeam(:,1)),max(Pbeam(:,2))];
h=plot([A(1),B(1),C(1),D(1),A(1)],[A(2),B(2),C(2),D(2),A(2)],'b','linewidth',3);
