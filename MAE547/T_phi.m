function T = T_phi(phi)
T = [0 -sin(phi(1)) cos(phi(1))*sin(phi(2)); 
     0 cos(phi(1)) sin(phi(1))*sin(phi(2));
     1 0 cos(phi(2))];