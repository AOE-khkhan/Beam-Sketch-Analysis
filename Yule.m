function Y = Yule(A,B)
% input:
% A = candidate points set
% B = templete points set
% output:
% Y = Yule coefficient

% initialization
Na=size(A,1);
Nb=size(B,1);
Nab=OverlappingBlack(A,B);
Noo=OverlappingWhite(A,B);

% caculation
Y = (Nab*Noo-(Na-Nab)*(Nb-Nab))/(Nab*Noo+(Na-Nab)*(Nb-Nab));

% normalization to [0,1]
ytemp=(-1)*Y;
Y=(1-0)*(ytemp-(-1))/(1-(-1));
