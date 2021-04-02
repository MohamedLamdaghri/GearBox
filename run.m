%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file       Project: GearBox
%
% Author : Mohamed Lamdaghri
%
% e-mail : lamdaghri1999@gmail.com 
%
% Filename: run.m
%
% Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc
%Constants
c     = 0.7;                      %kg * m-1
pr    = [50 32 20 14];            %Adim
kr    = [3.75 5.86 9.375 13.39];  %N * s
Tr    = 40;                       %s
grav  = 10;                       %m * s-2
m     = 1500;                     %kg
vref  = 30;                       %m * s-1
whigh = 500;                      %rad * s-1
wlow  = 230;                      %rad * s-1
d     = 0;                        %rad

global c pr kr Tr grav m vref whigh wlow d

% initial conditions
x0 = [14;0;2];
 
% simulation horizon
TSPAN = [0 100];
JSPAN = [0 100];

% rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
rule = 2;

options = odeset('RelTol',1e-6,'MaxStep',.1);

% simulate
[t j x] = HyEQsolver( @f,@g,@C,@D,x0,TSPAN,JSPAN,rule,options);

% state
x1 = x(:,1);
x2 = x(:,2);
x3 = x(:,3);

% plot solutions
figure(1)
clf
plot(x1, x2)
grid on
xlabel('Velocidad')
ylabel('Ti')

figure(2)
clf
subplot(2,1,1),plotflows(t,j,x(:,3))
grid on
xlabel('Saltos (j)')
ylabel('Estados')
 
subplot(2,1,2),plotjumps(t,j,x(:,3))
grid on
ylabel('x3')


% plot hybrid arc
figure(3)
plotHybridArc(t,j,x(:,1))
xlabel('j')
ylabel('t')
zlabel('x1')

figure(4)
plotHybridArc(t,j,x(:,2))
xlabel('j')
ylabel('t')
zlabel('x2')