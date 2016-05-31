function Nab = OverlappingBlack(A,B)
% input:
% A = candidate points set
% B = templete points set
% output:
% Nab = # of overlapping black pixels

A=unique(A,'rows');
B=unique(B,'rows');
 Na=size(A,1);
 Nb=size(B,1);
 Nab=0;
 threshold=4.5;
 if Na<=Nb
     Smaller=A;Larger=B;
 else
     Smaller=B;Larger=A;
 end    
   D1=pdist2(Smaller,Larger);
 for j=1:size(D1,1)
    if min(D1(j,:))<threshold
        Nab=Nab+1;
    end    
 end   


        
              
              
              
              
              