pkg load control;
pkg load signal;
pkg load symbolic;
close all;
clear -v;

syms t s;

f1=(3/2)*(heaviside(t)-heaviside(t-2));
f2=heaviside(t)-heaviside(t-2);

t=[-5:0.01:5];

f1_out = eval(f1);
f2_out = eval(f2);

plot(t,[f1_out;f2_out]);

y = conv(f1_out,f2_out,"same")/100;

plot(t,y);