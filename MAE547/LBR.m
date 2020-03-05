clf
alpha = [-pi/2, pi/2, pi/2, -pi/2, -pi/2, pi/2, 0];
a = zeros(1,7);
d = [0.340, 0, 0.4 , 0, 0.4, 0, 0.126];
theta = [zeros(1,7)];
dh = [theta' d' a' alpha'];

for i = 1:7
 L2{i} = Link('d', dh(i,2), 'a', dh(i,3), 'alpha', dh(i,4));
end
R2 = SerialLink([L2{1} L2{2} L2{3} L2{4} L2{5} L2{6} L2{7}]);



R = [0 0 1 ; 1 0 0 ; 0 1 0];
Ri = inv(R);
pa = [0.58412 -0.48572 -0.23206]';
pa1 = Ri*pa;

a = Ri*[0.55, -0.1, -0.1]';
b = Ri*[0.60, 0, -0.1]';
c = Ri*[0.55, 0.1, -0.1]';
d = Ri*[0.50, 0, -0.1]';
e = Ri*[0.55, -0.1, -1.5]';
f = Ri*[0.60, 0, -1.5]';
g = Ri*[0.55, 0.1, -1.5]';
for i = 1:10:3450
    plot(R2, trajectory(i,:));
    hold on;
    plot3(pa1(1),pa1(2),pa1(3),'ko');
    plot3(a(1),a(2),a(3),'ro');
    plot3(b(1),b(2),b(3),'ro');
    plot3(c(1),c(2),c(3),'ro');
    plot3(d(1),d(2),d(3),'ro');
    plot3(e(1),e(2),e(3),'ro');
    plot3(f(1),f(2),f(3),'ro');
    plot3(g(1),g(2),g(3),'ro');
    plot3(path(1,:),path(2,:),path(3,:),'b');
    pause(0.1);
end
% plot3([a(1) b(1)], [a(2) b(2)], [a(3) b(3)], 'b');
% plot3([a(1) c(1)], [a(2) c(2)], [a(3) c(3)], 'b');
% plot3([a(1) e(1)], [a(2) e(2)], [a(3) e(3)], 'b');
% plot3([f(1) b(1)], [f(2) b(2)], [f(3) b(3)], 'b');