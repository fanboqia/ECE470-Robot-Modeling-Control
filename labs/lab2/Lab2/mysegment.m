% define sample points describing the line  
X_workspace = zeros(3, 100);
X_workspace(1,:) = 620
X_workspace(2,:) = linspace(-100,100,100)
X_workspace(3,:) = -1
% connecting the hundred sample points 
for i=1:100
    p_baseframe = FrameTransformation(X_workspace(:, i));
    R = [0 0 1;0 -1 0;1 0 0;];
    H = [R p_baseframe; zeros(1, 3) 1];
    q = inverse_kuka(H, myrobot)    
    setAngles(q, 0.04)
end

