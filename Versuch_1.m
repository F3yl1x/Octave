pkg load control;
pkg load signal;
pkg load symbolic;
close all;
clear -v;

syms t s;

f1=sin(t)*heaviside(t);
f2=3*(heaviside(t)-heaviside(t-2));

f1_la=laplace(f1,t,s);
f2_la=laplace(f2,t,s);

f3_la= f1_la*s;
f4_la= f2_la*s;

f1_a=ilaplace(f3_la,s,t);
f2_a=ilaplace(f4_la,s,t);

t=[-2:0.01:(4*pi)];
s=[-2:0.01:(4*pi)];

f1_out = eval(f1);
f2_out = eval(f2);

f1_la_out = eval(f1_a);
f2_la_out = eval(f2_a);

%plot(t,[f1_out;f2_out]);

%plot(s,[f1_la_out;f2_la_out]);

plot(t,[f1_out;f2_out;f1_la_out;f2_la_out]);