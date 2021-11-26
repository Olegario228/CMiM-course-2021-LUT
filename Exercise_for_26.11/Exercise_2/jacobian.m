function J = jacobian(u, b)
theta = u(1);

% computes the Jacobian of the system
J = [-b * sin(theta), -1
    -b * cos(theta), 0];
end