function dh = Hausdorff_distance(A,B,k)
% input:
% A,B = points dataset
% k = rank of distance to be selected
% output:
% d = max distance between two points set A and B

d1 = Partial_HD(A,B,k);
d2 = Partial_HD(B,A,k);
dh = max(d1,d2);



