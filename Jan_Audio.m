pkg load control;
pkg load signal;
pkg load symbolic;
close all;
clear -v;

t = [-10:0.02:10];

funktion = sinc(t);

signalv = audioread("Test.ogg");

signalv = signalv./max(abs(signalv));

y=conv(signalv,funktion,"same");

audiowrite("Audio5.ogg",y,24000);