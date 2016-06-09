function y=generatetable2(id,P,L,a)
x=0:0.001:L;

E=200e09;I=400e-8;

switch id
    case 1
        b=L-a;
        for i=1:length(x)
            if x(i)<= a
             y(i)= P*b*x(i)*(L^2 - x(i)^2 -b^2)./(6*L*E*I);
            else 
             y(i)= P*b*((L*(x(i)-a)^3)/b + (L^2 -b^2)*x(i) -x(i)^3)./(6*L*E*I);
            end
        end       
    case 2
        b=L-a;
        for i=1:length(x)
            if x(i)<= a
             y(i)= P*b*x(i)*(L^2 - x(i)^2 -b^2)./(6*L*E*I);
            else 
             y(i)= P*b*((L*(x(i)-a)^3)/b + (L^2 -b^2)*x(i) -x(i)^3)./(6*L*E*I);
            end
        end      
    case 3
        W=P;
        for i=1:length(x)
            y(i)=W*x(i).*(L^3 - 2*L*x(i)^2+5*L*x(i).^2 + x(i)^3)/(24*E*I);
        end   
    case 4
        M=P;
        for i=1:length(x)
            y(i)=M*L*x(i)*(1-x(i).^2/(L^2))/(6*E*I);
        end       
    case 5
        Wo=P;
        for i=1:length(x)
            y(i)=Wo*x(i).*(7*L^4- 10*L^2*x(i)^2 + 3*x(i).^4)/(360*L*E*I);
        end          
end        