function qan = inv_kine(qini, pd)
q(:,1) = qini;
phid = [pi/2 pi/2 pi]'; 
K = eye(6)/100;
t = 5000000;
LIMt = deg2rad([140 120 170 120 170 90 175]);
LIM = 2*LIMt;
safelimM = LIMt - 0.2*LIM;
safelimm = -LIMt + 0.3*LIM;
K0 = 5*[4 1 1 1 1 2 1];
a = [ 0, -0.1, 0.55]';

K1 = 10;
    for i = 1:t
        T = fwd_kin(q(:,i));
        A = T{1}*T{2}*T{3}*T{4}*T{5}*T{6}*T{7};
        Tel = T{1}*T{2}*T{3};
        Pel = Tel(1:3,4);
        obst = [Pel-a]';
        
        Phi = euler_angles(A);
        B = T_phi(Phi);
        Ta(1:3,1:3) = eye(3);
        Ta(4:6,4:6) = B;
        Ja = an_jac(T,Ta);
        xe = [A(1:3,4);Phi];
        er(:,i) = [pd;phid] -xe;
        pJa = pinv(Ja);
        J = Ta*Ja;
        In = eye(7);
        for j = 1:7
            qknot(j) = -1*K0(j)*q(j,i)/(LIM(j)*LIM(j));
%             if q(j,i) > safelimM(j)
%                 K0 = 30;
%             elseif q(j,i) < safelimm(j)
%                 K0 = 30;
%             end
            
        end
        
        qobst = [0.41*sin(q(1,i))*cos(q(2,i))+0.1; 0.16*sin(q(2,i))*cos(q(2,i))-0.12*sin(q(1,i))*cos(q(2,i))+0.084*sin(q(1,i))+0.1;0;0;0;0;0];
%         Jd0 = n0*J;
        qdot =pJa*K*er(:,i) + (In - pJa*Ja)*(qknot' +K1*qobst);
        q(:,i+1) = q(:,i) + qdot;
        
        if (max(abs(er(:,i)))<0.001) 
            break;
        end
    end
    
qan = q(1:7,i);