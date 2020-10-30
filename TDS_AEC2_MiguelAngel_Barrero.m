%##EJERCICIOS AEC2

clear all;

%##EJERCCIO 1

n=-50:1:49;
a=[1,0,0.9];                                    %%Coeficientes de y
b=[0.3,0.6,0.3];                                %%Coeficientes de x
delta=[zeros(1,50),1,zeros(1,49)];              %%Impulso unitario centrado en n=0
y1=filter(b,a,delta);                           %%Respuesta al impulso del filtro
figure;
stem(n,y1);xlabel("n");ylabel("y(n)");  
axis([-50 49]);
title("Respuesta al impulso del filtro del ejercicio 1");  
            
%##------------------------------------------------------------------------------

%##EJERCICIO 3
%##Respuesta al impulso filtro ejercicio 3
n=-9:1:99;
a=[1,-1.8*cos(pi/16),0.81];
b=[1,1/2,0];
delta=[zeros(1,9),1,zeros(1,99)];
un=[zeros(1,9),ones(1,100)];
figure;
y2=filter(b,a,delta);                   
stem(n,y2);xlabel("n");ylabel("y(n)");
axis([-9 99]);
title("Respuesta al impulso del filtro del ejercicio 3");

%##------------------------------------------------------------------------------
%##Respuesta al escalon del filtro del ejercicio 3
[y3,finalstate]=filter(b,a,un);
figure;
stem(n,y3);xlabel("n");ylabel("y(n)");
axis([-9 99]);
title("Respuesta al escalon del filtro del ejercicio 3");

%##------------------------------------------------------------------------------
%##Valor cuando n tiende a infinito de la respuesta del filtro a la señal escalon
%##Hacemos n mayor aumentando la dimension de un,para ello aumentamos tambien n,en este caso hasta 400
n=0:1:400;
un=[zeros(1,length(n)/2),ones(1,length(n)/2+1)];
[y3_400,sf1]=filter(b,a,un);
%##Hacemos n mayor aumentando la dimension de un,para ello aumentamos tambien n,en este caso hasta 1000
n=0:1:1000;
un=[zeros(1,length(n)/2),ones(1,length(n)/2+1)];
[y3_1000,sf2]=filter(b,a,un);
estadofinal=[finalstate;sf1;sf2];
estadofinal
%##Vemos que al hacer n grande el valor de y(n) tiende a 1,7922 y -2.26174
fprintf("El valor Ho de la respuesta al escalon (cuando n tiende a infinito --n=1000--) es %d:\n",y3_1000(end));


%##------------------------------------------------------------------------------
%##Derivada de la respuesta del filtro al escalon

n=-9:1:99;
y3diff=diff(y3);
figure; 
subplot(2,1,1);                  
stem(n,[0,y3diff]);xlabel("n");ylabel("y(n)");
axis([-9 99]);
title("Derivada de la respuesta al escalon del filtro del ejercicio 3");
subplot(2,1,2);
stem(n,y2);xlabel("n");ylabel("y(n)");
axis([-9 99]);
title("Respuesta al impulso del filtro del ejercicio 3");

%##EJERCICIO 4

%##------------------------------------------------------------------------------
%##Respuesta del filtro en frecuencia

df=-2*pi:0.01:2*pi;
df1=-pi:0.01/2:pi;
dt=0:0.01:length(df)/100-0.01;

delta=[1,zeros(1,length(dt)-1)];
h1=filter(b,a,delta);
h1freq=fftshift(fft(h1));
h1freqz=freqz(b,a,dt);

figure;
subplot(3,1,1);
plot(df1,abs(h1freq));xlabel('w');ylabel('│H(w)│');
set (gca, 'xtick', [-2*pi,-pi,0,pi,2*pi]);                      %%Tomamos los valores del eje x        
set (gca, 'xticklabel', {'-2∏','-∏', 0, '∏','2∏'});             %%Les asignamos los textos anteriores a cada valor
subplot(3,1,2);
plot(df1,10*log10(abs(h1freq)));xlabel("w");ylabel("│H(w)│(dB)")
set (gca, 'xtick', [-2*pi,-pi,0,pi,2*pi]);
set (gca, 'xticklabel', {'-2∏','-∏', 0, '∏','2∏'});
subplot(3,1,3);
plot(df1,angle(h1freq));xlabel("w");ylabel("angle H(w)");
set (gca, 'ytick', [-2*pi,-pi,0,pi,2*pi]);
set (gca, 'yticklabel', {'-2∏','-∏', 0, '∏','2∏'});
set (gca, 'xtick', [-2*pi,-pi,0,pi,2*pi]);
set (gca, 'xticklabel', {'-2∏','-∏', 0, '∏','2∏'});
figure;
subplot(2,1,1);
plot(df1,real(h1freq));xlabel("w");ylabel("real H(w)");
set (gca, 'xtick', [-2*pi,-pi,0,pi,2*pi]);
set (gca, 'xticklabel', {'-2∏','-∏', 0, '∏','2∏'});
subplot(2,1,2);
plot(df1,imag(h1freq));xlabel("w");ylabel("imag H(w)");
set (gca, 'xtick', [-2*pi,-pi,0,pi,2*pi]);
set (gca, 'xticklabel', {'-2∏','-∏', 0, '∏','2∏'});

