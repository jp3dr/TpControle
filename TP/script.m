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

ts = 1;

s = tf('s');
Transfer01 = (80.7*s+1)/(199.4*10*s);

cz01 = c2d(Transfer01, ts)

Transfer03 = (28.43*s+1)/(127.66*10*s);

cz03 = c2d(Transfer03, ts)

Transfer05 = (18.13*s+1)/(92.34*10*s);

cz05 = c2d(Transfer05, ts)

Transfer075 = (12.53*s+1)/(68.72*10*s);

cz075 = c2d(Transfer075, ts)


