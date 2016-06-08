function state=checkstate(C,beam,force)
flag=0;
if (isempty(beam)) || (isempty(force)) 
    state='Initial';
else
    flag=1;

end   

if flag==1
F=cell2mat(force.pnts);
    Cf=[(F(1,1)+F(1,2))/2,(F(1,3)+F(1,4))/2];
   if abs(C(1,1)-Cf(1,1))<0.05 && abs(C(1,2)-Cf(1,2))<0.05
       state='Modification-force';
   else
       state='Initial';
   end    
end    