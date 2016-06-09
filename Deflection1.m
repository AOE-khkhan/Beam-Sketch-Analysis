function h=Deflection1(beam,Ypos,defl)
% input:
% CP = control points of beam
% output:
% curve drawing operation

N=length(defl);
L=beam(1,2)-beam(1,1);
X=beam(1,1):L/(N-1):beam(1,2);
Y=Ypos-defl;
%

    
    h=plot(X,Y,'r--','linewidth',2);
    hold on; 

   
    