function PO = PolarTransfer(P)
% input:
% P = original points set in [0,1] coordinate system
% output:
% PO = points set in polar system which refers to (r & theta)


% Initialization
C = ModifiedCenter(P);
x0=C(1);
y0=C(2);
x=P(:,1);
y=P(:,2);

% Transfer
r=sqrt((x-x0).^2+(y-y0).^2);
L=InkLength(P);
r=r./L; % Normalization
th=atan2(y-y0,x-x0);

PO = [th,r];
