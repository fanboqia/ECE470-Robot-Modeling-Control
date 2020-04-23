function [ A ] = Amatrix (theta, alpha, d, a)
% A table that convert DH table to homogenous matrix
A = [cos(theta), -sin(theta)*cos(alpha), sin(theta)*sin(alpha), a*cos(theta);
    sin(theta),cos(theta)*cos(alpha),-cos(theta)*sin(alpha),a*sin(theta);
    0, sin(alpha), cos(alpha), d;
    0, 0, 0, 1];

