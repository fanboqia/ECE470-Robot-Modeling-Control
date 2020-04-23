delta = fminunc(@deltajoint,[0 0])
myrobot = mykuka_search(delta)
%%
% 4.2
R = [0 0 1; 0 -1 0; 1 0 0];
D = [497.930000000000,180.930000000000,89.9700000000000]';
H = [R D;0 0 0 1];
q = inverse_kuka(H,myrobot)
setAngles(q,0.04)
%%
% 4.3
p_workspace = [600;100;-1]
p_baseframe = FrameTransformation(p_workspace)
R = [0 0 1; 0 -1 0; 1 0 0];
H2 = [R p_baseframe;zeros(1,3) 1]
q2 = inverse_kuka(H2,myrobot)
setAngles(q2,0.04)
%%
