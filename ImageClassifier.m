function [index,shape] = ImageClassifier(C)
% input:
% C = candidate pnt
% output:
% index = sample classification number

load 'Templete.mat';
load 'TP.mat';

for i=1:7   
    th = PolarMatching(C,Templete{i,1});
    CR=Rotate_by(C,th);
    CRP=Imagetransfer(CR);
    dh(i) = Hausdorff_distance(CRP,TP{i,1},2);
    dm(i) = MHD(CRP,TP{i,1});
    Tsc(i) = Tanimoto(CRP,TP{i,1});
    Y(i) = Yule(CRP,TP{i,1});
end
dh=dh/max(dh);
dm=dm/max(dm);
ds=dh+dm+Tsc+Y;

index=find(ds==min(ds));
switch index
    case 1
        shape='Beam';
    case 2
        shape='Wall_Left';
    case 3
        shape='Wall_Right';
    case 4
        shape='Pivot_1';
    case 5
        shape='Pivot_2';
    case 6
        shape='Force';
    case 7
        shape='Torque';
end
