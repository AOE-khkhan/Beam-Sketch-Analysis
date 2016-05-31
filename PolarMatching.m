function th = PolarMatching(A,B)
% input:
% A = candidate points set in original coordinate system
% B = templete points set in original coordinate system
% output:
% th = the angel that A should be rotated to best fit B

RA = PolarTransfer(A);
RB = PolarTransfer(B);
still=RA;
j=1;
dw=zeros(1,40);
for i=0:0.05*pi:1.95*pi
    RA(:,1)=RA(:,1)+i;
    RA(RA(:,1)>pi)=RA(RA(:,1)>pi)-2*pi;
    WMAB = Weighted_MHD(RA,RB);
    WMBA = Weighted_MHD(RB,RA);
    dw(j)=max(WMAB,WMBA);
    j=j+1;
    RA=still;
end

m = find(dw==min(dw),1);  % index of moving times along angle
th=(m-1)*0.05*pi;



    