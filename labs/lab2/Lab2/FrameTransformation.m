function pBaseFrame = FrameTransformation(pWorkspace)

%	if you recalibrate the robot, YOU MUST UPDATE deltajoint.m  too ! 
    X1=[658.020000000000,-193.230000000000,89.9700000000000]';
    X2=[658.020000000000,180.930000000000,89.9700000000000]';
    X3=[497.930000000000,180.930000000000,89.9700000000000]';    

%   finding plane coordinates: a*x + b*y + c*z = 1
    M = [X1'; X2'; X3'];
    params = pinv(M)*[1 1 1]';
    a = params(1);
    b = params(2);
    c = params(3);
    v = [a b c]';  % plane normal vector; should be close to [0;0; 1] !
    
    % Rotation matrix; mapping from Base-frame to workspace-frame: R*v1 = v2
    v2 = v/norm(v);
    v1 = [0 0 1]';    
    rotV = vrrotvec(v1,v2);    
    R = vrrotvec2mat(rotV);
    
    %%% calculating transformation matrix:  H*pWorkspace = pBaseFrame
    xOrig = 0;
    yOrig = 0;
    zOrig = (1 -a*xOrig -b*yOrig)/c;    
    Orig = [xOrig  yOrig  zOrig]';    
    H = [R, Orig; zeros(1,3), 1];    
    
    tmp = H*[pWorkspace;1];
    pBaseFrame = tmp(1:3);   % any point on the table is converted back
                             % to robot base-frame. 
                             % "pBaseFrame" can be used by robot
                             % inverse kinematics to find proper joint
                             % angles !
end
    
    
    
    
    
    


