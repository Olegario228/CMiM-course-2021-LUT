function [] = fit_sines() % this function automates the process of getting the b coefs
% with recieve of the smallest error

% initial values for checking
N = 3;
b = zeros(N,1);
f = @(t) t/pi;
M = 500;

% smallest error searching
b = [-1 -1 -1]; % loop starting points
b_test = b; 
smallest_err = err(b_test, f, M);
h = 0.1;
% three dimensional searching for smallest error
for b1 = -1:h:1 
    for b2 = -1:h:1
        for b3 = -1:h:1
            b_test(1) = b1; 
            b_test(2) = b2;
            b_test(3) = b3;
            error = err(b_test, f, M);
            if error < smallest_err 
                b = b_test;
                smallest_err = error;
            end
        end
    end
end

plot_compare(f, M, b)
saveas(gcf, 'comparison.png');
fprintf('Smallest error is: %g \n', smallest_err);
fprintf('b: %g, %g, %g \n', b(1), b(2), b(3));

end