pkg load control;

pkg load signal;

pkg load symbolic;

#sympref reset;

close all;

clear -v;


disp("Aufgabe 4 Kondensatorspannung")

disp("Multiplikation im Laplace-Bereich")


syms s t I C t_1 u_0;


disp("Eingangsstrom:")

s_f1t = I*(t/t_1*heaviside(t)-2*(t/t_1-1)*heaviside(t/t_1-1)+(t/t_1-2)*heaviside(t/t_1-2))



s_f1s = laplace(s_f1t);

s_f2s = 1/(C*s);


s_f3s= s_f1s*s_f2s+u_0/s;


disp("Ausgangsspannung:")

s_f3t=ilaplace(s_f3s,s,t)*heaviside(t)



I=1;

C=1;

t_1=1;

u_0=0;

t=[0:0.01:4];

f1t=eval(s_f1t);

f31t=eval(s_f3t);

u_0=1;

f32t=eval(s_f3t);

figure;

plot(t,[f1t;f31t;f32t]);

title(["Ergebnis mit u_0=" num2str(u_0)])

xlim([t(1) t(end)])

legend ("i(t)", "u(t) für u(0-)=0","u(t) für u(0-)=1");


disp("Lösung im Zeitbereich")

syms t,s;

stept=0.01;

s_f4t=ilaplace(1/(C*s),s,t)*heaviside(t);

t=[-4:stept:4];

f4t=eval(s_f4t);

f1t=eval(s_f1t);

f5t=conv(f4t,f1t,"same").*stept;

figure;

plot(t,[f1t;f4t;f5t]);

title("Lösung im Zeitbereich")


disp("Für u(0-) ungleich 0, ist der Ausgang um u(0-) zu erhöhen. u(0-) kann als zweites additv verknüpftes System gesehen werden.")