pkg load signal;

close all;

clear -v;


[data,fs]=audioread("Test.ogg");


#Impulsantwort des Filters erzeugen

#tt=[-10:0.1:10];

tt=[-10:0.02:10];

#tt=[-10:2:10];

y2 =  sinc(tt);

#Filter anzeigen einmal ohne und einmal mit Zeitachse

subplot(211)

plot(tt,y2)

subplot(212)

tt2=[-(length(y2)-1)/2*1/fs:1/fs:(length(y2)-1)/2*1/fs];

plot(tt2,y2)

xlim([tt2(1) tt2(end)])

#Fouriertransformation des Eingangssignals anzeigen

figure;

subplot(211)

ff=[-fs/2:fs/(length(data)-1):fs/2];

plot(ff,abs(fftshift(fft(data))));

#Berechnnen der Faltung (Durchführung Filterung)

data=conv(data,y2, "same");

data=data./max(abs(data));

#Abspielen des Ergebnisses der Faltung

player=audioplayer (data,fs);

play(player);

#Fouriertransformation des Ausgangssignals anzeigen

subplot(212)

plot(ff,abs(fftshift(fft(data))));

#Warten bis Abspielen beendet

while isplaying(player)

 pause(.1);

endwhile

#audiowrite("Test2.ogg",data,fs);

#Berechnung der Zeitachse, Spektralachsen, Grenzfrequenz usw.

disp("Zeitfenster -10...10 => Funktion ist sin(pi*t)/(pi*t) => Nullstelle bei 1")

disp("Fouriertransformation von sin(tau/2*t)/(t*pi) ist r_tau(omega)")

disp("sin(tau/2*t)/(t*pi) hat Nullstelle bei t_0=2*pi/tau => tau=2*pi/t_0")

t_0=(length(tt)-1)/2/10*1/fs;

disp(["Abtastung ",num2str((length(tt)-1)/2)," Werte => erste Nullstelle liegt bei 1/10 also t_0=",num2str(t_0)])

tau=(2*pi/t_0);

disp(["tau=2*pi/t_0=",num2str(tau)])

disp("Grenzkreisfrequenz Filter ist bei tau halbe => Achtung noch durch 2 Pi da wir f_g wollen")

disp(["f_g=",num2str(tau/2.0*1/(2*pi))])

disp(["Gesamtformel f_g=f_s/2*1/Anzahl_Punkte_bis_erste Nullstelle=",num2str(fs/2*10/((length(tt)-1)/2.0))])