q0 = [-1.8881 1.4197 1.1274 1.2697 0.0046 -1.5217 1.1038];
qdot0 = zeros(1,7);
qdot9 = [1.2835 1.2835 1.5453 1.1090 2.0689 2.1562 2.1562];
a = (qdot9 + q0)/18;
t = 0:0.25:9;

for i = 1:37
    hold on
    Q = a*t(i)*t(i) + qdot0*t(i) + q0;
    plot(R2, Q);
    plot3(pa1(1),pa1(2),pa1(3),'ko');
    plot3(a(1),a(2),a(3),'ro');
    plot3(b(1),b(2),b(3),'ro');
    plot3(c(1),c(2),c(3),'ro');
    plot3(d(1),d(2),d(3),'ro');
    plot3(e(1),e(2),e(3),'ro');
    plot3(f(1),f(2),f(3),'ro');
    plot3(g(1),g(2),g(3),'ro');
    clf
end