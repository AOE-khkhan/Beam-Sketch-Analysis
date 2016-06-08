function [index,shape,centr] = ImageClassifier(C,BP)
% input:
% C = candidate pnt
% BP = Beam points after redraw
% output:
% index = sample classification number
 
% load 'Templete.mat';
load 'TP.mat';
%% image based classifier
for i=1:9   
    CRP=Imagetransfer(C);
    dh(i) = Hausdorff_distance(CRP,TP{i,1},2);
    dm(i) = MHD(CRP,TP{i,1});
    Tsc(i) = Tanimoto(CRP,TP{i,1});
    Y(i) = Yule(CRP,TP{i,1});
end
dh=dh/max(dh);
dm=dm/max(dm);
ds=dh+dm+Tsc+Y;
index=find(ds==min(ds));

%% differentiate force with wall
BMy=BP(1,2)+(BP(3,2)-BP(1,2))/2; % midpoint of Beam y coordinate
BMx=BP(1,1)+(BP(2,1)-BP(1,1))/2; % midpoint of Beam x coordinate
PMx=min(C(:,1))+(max(C(:,1))-min(C(:,1)))/2; % Candidate mid-point x coordinate
PMy=min(C(:,2))+(max(C(:,2))-min(C(:,2)))/2; % Candidate mid-point y coordinate
dx=PMx-BMx;
dy=PMy-BMy;
centr=[PMx,PMy];
if index==1 || index==2
    if dy>=0.07
        index=5;
    end
end
if index==5
    if dy<0.07 && dy>-0.07 && dx>0
        index=2;
    end
    if dy<0.07 && dy>-0.07 && dx<0
        index=1;
    end
end

%% shape name
switch index
    case 1
        shape='Wall_Left';
    case 2
        shape='Wall_Right';
    case 3
        shape='Pivot_1';
    case 4
        shape='Pivot_2';
    case 5
        shape='Force';
    case 6
        shape='Torque';
    case 7
        shape='Uniforce';
    case 8
        shape='Slopeforce';
    case 9
        shape='Delete';
end
