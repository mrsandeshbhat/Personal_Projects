clc
syms q1 q2 q3 q4 q5 q6  q7;

b = [ 0, -0.1,0.55]';
T = fwd_kin([q1 q2 q3 q4 q5 q6  q7]);
Tel = T{1}*T{2}*T{3}*T{4};
Pel1 = Tel(1:3,4);
Pel1 = simplify(vpa(Pel1));

Pel = (0.4*cos(q1)*sin(q2))^2+(0.4*sin(q1)*sin())
simplify(vpa(Pel))
%     wq = [diff(Pel,q1);diff(Pel,q2);diff(Pel,q3);diff(Pel,q4);diff(Pel,q5);diff(Pel,q6);diff(Pel,q7)];
% simplify(wq)    