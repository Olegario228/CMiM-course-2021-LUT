function [] = plot_compare(f, M, b) % checking the approximation by comparing with the real function
t = linspace(-pi, pi, M); % creating time interval with M amount of uni-dist coords
y = f(t); % in function f the value of t will be inserted
S = sinesum(t, b); 
plot(t, y, t, S);
xlabel('Time, s');
legend('f(t)', 'S(t)');
end