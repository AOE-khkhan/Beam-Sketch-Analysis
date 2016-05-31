function dw = Weighted_MHD(RA,RB)
% input:
% RA,RB = r coordinates matrix of A and B correspondingly
% output:
% dw = modified Hausdorff distance of A and B

% initialization


m=size(RA,1);

% Hausdorff distance from A to B
dd=zeros(m,1);  
for i=1:m
    ra=RA(i,2);
    dd(i)=(ra^0.1)*min(sqrt((RA(i,1)-RB(:,1)).^2+(RA(i,2)-RB(:,2)).^2));
end
dw=sum(dd)/m;




