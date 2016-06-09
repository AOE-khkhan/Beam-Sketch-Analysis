function [maxdef,y]=lookuptable(Configid,cantiliverflag,P,L,a)
E=200e09;I=400e-8;
if cantiliverflag==1
switch Configid
    
    case 1
        maxdef=(P*a^2)*(3*L-a)./(6*E*I);
        y=generatetable(1,P,L,a);
    case 2
        W=P;
        maxdef=W*L^4./(8*E*I);
        y=generatetable(2,P,L,a);
    case 3
        Wo=P;
        maxdef=Wo*L^4./(30*E*I);  
        y=generatetable(3,P,L,a);
    case 4
        M=P;
        maxdef=(M*L^2)./(2*E*I);
        y=generatetable(4,P,L,a);
      
end 

else
    switch Configid
    
    case 1
        maxdef=(P*L^3)./(48*E*I);
        y=generatetable2(1,P,L,a);
    case 2
        b=L-a;
        maxdef=P*b*(L^2-b^2)^1.5./(9*sqrt(3)*L*E*I);
        y=generatetable2(2,P,L,a);
    case 3
        W=P;
        maxdef=5*W*L^4./(384*E*I);  
        y=generatetable2(3,P,L,a);
    case 4
        M=P;
        maxdef=(M*L^2)./(9*sqrt(3)*E*I);
        y=generatetable2(4,P,L,a);
    case 5
        Wo=P;
        maxdef=(Wo*L^4)./(E*I);
        y=generatetable2(5,P,L,a);  
   end 
    
end