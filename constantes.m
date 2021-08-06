Wmax = 420 %rad/s
Tmax = 190 % Nm
beta = 0.4 
An = [40 25 16 12 10] % m^-1
Cd = 0.32
Cr = 0.01
g = 9.8 % m/s^2
M = 989 % kg
A = 2.42 %m^2
p = 1.3 %kg/m^3

w = 0:100:Wmax

T = Tmax*(1-beta*((w/Wmax)-1).^2)

Vlin = 0:50:300
V2lin = Vlin.^2


v0 = 10;
u0 = 1;
a = 0;

%1 marcha ate 12km/h

n = 1/M*(-An(1)*u0*Tmax*beta*2*(An(1)/Wmax)*(1-beta*((An(1)/Wmax)*v0-1))-p*Cd*A*v0)
delta = (1/M)*An(1)*Tmax*(1-beta*((An(1)/Wmax)*v0-1)^2)

u = 0.1
syms v
Fmotor = Tmax*(1-beta*(((An(3)*v)/Wmax)-1)^2)*An(3)*u
Fvisc = M*g*Cr
Faero = 1/2*p*Cd*A*v^2



aceleracao = Fmotor/M - Fvisc/M - Faero/M
pretty(aceleracao)
r = root(aceleracao,v)

a=1;
b = -12768000/936893;
c = -471197475/3747572;
rReal = (-b+sqrt(b^2-4*a*c))/2*a
s = tf('s');
G = delta/(s-n)