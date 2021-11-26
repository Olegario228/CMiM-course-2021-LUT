function F = constraint(u, a, b, phi)
theta = u(1);
d = u(2);

% Our equation that we are trying to solve through NR
F = [a * cos(phi) + b * cos(theta) - d
    a * sin(phi) - b * sin(theta)];
end