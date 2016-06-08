function h = Redraw(index,pnt,BP)
% input 
% index = symbol recognition number
% pnt = data points
% BP = beam control points after redraw


if index == 1   % Wall_left re-draw    
    h=WallLeftRedraw(pnt,BP);
end

if index == 2   % Wall_right re-draw
    h=WallRightRedraw(pnt,BP);
end

if index == 3   % pivot_1 re-draw    
    h=Pivot1Redraw(pnt,BP);
end

if index == 4   % pivot_2 re-draw  
    h=Pivot2Redraw(pnt,BP);
end

if index == 5   % force re-draw    
    h=ForceRedraw(pnt,BP);
end

if index == 6   % torque re-draw    
    h=TorqueRedraw(pnt,BP);
end

if index == 7
    h=UniforceRedraw(pnt,BP);
end

if index == 8
    h=SlopeforceRedraw(pnt,BP);
end
if index==9
    h(1,1)= mean(pnt(:,1));
    h(1,2)= mean(pnt(:,2));
end    
