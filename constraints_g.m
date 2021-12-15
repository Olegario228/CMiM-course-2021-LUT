function g = constraints_g(mbs, q, qd, t)
%CONSTRAINTS Return constraints vector for the system
g = zeros(mbs.nc, 1);
g_idx = 0;

for rj = mbs.joints.revolute
    q1 = q(body_idx(rj.body1));
    q2 = q(body_idx(rj.body2));
    qp1 = qd(body_idx(rj.body1));
    qp2 = qd(body_idx(rj.body2));
    A1 = rot(q1(3));
    A2 = rot(q2(3));
    fi1p = qp1(3);
    fi2p = qp2(3);
    g(g_idx + (1:2)) = A1 * rj.s1 .* fi1p ^ 2 - A2 * rj.s2 .* fi2p ^ 2;
    g_idx = g_idx + 2;
end

% for pj = mbs.joints.prismatic
%     q1 = q(body_idx(pj.body1));
%     q2 = q(body_idx(pj.body2));
%     qd1 = qd(body_idx(pj.body1));
%     qd2 = qd(body_idx(pj.body2));
%     q0_s2 = pj.s2;
%     phi1 = q1(3);
%     A1 = rot(phi1);
%     r1 = q1(1:2);
%     q_s2 = r1 + A1 * q0_s2;
%     
%     g(g_idx + 1) = - 2 * ((q1(1) - q_s2(1)) * (qd1(1) - qd2(1))... 
%                    + (q1(2) - q_s2(2)) * (qd1(2) - qd2(2))) * qd1(3)...
%                    - ((q1(1) - q_s2(1)) * (q1(2) - q2(2))...
%                    - (q1(2) - q_s2(2)) * (q1(1) - q2(1))) * qd2(3) * qd2(3);
%     g(g_idx + 2) = 0;
%     g_idx = g_idx + 2;
% end

g_idx = g_idx + length(mbs.joints.simple);

for dj = mbs.joints.driving
    g(g_idx + 1) = - dj.cfun_dtt(t);
    g_idx = g_idx + 1;
end

