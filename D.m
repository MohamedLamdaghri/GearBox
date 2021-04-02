function v  = D(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file       Project: GearBox
%
% Author : Mohamed Lamdaghri
%
% e-mail : lamdaghri1999@gmail.com 
%
% Filename: D.m
%
% Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

if((xi3 == 1) && (xi1 >= (whigh/pr(1))))
    v = 1;
elseif(((xi3 == 2) && (xi1 >= (whigh/pr(2)))) || ((xi3 == 2) && (xi1 <= (wlow/pr(2)))))
    v = 1;
elseif(((xi3 == 3) && (xi1 >= (whigh/pr(3)))) || ((xi3 == 3) && (xi1 <= (wlow/pr(3)))))
    v = 1;
elseif((xi3 == 4) && (xi1 <= (wlow/pr(4))))
    v = 1;
else
    v = 0;
end
