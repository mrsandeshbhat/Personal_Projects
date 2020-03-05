function phi = euler_angles(A)
p(1) = atan2(A(2,3),A(1,3));
a = A(3,3);
b = sqrt(A(1,3)*A(1,3)+A(2,3)*A(2,3));
p(2) = atan2(b,a);
p(3) = atan2(A(3,2),-A(3,1));
phi = p';