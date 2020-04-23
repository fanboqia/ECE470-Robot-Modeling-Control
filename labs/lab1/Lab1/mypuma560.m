function myrobot = mypuma560(DH)

%DH table varibles and corresponding values
theta = [0;0;0;0;0;0]; 
d = [76;-23.65;0;43.18;0;20];
a = [0;43.23;0;0;0;0];
alpha = [pi/2;0;pi/2;-pi/2;pi/2;0];
DH = [theta,d,a,alpha]; 

%links for the KUKA arm
L(1)=Link('d', DH(1,2), 'a', DH(1,3), 'alpha', DH(1,4));
L(2)=Link('d', DH(2,2), 'a', DH(2,3), 'alpha', DH(2,4));
L(3)=Link('d', DH(3,2), 'a', DH(3,3), 'alpha', DH(3,4));
L(4)=Link('d', DH(4,2), 'a', DH(4,3), 'alpha', DH(4,4));
L(5)=Link('d', DH(5,2), 'a', DH(5,3), 'alpha', DH(5,4));
L(6)=Link('d', DH(6,2), 'a', DH(6,3), 'alpha', DH(6,4));

myrobot = SerialLink(L);
