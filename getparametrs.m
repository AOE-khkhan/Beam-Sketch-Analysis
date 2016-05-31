function [load,len]=getparametrs(beam,force)


F=cell2mat(force.pnts);
lengthofarrow=abs(F(1,3)-F(1,4));
load=100*lengthofarrow;
len=max(beam.pnts(:,1))-min(beam.pnts(:,1));