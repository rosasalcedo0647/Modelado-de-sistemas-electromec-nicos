clc;
clear;
close all;

Ra = 2;
Kt = 0.01;
b  = 0.0012;
La = 0.023;
Ke = 0.01;
J  = 0.001;

va = 10; 
T  = 0;      

x0 = [0; 0; 0];


tspan = [0 5];

f = @(t,x) [...
    (va - Ra*x(1) - Ke*x(2))/La;
    (Kt*x(1) - b*x(2) - T)/J;
    x(2)];


[t,x] = ode45(f,tspan,x0);

ia    = x(:,1);
omega = x(:,2);
theta = x(:,3);

figure;

subplot(3,1,1)
plot(t,ia,'b','LineWidth',1.5)
grid on
xlabel('Tiempo [s]')
ylabel('i_a [A]')
title('Corriente de armadura')

subplot(3,1,2)
plot(t,omega,'r','LineWidth',1.5)
grid on
xlabel('Tiempo [s]')
ylabel('\omega [rad/s]')
title('Velocidad angular')

subplot(3,1,3)
plot(t,theta,'k','LineWidth',1.5)
grid on
xlabel('Tiempo [s]')
ylabel('\theta [rad]')
title('Posición angular')
