function mbs = add_prismatic(mbs, name, body1_name, s1, s2, body2_name, s3)
%  ADD_PRISMATIC Function that adds prismatic joints.
% 

% Prismatic joint definition: name, body names, local vector coordinates.
% three points are laying on the line parallel to translation
p = inputParser;
is_2vec = @(x) isvector(x) && length(x) == 2;
addRequired(p,'name', @isstring);
addRequired(p, 'body1_name', @isstring);
addRequired(p, 's1', is_2vec);               % first point on body 1
addRequired(p, 's2', is_2vec);               % second point on body 1
addRequired(p, 'body2_name', @isstring);
addRequired(p, 's3', is_2vec);               % point on body 2
parse(p, name, body1_name, s1, s2, body2_name, s3);

% Get bodies ids
b1 = get_body_id(mbs, body1_name);
b2 = get_body_id(mbs, body2_name);
rev = struct("name", name, "body1", b1, "s1", s1(:), "s2", s2(:), "body2", b2, "s3", s3(:));
mbs.joints.prismatic = [mbs.joints.prismatic, rev];
mbs.nc = mbs.nc + 2;
end