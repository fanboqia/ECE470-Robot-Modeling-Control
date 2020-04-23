%Section 4.1
myrobot = mypuma560(0);
%%
% Section 4.2 create test cases for angle as input to our robot model
theta1 = linspace(0,pi,200);
theta2 = linspace(0,pi/2,200);
theta3 = linspace(0,pi,200);
theta4 = linspace(pi/4,pi*3/4,200);
theta5 = linspace(-pi/3,pi/3,200);
theta6 = linspace(0,2*pi,200);

q = [theta1; theta2; theta3; theta4; theta5; theta6]';
%%
%Section 4.3 test cases to feed in angle and plot out the forward motion
theta1 = linspace(0,pi,200);
theta2 = linspace(0,pi/2,200);
theta3 = linspace(0,pi,200);
theta4 = linspace(pi/4,pi*3/4,200);
theta5 = linspace(-pi/3,pi/3,200);
theta6 = linspace(0,2*pi,200);

q = [theta1; theta2; theta3; theta4; theta5; theta6]';
o = zeros(200,3);
for i = 1:200
	H = forward(q(i,:),myrobot)
    o(i,:) = H(1:3,4)'
end
plot3(o(:,1),o(:,2),o(:,3),'r')
hold on
plot(myrobot,B)
%%
%Section 4.4 test case for inverse motion and plot out the route with robot arms follow
H = [cos(pi/4) -sin(pi/4) 0 20; sin(pi/4) cos(pi/4) 0 23; 0 0 1 15; 0 0 0 1];
q1 = inverse(H,myrobot)
x = linspace(10,30,100);
y = linspace(23,30,100);
z = linspace(15,100,100);
d = [x;y;z]'
R = [cos(pi/4), -sin(pi/4),0;sin(pi/4),cos(pi/4),0;0,0,1];

B = zeros(100,6);
for j = 1:100
    H2 = [R, d(j,:)';0 0 0 1];
    B(j,:) = inverse(H2, myrobot);
end
plot3(d(:,1),d(:,2),d(:,3),'b')
hold on
plot(myrobot,B)

