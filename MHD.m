function dm = MHD(A,B)
% input:
% A,B = points dataset A and B
% output:
% dm = modified Hausdorff distance of A and B

d1 = Modified_HD(A,B);
d2 = Modified_HD(B,A);

dm = max(d1,d2);


