clc
clear

Wmax = 420; % rad/s
Tmax = 190; % Nm
beta = 0.4;
An = 16; % [40 25 16 12 10] % m^-1
Cd = 0.32;
Cr = 0.01;
A = 2.42; %m^2
p = 1.3; %kg/m^3
teta = 0;
g = 9.80; % m/s^2
M = 989; % kg


% Ponto de equilíbrio
u=0.5;
v=0;
Fmotor = Tmax*(1-beta*(An*v/Wmax - 1)^2)*An*u;
Fvisc = M*g*Cr;
Faero = 1/2*p*Cd*A*v^2;
f = Fmotor-Fvisc-Faero;

while (f > 0)
    v = v+0.1;
    Fmotor = 190*(1-beta*(An*v/Wmax - 1)^2)*An*u;
    Fvisc = M*g*Cr;
    Faero = 1/2*p*Cd*A*v^2;
    f = Fmotor-Fvisc-Faero;
end

ts = 1;

s = tf('s');
Transfer01 = (80.7*s+1)/(199.4*10*s);

cz01 = c2d(Transfer01, ts)

Transfer03 = (80.7*s+1)/(199.4*10*s);

cz01 = c2d(Transfer, ts)



% Tmax*(1-beta*(An*v/Wmax - 1)^2)*An*Uo/M - g*Cr - 1/2*p*Cd*A*v^2 = 0
% aux = Tmax*An*Uo/M; % 3.8423
% a2 = aux*(-beta)*An^2/Wmax^2 - 1/2*p*Cd*A; % v^2
% a1 = aux*(-beta)*(-2)*An/Wmax; % v
% a0 = aux*(-beta) - g*Cr;
% Vo = roots([a2 a1 a0])

% T(w)
% function T = Tw(w)
%     T = Tmax*(1-beta*(w/Wmax - 1)^2)
% end
