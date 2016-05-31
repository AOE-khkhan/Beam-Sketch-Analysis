function h=ForceRedraw(pnt)
% input:
% pnt = stroke data

    Pforce = pnt;
    xmin=min(Pforce(:,1)); xmax=max(Pforce(:,1));
    ymin=min(Pforce(:,2)); ymax=max(Pforce(:,2));

    A=[Pforce(min(find(Pforce(:,2)==ymin)),1),ymin];
    B=[Pforce(min(find(Pforce(:,2)==ymin)),1),ymax];
    C=[xmin,Pforce(min(find(Pforce(:,1)==xmin)),2)];
    D=[xmin+2*(Pforce(min(find(Pforce(:,2)==ymin)),1)-xmin),Pforce(min(find(Pforce(:,1)==xmin)),2)];

    h(1)=plot([A(1),B(1)],[A(2),B(2)],'g','linewidth',3);
    hold on
    h(2)=plot([A(1),C(1)],[A(2),C(2)],'g','linewidth',3);
    h(3)=plot([A(1),D(1)],[A(2),D(2)],'g','linewidth',3);
