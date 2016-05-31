function Noo = OverlappingWhite(A,B)
% input:
% A = candidate points set of black pixels
% B = templete points set of black pixels
% output:
% Noo = # of matching white pixels


E=zeros(48*48,2); % generate whole 48x48 pixels matrix
k=1;
for i=1:48
    for j=1:48
        E(k,:)=[i-1,j-1];
        k=k+1;
    end
end


WA=setxor(E,A,'rows');

WB = setxor(E,B,'rows');

mm=size(WA,1);
nn=size(WB,1);
threshold=4.5;


N00=0;


if mm<=nn
    Smaller2=WA;Larger2=WB;
else
    Smaller2=WB;Larger2=WA;
end
%% problematic section
D2=pdist2(Smaller2,Larger2);
for j=1:size(D2,1)
    if min(D2(j,:))<threshold
        N00=N00+1;
    end
end


Noo=N00;


