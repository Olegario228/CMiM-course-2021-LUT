function [y] = linear_interpolation(Y, t)
T = 0:(length(Y)-1); % array of time points, in mins (must correspond to the amount of measurements)
for l = 1:length(T) 
    if (T(l) <= t && t <= T(l+1)) % our t lays in the interval
        y = Y(l) + (Y(l+1) - Y(l)) * (t - T(l)); % computing the interpolated value of y
        break
    end
end

% % Uses linear interpolation to find intermediate y
%     i = floor(t) + 1;
%     % Scheme: y(t) = y_i + delta-y/delta-t * dt
%     y = Y(i) + ((Y(i+1) - Y(i)))*(t-floor(t));
end
