function image=Imagetransfer(P)
% input: 
% P = stroke points dataset
% output:
% image = binary number matrix represented of pixel

% initialization
X=P(:,1);
Y=P(:,2);
X1=X-min(X);
Y1=Y-min(Y);
H=max(Y1);
L=max(X1);
d=abs(H-L)/2;

% transfer to 48x48 pixel image
if H>L
    X2=(X1+d/2)/(L+d)*47;
    Y2=Y1/max(Y1)*47;
else
    Y2=(Y1+d/2)/(H+d)*47;
    X2=X1/max(X1)*47;
end

X3=round(X2); 
Y3=round(Y2);

image=[X3,Y3];