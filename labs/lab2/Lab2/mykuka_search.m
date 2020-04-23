function kuka = mykuka_search(delta)

%DH table varibles and corresponding values
theta = [0;0;0;0;0;0]; 
d = [400;0;0;365;0;161.44+delta(2)];
a = [25;315;35;0;0;-296.23+delta(1)];
alpha = [pi/2;0;pi/2;-pi/2;pi/2;0];
DH = [theta,d,a,alpha]; 

%links for the KUKA arm
L(1)=Link('d', DH(1,2), 'a', DH(1,3), 'alpha', DH(1,4));
L(2)=Link('d', DH(2,2), 'a', DH(2,3), 'alpha', DH(2,4));
L(3)=Link('d', DH(3,2), 'a', DH(3,3), 'alpha', DH(3,4));
L(4)=Link('d', DH(4,2), 'a', DH(4,3), 'alpha', DH(4,4));
L(5)=Link('d', DH(5,2), 'a', DH(5,3), 'alpha', DH(5,4));
L(6)=Link('d', DH(6,2), 'a', DH(6,3), 'alpha', DH(6,4));

kuka = SerialLink(L);
