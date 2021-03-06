function qdd = acceleration_for_ode45(mbs, q, t)
M = mass_matrix(mbs);
f = forces(mbs, q);
if mbs.nc == 0
    qdd = M \ f;
    return
end

qd = [-0.1;0;0;0;-0.1;0;0;0;0]; % our qd0
C = constraints(mbs, q, t);
Cq = constraints_dq(mbs, q);
Ct = constraints_dt(mbs, t);
Cp = Cq * qd + Ct;

g = constraints_g(mbs, q, qd, t);
alpha = mbs.balpha;
beta = mbs.bbeta;

LHS = [M, Cq'; Cq, zeros(mbs.nc)];
rhs = [f; g - 2 * alpha * Cp - beta^2 * C];
qddlambda = LHS \ rhs;
qdd = qddlambda(1:mbs.nq);