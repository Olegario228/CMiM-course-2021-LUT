function [result] = test_sinesum() % testing the sinesum function
t = [-pi/2 pi/4];
b = [4 -3];
result = sinesum(t, b);
end