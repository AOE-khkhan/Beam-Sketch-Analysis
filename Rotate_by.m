function Pr = Rotate_by(P,th)
% input:
% P = points to be rotated
% th = angle to be rotated
% output:
% Pr = points after CCW rotation of th

c=ModifiedCenter(P);

n=size(P,1);
for i=1:n
    Pr(i,1)=(P(i,1)-c(1,1)).*cos(th)-(P(i,2)-c(1,2)).*sin(th)+c(1,1);
    Pr(i,2)=(P(i,1)-c(1,1)).*sin(th)+(P(i,2)-c(1,2)).*cos(th)+c(1,2);
end
