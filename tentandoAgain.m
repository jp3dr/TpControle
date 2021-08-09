clc
clear
Wmax = 420 %rad/s
Tmax = 190 % Nm
beta = 0.4 
An = 40 % [40 25 16 12 10] % m^-1
Cd = 0.32
Cr = 0.01
g = 9.8 % m/s^2
M = 989 % kg
A = 2.42 %m^2
p = 1.3 %kg/m^3

syms u v 

T = Tmax*(1-beta*((An*v/Wmax)-1).^2)

Fengine = T*An*u

Fat = M*g*Cr

FAero = (1/2)*p*Cd*A*v^2
FaeroDiff = diff(FAero,v)

partialV = diff(Fengine,v)
partialU = diff(Fengine,u)

ladoV = partialV - FaeroDiff

n = ladoV/M;
delta = partialU/M;
