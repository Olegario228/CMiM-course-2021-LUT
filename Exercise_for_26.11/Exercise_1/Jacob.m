syms x1 x4 phi4 phi1 y1 y4 ...
    dx1 dx4 dphi4 dphi1 dy1 dy4 ...
    ddx1 ddx4 ddphi4 ddphi1 ddy1 ddy4
    
F1 = x4 + 1.6*cos(phi4) - 0.3*sin(phi4) - x1 + 0.75*sin(phi1);
F2 = y4 + 1.6*sin(phi4) + 0.3*cos(phi4) - y1 - 0.75*cos(phi1);
J = jacobian([F1, F2], [x1,y1,phi1,x4,y4,phi4]);
J1 = [-1,  0, (3*cos(phi1))/4, 1, 0, - (3*cos(phi4))/10 - (8*sin(phi4))/5];
J2 = [ 0, -1, (3*sin(phi1))/4, 0, 1,   (8*cos(phi4))/5 - (3*sin(phi4))/10];
dF = J * [dx1; dy1; dphi1; dx4; dy4; dphi4]; % F_dot = J*q_dot
ddF = J * [ddx1; ddy1; ddphi1; ddx4; ddy4; ddphi4] ... 
 + jacobian([J1, J2], [x1,y1,phi1,x4,y4,phi4]) * [dx1; dy1; dphi1; dx4; dy4; dphi4]; % F_2dot = J_dot*q_dot + J*q_2dot