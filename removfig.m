function removfig(num,HwallR,HwallL,HPV1,HPV2,Hforce,HTR,Hudl,Huvl)

switch num
    case 1
      delete(HwallR);
    case 2
      delete(HwallL);  
    case 3
      delete(HPV1);
    case 4
      delete(HPV2);
    case 5
      delete(Hforce);
    case 6    
       delete(HTR); 
    case 7
       delete(Hudl); 
    case 8
       delete(Huvl);
end       