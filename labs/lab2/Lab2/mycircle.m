% define sample points describing the circle  
X_workspace = zeros(3, 100);
X_workspace(1,:) = 620+50*sin(2*pi/100*linspace(0,100,100));
X_workspace(2,:) = 50*cos(2*pi/100*linspace(0,100,100));
X_workspace(3,:) = -1;
% connecting the hundred sample points 
for i=1:100
    p_baseframe = FrameTransformation(X_workspace(:, i));
    R = [0 0 1;0 -1 0;1 0 0;];
    H = [R p_baseframe; zeros(1, 3) 1];
    q = inverse_kuka(H, myrobot)
    setAngles(q, 0.04)
end
