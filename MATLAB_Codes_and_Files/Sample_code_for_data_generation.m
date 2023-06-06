clc; close all; clear;
s = tf('s');


%num = conv([exp(0.1) 0],[1 1]);
%den = conv([1 5 6], conv([1 1],[1 3]));

G = (10*(s+3)*(s+1)*exp(-0.04*s))/(s^3 + 6*(s^2) + 5*s + 16);% write your transfer function for data generation
display(G);

dt = 0.001;% set your sampling interval

t = 0:dt:8;
u = ones(length(t),1);

u(1:1/dt)=0; % set first 10 samples to zero

y = lsim(G,u,t);
y = y + rand(length(t),1)*0.02;

plot(t,[u,y]); axis([0 8 0 1.2]);