clear; clc;
% linear function of r(N)
f = @(u,t) 0.1*(1-u/500)*u;
% initial parameters for ode_FE
U_0 = 100;
dt = 20; 
T = 100;
% solving ode for the initial time step
[u, t] = ode_FE(f, U_0, dt, T);

% loop for variable time-step dtk
k = 1;
one_more = true;
while one_more == true
    dt_k = 2^(-k)*dt;
    [u_new, t_new] = ode_FE(f, U_0, dt_k, T); % solving ode with next time step
    plot(t, u, 'b-', t_new, u_new, 'r--') % plotting both solutions
    xlabel('t'); ylabel('N(t)'); 
    legend('dtk-1', 'dtk');
    saveas(gcf, 'logistic.png');
    fprintf('Timestep was: %g\n', dt_k);
    next = input('Continue the loop? y/n: ', 's');
    if next == 'y'
        u = u_new; 
        t = t_new;
    else
        one_more = false;
    end
    k = k + 1;
end