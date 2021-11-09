% Computes Kinetic and Potential energy of a simplified oscillating system
function [P, K] = osc_energy(u, v, omega)
P = 1/2 * omega.^2 * u.^2;
K = 1/2 * v.^2;
end