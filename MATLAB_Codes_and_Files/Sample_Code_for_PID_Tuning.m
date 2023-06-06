% Design a PID controller in CT
s = tf('s');
Gs = modeled_tf;% Matlab modelled transfer function
display(Gs);

Cs = pidtune(Gs,'pid');
Gc = feedback(Cs*Gs,1);% Unity feedback system
display(Gc);

%% Comparison of Closed loop and open loop transfer functions
figure;
k = stepplot(Gs, Gc);
legend('Open-Loop System', 'Closed-Loop System');

%% Pole Zero plot
figure;
pzplot(Cs*Gs);
grid on; 

%% Draw the root locus
figure;
rlocus(Gs);
grid on