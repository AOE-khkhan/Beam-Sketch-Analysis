function P = HermitInterpolation(P,Pt)

% Four Point Interpolation
% P is a 2x2 matrix. Point 1 and 2. Each point is in a seprate row
% Pt is a 2x2 matrix. Tangent at Point 1 and 2. 

t = 0:0.01:1;   t = t';
T = [t.^3 , t.^2 , t, 0*t+1];
M = [2 -2 1  1; 
    -3 3 -2 -1; 
     0 0  1  0; 
     1 0  0  0];

G = [P; Pt];
P = T*M*G;

