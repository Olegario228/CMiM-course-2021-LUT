function [E] = err(b, f, M) 
t = linspace(-pi, pi, M);
y = f(t);
S = sinesum(t, b);
dif = 0; 
for i = 1:length(t) % from 6th string to 9th - calculation of the error
    dif = dif + (y(i) - S(i))^2; 
end
E = sqrt(dif);
end