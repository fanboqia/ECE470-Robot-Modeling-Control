% define sample points describing our invented pattern  
X_workspace = zeros(3, 100);
for i=1:100
    frank = 2*pi*i/100
    X_workspace(:, i) = [620+30*cos(frank)*(((sin(frank)*sqrt(abs(cos(frank))))/(sin(frank)+7/5))-2*sin(frank)+2), 30*sin(frank)*(((sin(frank)*sqrt(abs(cos(frank))))/(sin(frank)+7/5))-2*sin(frank)+2), -1]';   
end 
% connecting the hundred sample points 
for i=1:100   
    p_baseframe = FrameTransformation(X_workspace(:, i));
    R = [0 0 1;0 -1 0;1 0 0;];
    H = [R p_baseframe; zeros(1, 3) 1];
    q = inverse_kuka(H, myrobot)
    setAngles(q, 0.04)
end