function A = fwd_kin(q)
d = [0.340, 0, 0.4 , 0, 0.4, 0, 0.126];
a = zeros(7,1);
alpha = [-pi/2, pi/2, pi/2, -pi/2, -pi/2, pi/2, 0];

for i = 1:7
 T{i} = [cos(q(i)) -sin(q(i))*cos(alpha(i)) sin(q(i))*sin(alpha(i)) a(i)*cos(q(i));
 sin(q(i)) cos(q(i))*cos(alpha(i)) -cos(q(i))*sin(alpha(i)) a(i)*sin(q(i));
 0 sin(alpha(i)) cos(alpha(i)) d(i);
 0 0 0 1];

end

A = T;