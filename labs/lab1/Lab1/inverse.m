function q = inverse(H,myrobot)

Rd = H(1:3,1:3); %Compute rotational matrix from frame 0 to any vector
Od = H(1:3,4); %Compute translational matrix from frame 0 to any vector
Oc = Od - Rd*[0;0;myrobot.d(6)]; %Compute position of wrist center for KUKA arm

q(1) = atan2(Oc(2),Oc(1)) -  atan2(-myrobot.d(2), real(sqrt(Oc(1)^2+Oc(2)^2-myrobot.d(2)^2))); %compute angle for joint 1 from frame 0 to frame 1
D = ((Oc(3)-myrobot.d(1))^2+Oc(1)^2+Oc(2)^2-myrobot.d(2)^2-myrobot.a(2)^2-myrobot.d(4)^2)/(2*myrobot.a(2)*myrobot.d(4)); 
q(3) = atan2(D,real(sqrt(1-D^2))); %compute angle for joint 2 from frame 0 to frame 1
q(2) = atan2(Oc(3)-myrobot.d(1), real(sqrt(Oc(1)^2+Oc(2)^2-myrobot.d(2)^2)))-atan2(myrobot.d(4)*sin(q(3)-pi/2),myrobot.a(2)+myrobot.d(4)*cos(q(3)-pi/2));%compute angle for joint 3 from frame 0 to frame 1

% compute homogenous matrix from frame 0 to frame 1 using angle on link 1, 2, 3
H1 = Amatrix(q(1), myrobot.alpha(1), myrobot.d(1), myrobot.a(1));
H2 = Amatrix(q(2), myrobot.alpha(2), myrobot.d(2), myrobot.a(2));
H3 = Amatrix(q(3), myrobot.alpha(3), myrobot.d(3), myrobot.a(3));
r = H1*H2*H3;
R = r(1:3,1:3);
R_tot = R'*Rd;


q(4) = atan2(R_tot(2,3),R_tot(1,3));%compute angle for joint 4 from frame 0 to frame 1
q(5) = atan2(real(sqrt(1-R_tot(3,3)^2)),R_tot(3,3));%compute angle for joint 5 from frame 0 to frame 1
q(6) = atan2(R_tot(3,2), -R_tot(3,1));%compute angle for joint 6 from frame 0 to frame 1
