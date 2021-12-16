function [Sum] = sinesum(t, b) % approximation of function by the sum of sines 
S = zeros(length(t),1);
for M = 1:length(t)
   for k = 1:length(b)
       S(M) = S(M) + b(k)*sin(k*t(M));
   end
end
Sum = S;
end
