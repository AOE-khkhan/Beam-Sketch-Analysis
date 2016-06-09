function [load,len,a]=getparametrs(beam,force)


F=cell2mat(force.pnts);
lengthofarrow=abs(F(1,3)-F(1,4));
a=F(1,1)-beam.pnts(1,1);
load=100*lengthofarrow;
len=max(beam.pnts(:,1))-min(beam.pnts(:,1));