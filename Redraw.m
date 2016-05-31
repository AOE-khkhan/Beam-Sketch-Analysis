function h= Redraw(index,pnt)

if index == 1   % beam re-draw
    
  h=  BeamRedraw(pnt);
end

if index == 2   % Wall_left re-draw
    
   h= WallLeftRedraw(pnt);
end

if index == 3   % Wall_right re-draw
    
  h =  WallRightRedraw(pnt);
end

if index == 4   % pivot_1 re-draw
  
  h=  Pivot1Redraw(pnt);
end

if index == 5   % pivot_2 re-draw
    
    
 h=   Pivot2Redraw(pnt);
end

if index == 6   % force re-draw
    
  h=  ForceRedraw(pnt);
end

if index == 7   % torque re-draw
    
 h=   TorqueRedraw(pnt);
end