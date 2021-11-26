%% Crank slider mechanism analysis
OA = 0.1; % m
AB = 0.2; % m 
phi = 30; % deg
omega = 1; % rad/s
n_t = 101; % number of time steps

a = OA;
b = AB;
% d = OB
% x = [theta; d] - variables to find
theta = zeros(n_t, 1); % preallocating arrays
d = zeros(n_t, 1);
dtheta = zeros(n_t, 1);
dd = zeros(n_t, 1);

% f(x) = [a*cos(phi) + b*cos(theta) - d;
%    a*sin(phi) - b*sin(theta)];
% f(x,t) = 0 for NR method
x0 = [pi; 0]; % storage for solution values of theta and d
k = 1;
u = x0;

for t = linspace(0, 1, n_t)
    phi = pi/6 + omega*t; 
    
    % Constraint and Jacobian calculation
    F = @(u) constraint(u, a, b, phi);
    J = @(u) jacobian(u, b);
    
    % System solving with NR
    tol = 1e-9;
    [u, n_i] = NR_method(F, J, u, tol);
    
    % Derivative calculations
    dfdt = [-a * omega * sin(pi/6 + omega * t)
              a * omega * cos(pi/6 + omega * t)];
    dfdq = [-b * sin(u(1)), -1
            -b * cos(u(1)), 0];
    du = - dfdt \ dfdq;
    
    % Putting the obtained values in arrays of solutions
    theta(k) = u(1);
    d(k) = u(2);
    dtheta(k) = du(1);
    dd(k) = du(2);
   
    k = k + 1;
end

% Plots
t = linspace(0, 1, n_t);

figure;
subplot(2,1,1);
plot(t, theta, 'lineWidth', 3); % t versus theta: 1
legend theta;
subplot(2,1,2);
plot(t, dtheta); % dt
legend dtheta;

figure;
subplot(2,1,1);
plot(t, d, 'lineWidth', 3, 'Color', 'r'); % t versus displacement: 2
legend d;
subplot(2,1,2);
plot(t, dd, 'Color', 'r'); % dd
legend dd;