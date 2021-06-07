pkg load control;
pkg load signal;
pkg load symbolic;
close all;
clear -v;

syms t s;

f1=(3/2)*(heaviside(t)-heaviside(t-2));
f2=heaviside(t)-heaviside(t-2);

f1_la = laplace(f1,t,s);
f2_la = laplace(f2,t,s);

f_gefalted = f1_la * f2_la;

f_zeit = ilaplace(f_gefalted,s,t);

t=[0:0.01:5];
s=[0:0.01:5];

f1_out = eval(f_zeit);


figure;
plot(t,f1_out);


