function [] = trial(f, N) % function for checking the approximation by interactively giving values
% to b coefs. Result is a plot with a calculated error.
M = 500; 
b = []; % empty array for b coefs
new_trial = true; 
while new_trial 
    for k = 1:N
        b(k) = input('Give b: '); 
    end
    plot_compare(f, M, b);
    E = err(b, f, M); 
    fprintf('Error is: %g \n', E);
    answ = input('New trial (y/n)? ', 's');
    if answ == 'n'
        new_trial = false;
    end
end
end