function h=Deflection1(CP)
% input:
% CP = control points of beam
% output:
% curve drawing operation


% cubic spline
Pdi = [0 0];    i=1;
Pdj = [0 0];    j=3;

n = length(CP);
M = eye(n-2); O = zeros(n-2,1);
A = [M O O] + [O 4*M O] + [O O M];
B = 3*CP(3:end,:) - 3*CP(1:end-2,:);

B = B - A(:,i)*Pdi;
B = B - A(:,j)*Pdj;

A(:,[i j]) = [];

X = inv(A)*B;
id = 1:n;   id([i j]) = [];
 
Pd = zeros(n,2);  % Tangent Vector
Pd(id,:) = X;
Pd(i,:) = Pdi;
Pd(j,:) = Pdj;

for i=1:n-1
    P(:,2*i-1:2*i) = HermitInterpolation(CP(i:i+1,:),Pd(i:i+1,:));
    h(i)=plot(P(:,2*i-1),P(:,2*i),'b','linewidth',2);
    hold on; 
end

   
    