function [x_c] = crossing_2_graphs(N, e)
f = @(x) x; % defining functions
g = @(x) x^2;
x = linspace(-4, 4, N); % x intervals

for i = 1:N % loop through
    if abs(f(x(i)) - g(x(i))) < e 
        x_c = x(i); % intersection point
    end
end