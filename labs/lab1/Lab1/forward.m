function H = forward(joint,myrobot)
% compute A matrix for each part of links
A1 = Amatrix(joint(1), myrobot.alpha(1), myrobot.d(1), myrobot.a(1));
A2 =  Amatrix(joint(2), myrobot.alpha(2), myrobot.d(2), myrobot.a(2));
A3 =  Amatrix(joint(3), myrobot.alpha(3), myrobot.d(3), myrobot.a(3));
A4 =  Amatrix(joint(4), myrobot.alpha(4), myrobot.d(4), myrobot.a(4));
A5 =  Amatrix(joint(5), myrobot.alpha(5), myrobot.d(5), myrobot.a(5));
A6 =  Amatrix(joint(6), myrobot.alpha(6), myrobot.d(6), myrobot.a(6));

% calculate Homegenous matrix for forward motion
H = A1*A2*A3*A4*A5*A6;