figure;
subplot(3,1,1);
plot(df,abs(h1freqz));xlabel('w');ylabel('│H(w)│');
set (gca, 'xtick', [-2*pi,-pi,0,pi,2*pi]);
set (gca, 'xticklabel', {'-2∏','-∏', 0, '∏','2∏'});
subplot(3,1,2);
plot(df,10*log10(abs(h1freqz)));xlabel("w");ylabel("│H(w)│(dB)")
set (gca, 'xtick', [-2*pi,-pi,0,pi,2*pi]);
set (gca, 'xticklabel', {'-2∏','-∏', 0, '∏','2∏'});
subplot(3,1,3);
plot(df,angle(h1freqz));xlabel("w");ylabel("angle H(w)");
set (gca, 'ytick', [-2*pi,-pi,0,pi,2*pi]);
set (gca, 'yticklabel', {'-2∏','-∏', 0, '∏','2∏'});
set (gca, 'xtick', [-2*pi,-pi,0,pi,2*pi]);
set (gca, 'xticklabel', {'-2∏','-∏', 0, '∏','2∏'});
figure;
subplot(2,1,1);
plot(df,real(h1freqz));xlabel("w");ylabel("real Y(w)");
set (gca, 'xtick', [-2*pi,-pi,0,pi,2*pi]);
set (gca, 'xticklabel', {'-2∏','-∏', 0, '∏','2∏'});
subplot(2,1,2);
plot(df,imag(h1freqz));xlabel("w");ylabel("imag Y(w)");
set (gca, 'xtick', [-2*pi,-pi,0,pi,2*pi]);
set (gca, 'xticklabel', {'-2∏','-∏', 0, '∏','2∏'});

%##EJERCICIO 5

%##------------------------------------------------------------------------------
%##Respuesta en frecuencia mediante muestras de la señal

n=-9:1:99;
un=[zeros(1,9),ones(1,100)];
p = input ("Introduzca el valor de p:");
xn=e.^(j*n*p/3).*un;
figure;
subplot(4,1,1);
stem(n,abs(xn));xlabel("n");ylabel("│x(n)│");title("Modulo de x(n) ejercicio 5")
axis([-9 99]);
subplot(4,1,2);
plot(n,angle(xn));xlabel("n");ylabel("Fase x(n)");title("Fase de x(n) ejercicio 5")
set (gca, 'ytick', [-2*pi,-pi,0,pi,2*pi]);
set (gca, 'yticklabel', {'-2∏','-∏', 0, '∏','2∏'});
axis([-9 99]);
subplot(4,1,3);
stem(n,real(xn));xlabel("n");ylabel("real x(n)");title("Parte real señal x(n) ejercicio 5")
axis([-9 99]);
subplot(4,1,4);
stem(n,imag(xn));xlabel("n");ylabel("imag x(n)");title("Parte imaginaria señal x(n) ejercicio 5")
axis([-9 99]);
 
n=-9:0.01:100;
un=[zeros(1,9),ones(1,length(n)-9)];
xn=e.^(j*n*p/3).*un;
y4=filter(b,a,xn);                                %%Respuesta para una componente en frecuencia
fprintf("El valor de H de la respuesta del sistema (cuando n tiende a infinito --n=100--) es modulo %d y fase %d:\n",abs(y4(end)),angle(y4(end)));


vechn=[];
for w=-650:1:650
  xn=e.^(j*n*w).*un;
  yn=filter(b,a,xn);
  vechn=[vechn yn(end)];
endfor
w=-650:1:650;
figure;
plot(w,abs(vechn));
set (gca, 'xtick', [-2*pi*100,-pi*100,0,pi*100,2*pi*100]);
set (gca, 'xticklabel', {'-2∏','-∏', 0, '∏','2∏'});
4
                      
