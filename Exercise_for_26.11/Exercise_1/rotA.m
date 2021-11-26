function [rotA] = rotA(phi)
rotA = [cos(phi) -sin(phi);
        sin(phi) cos(phi)];
end