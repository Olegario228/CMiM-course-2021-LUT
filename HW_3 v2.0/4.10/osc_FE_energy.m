% FE oscillating system solving with total energy plot
% Initial condition
omega0 = 2;
T0 = 2*pi/omega0;
dt = T0/20;
tk = 3*T0;
N_t = floor(tk/dt);
t = linspace(0, N_t*dt, N_t+1);

u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

X_0 = 2;
u(1) = X_0;
v(1) = 0;

% Step equations forward in time
for n = 1:N_t
    u(n+1) = u(n) + dt*v(n);
    v(n+1) = v(n) - dt*omega0^2*u(n);
end
figure
subplot(2,1,1);
plot(t, u, 'b-', t, X_0*cos(omega0*t), 'r--');
legend('numerical', 'exact', 'Location','northwest');
title(sprintf('Displacements FE dt %g, tk %f', dt, tk))
xlabel('t [s]');
subplot(2,1,2);
[P, K] = osc_energy(u, v, omega0);
plot(t, P+K, 'b-');
legend('Full energy of the system, P+K', 'Location', 'northwest');
xlabel('t [s]');
saveas(gcf, 'osc_FE_energy.png');