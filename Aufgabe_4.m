pkg load control;
pkg load signal;
pkg load symbolic;
close all;
clear -v;

syms s t i c u0 ;

funktion = i*(t*heaviside(t)- 2*(t-1)*heaviside(t-1)+ (t-2) * heaviside(t-2));
funktion_la = laplace(funktion,t,s);
kondensator = ((funktion_la/(c*s))+u0/s);
kondensator_zeit = ilaplace(kondensator,s,t)
kondensator_la = i/(c*s)+ u0/s;
kondensator_la_zeit = ilaplace(kondensator_la,s,t) * heaviside(t);

t=[0:0.01:3];
i = 1;
c = 1;
u0 = 0;

kondensator_la_zeit_out = eval(kondensator_la_zeit);
funktion_out = eval(funktion);

faltung = conv(funktion_out,kondensator_la_zeit_out,"same")/100;

f_out = eval(funktion);
kondensator_out = eval(kondensator_zeit);

plot(t,[f_out;kondensator_out;faltung]);