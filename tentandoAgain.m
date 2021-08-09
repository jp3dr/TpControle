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
diffT = diff(T,v)

%forças
FAero = (1/2)*p*Cd*A*v^2
Fengine = T*An*u
Fat = M*g*Cr

FaeroDiff = diff(FAero,v)

%aceleração
ac = 1/M*(Fengine-Fat-FAero) 

%achando raízes
Solution = solve(ac,[u,v])

%testando se ao substituir valores encontrados, zera aceleração
acEq = subs(ac,u,Solution.u)
acEq2 = subs(acEq,v,Solution.v)

Teq = subs(T,v,Solution.v)
FengineDiff = diffT*An*Solution.u

%Substituindo valores encontrados
FengineDiffEq = subs(FengineDiff,v,Solution.v)
FaeroDiffEq = subs(FaeroDiff,v,Solution.v)

n = (FengineDiffEq - FaeroDiffEq)/M
delta = (Teq*An)/M

s = tf('s');
Ge = delta/(s-n)


