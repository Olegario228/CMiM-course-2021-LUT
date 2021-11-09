% Initial conditions
omega0 = 2;
T0 = 2*pi/omega0;
%dt = T0/20;
dt = T0/2000;
tk = 3*T0;
N_t = floor(tk/dt);
t = linspace(0, N_t*dt, N_t+1);

u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

X_0 = 2;
u(1) = X_0;
v(1) = 0;

% System solving
for n = 2:N_t+1
    u(n) = (dt*v(n-1) + u(n-1))/(1+(dt*omega0)^2);
    v(n) = (-dt*omega0^2*u(n-1) + v(n-1))/(1+(dt*omega0)^2);
end

% Plotting
plot(t, u, 'b-', t, X_0*cos(omega0*t), 'r--');
legend('numerical', 'exact', 'Location','northwest');
title(sprintf('Displacements BE dt %g, tk %f', dt, tk))
xlabel('t [s]');