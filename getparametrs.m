function [load,len,a]=getparametrs(beam,force,TR,Uniforce,Slopeforce)
a=0;
if ~isempty(force)
    F=cell2mat(force.pnts);
    lengthofarrow=abs(F(1,3)-F(1,4));
    a=F(1,1)-beam.pnts(1,1);
    load=100*lengthofarrow;
elseif ~isempty(Uniforce)
    F=cell2mat(Uniforce.pnts);
    lengthofarrow=abs(F(2,3)-F(2,4));
    load=100*lengthofarrow;
elseif ~isempty(Slopeforce)
    F=cell2mat(Slopeforce.pnts);
    lengthofarrow=abs(F(1,3)-F(1,4));
    load=100*lengthofarrow;
elseif ~isempty(TR)
    lengthofarrow=max(TR.pnts{1,2})-min(TR.pnts{1,2});
    load=100*lengthofarrow;
end
len=max(beam.pnts(:,1))-min(beam.pnts(:,1));