tic
clc
clear all
R = [0 0 1 ; 1 0 0 ; 0 1 0];

pa = [0.58412 -0.48572 -0.23206]';
pa1 = R\pa;
pb = [0.55020 0.37742 -0.22219]';
pb1 = R\pb;

a = R\[0.55, -0.1, -0.1]';
b = R\[0.60, 0, -0.1]';
c = R\[0.55, 0.1, -0.1]';
d = R\[0.50, 0, -0.1]';
e = R\[0.55, -0.1, -1.5]';
f = R\[0.60, 0, -1.5]';
g = R\[0.55, 0.1, -1.5]';

ce = [0,-0.23206,0.4]';
radius = norm(ce-pa1);

theta1 = atan2(pa1(3)-ce(3),pa1(1)-ce(1));
theta2 = atan2(pb1(3)-ce(3),pb1(1)-ce(1));
trajectory(1,:) = deg2rad([-109.19 80.81 64.66 70.93 0.25 -88.23 63.10]);

step = 0:0.0004:1;
for i = 1:length(step)    
y(1,i) = -0.23206 - 2.2*step(i)*step(i)+ 2.2*step(i);
end
% for i = 0:99
%     path(:,i+1) = [-0.48572-(radius-0.48572)*i/100,-0.23206,0.58412];
% end
for i = 1:1385
    angle = theta1 - (theta1-theta2)*step(i);
    x = pa1(1)-(pa1(1)-pb1(1))*step(i);
    z = -x*x - 0.1083*x +0.8;
    path(:,i) = [x,y(1,i),z];
end
t = 0:499;
for i = 1:500
    path(:,1385+i) = [-0.0079+0.0079*t(i)/500, 0.3116,0.8008+0.2*t(i)/500];
end
for i = 1:500
    path(:,1885+i) = [0.0079*t(i)/500, 0.3116,0.8008+0.2*t(501-i)/500];
% qdotmax = deg2rad([98 98 100 130 140 180 180]);
end
for i = 1:1072
    x = pa1(1)-(pa1(1)-pb1(1))*step(1429+i);
    z = -x*x - 0.1083*x +0.8;
    path(:,2385+i) = [x,y(1,1429+i),z];
end
% for i = 1:51
%     qddot(:,i) = qdotmax*step(i)*2; 
% end
% 
% for i = 1:50
%     qddot(:,51+i) = qdotmax*(step(51-i)*2); 
% end

for i = 2:3457
    
    trajectory(i,:) =wrapToPi( inv_kine(trajectory(i-1,:), path(:,i)));
    i
end

toc