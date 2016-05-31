function subparts=segmentndraw(pnt,Npnt)

seg=0;
startpos=1;
for i=1:Npnt-1
       if (pnt(i+1,3)- pnt(i,3))>0.4 && i~=Npnt-1
        seg=seg+1;
        endpos=i;
        subparts(seg).pnts=pnt(1:(endpos-startpos),1:2);
        startpos=i+1;
       end
end
subparts(seg+1).pnts=pnt(endpos:end,1:2);
if seg==0
    subparts=pnt;
end    