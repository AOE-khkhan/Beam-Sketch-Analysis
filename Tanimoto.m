function Tsc = Tanimoto(A,B)
% input:
% A = candidate points set
% B = templete points set
% output:
% Tsc = Tanimoto coefficient 

% initialization
Na=size(A,1);
Nb=size(B,1);
Nab=OverlappingBlack(A,B);
Noo=OverlappingWhite(A,B);
N=48*48;
alpha=0.75-0.25*((Na+Nb)/(2*N));

% caculation
T = Nab/(Na+Nb-Nab);
Tc = Noo/(Na+Nb-2*Nab+Noo);

Tsc = alpha*T+(1-alpha)*Tc;

% nomalization to [0,1]
Ttemp=Tsc*(-1);
Tsc=Ttemp+1;

