% linear function of r(N)
f = @(u, t) 0.1*(1 - u/500)*u;
% initial parameters for ode_FE
U_0 = 100;  
dt = 10;
T = 100;
% solving ode for the initial time step
[u, t] = ode_FE(f, U_0, dt, T);

% loop over k for variable time-step dtk
for k = 0:1000
    dtk = 2^(-k)*dt;  
    [u_new, t_new] = ode_FE(f, U_0, dtk, T); % solving ode with next time step
    plot(t, u, 'b-', t_new, u_new, 'r--'); % plotting both solutions
    xlabel('t');  ylabel('N(t)');
    legend('dtk-1', 'dtk');
    fprintf('Timestep: %g\n', dtk);
    next = input('Continue the loop? y/n: ', 's');
    if next == 'y'
        u = u_new; 
        t = t_new;
        continue
    else
        break
    end
end
