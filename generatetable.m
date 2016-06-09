function y=generatetable(id,P,L,a)
x=0:0.001:L;

E=200e09;I=400e-8;

switch id
    case 1
        for i=1:length(x)
            if x(i)<= a
             y(i)= P*x(i).^2*(3*a-x(i))./(6*E*I);
            else 
             y(i)= P*a.^2*(3*x(i)-a)./(6*E*I);
            end
        end    
    case 2
        W=P;
        for i=1:length(x)
            y(i)=W*x(i).^2.*(x(i)^2+6*L-4*L*x(i))/(24*E*I);
        end    
    case 3
        Wo=P;
        for i=1:length(x)
            y(i)=Wo*x(i).^2.*(10*L^3-10*L^2*x(i)+5*L*x(i).^2-x(i)^3)/(120*L*E*I);
        end   
    case 4
        M=P;
        for i=1:length(x)
            y(i)=M*x(i)^2/(2*E*I);
        end       
end        