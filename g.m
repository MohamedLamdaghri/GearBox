function xplus = g(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file       Project: GearBox
%
% Author : Mohamed Lamdaghri
%
% e-mail : lamdaghri1999@gmail.com 
%
% Filename: g.m
%
% Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% jump map: xplus = g(x,u,parameters);
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

x1plus = xi1;
x2plus = xi2;

if((xi3 == 1) && (xi1 >= (whigh/pr(1))))
    x3plus = 2;
elseif((xi3 == 2) && (xi1 >= (whigh/pr(2))))
    x3plus = 3;
elseif((xi3 == 2) && (xi1 <= (wlow/pr(2))))
    x3plus = 1;
elseif((xi3 == 3) && (xi1 >= (whigh/pr(3))))
    x3plus = 4;
elseif((xi3 == 3) && (xi1 <= (wlow/pr(3))))
    x3plus = 2;
elseif((xi3 == 4) && (xi1 <= (wlow/pr(4))))
    x3plus = 3;
end

xplus = [x1plus; x2plus; x3plus];