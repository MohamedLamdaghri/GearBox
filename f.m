function xdot = f(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file       Project: GearBox
%
% Author : Mohamed Lamdaghri
%
% e-mail : lamdaghri1999@gmail.com 
%
% Filename: f.m
%
% Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% flow map: xdot=f(x,u,parameters);
%constants
global c
global pr
global kr
global Tr
global grav
global m
global vref
global whigh
global wlow
global d

%state
xi1 = x(1); %v
xi2 = x(2); %Ti
xi3 = x(3); %q

% flow map
%xdot=f(x,u);
Tp = kr(xi3) * (vref - xi1);

u = Tp + xi2 + (c / pr(xi3)) * (xi1^2) * sign(xi1);

x1dot = ((pr(xi3) * u) / m) - ((c * xi1^2 * sign(xi1)) / m) - (grav * sin(d));

x2dot = (kr(xi3) / Tr) * (vref - xi1);

x3dot = 0;


xdot = [x1dot ; x2dot; x3dot];
