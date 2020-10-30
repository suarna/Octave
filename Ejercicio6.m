##Ejercicio 7.30 tratamiento digital de la señal

clear all;

n=0:1:256;         %%Base de tiempos

f1 = 1/18;      %%input ("Introduzca valor de f1:")
f2 = 5/128;     %%input ("Introduzca valor de f2:")
fc = 50/128;    %%input ("Introduzca frecuencia de portadora:")

xn=cos(2*pi*f1*n)+cos(2*pi*f2*n);
xc=cos(2*pi*fc*n);
xam=xn.*xc;

subplot(3,1,1);
plot(n,xn);
subplot(3,1,2);
plot(n,xc);
subplot(3,1,3);
plot(n,xam);

##Calculo de DFT de 128 puntos con 0<=n<=127

n=0:1:127;          
k=0:1:127;


n=[n zeros(1,length(k)-length(n))];  %%Rellenamos con ceros hasta dimension de k

dft=[];
for i=0:1:length(k)-1             %%Recorremos vector k
  vec=[];
  for l=0:1:length(n)-1;          %%Recorremos vector n
  value=(cos(2*pi*f1*l)+cos(2*pi*f2*l)).*cos(2*pi*fc*l)*e^-(j*2*pi*i*l/length(k));
  vec = [vec value];
  endfor
dft =[dft sum(vec)];  
endfor
figure;
subplot(3,1,1);
stem(k,dft);
title('DFT apartado b');

##Calculo de DFT de 128 puntos con 0<=n<=99

n=0:1:99;          
k=0:1:127;
n=[n zeros(1,length(k)-length(n))];  %%Rellenamos con ceros hasta dimension de k

dft=[];
for i=0:1:length(k)-1             %%Recorremos vector k
  vec=[];
  for l=0:1:length(n)-1;          %%Recorremos vector n
  value=(cos(2*pi*f1*l)+cos(2*pi*f2*l)).*cos(2*pi*fc*l)*e^-(j*2*pi*i*l/length(k));
  vec = [vec value];
  endfor
dft =[dft sum(vec)];  
endfor
subplot(3,1,2);
stem(k,dft);
title('DFT apartado c');

##Calculo de DFT de 256 puntos con 0<=n<=179

n=0:1:179;          
k=0:1:255;
n=[n zeros(1,length(k)-length(n))];  %%Rellenamos con ceros hasta dimension de k

dft=[];
for i=0:1:length(k)-1             %%Recorremos vector k
  vec=[];
  for l=0:1:length(n)-1;          %%Recorremos vector n
  value=(cos(2*pi*f1*l)+cos(2*pi*f2*l)).*cos(2*pi*fc*l)*e^-(j*2*pi*i*l/length(k));
  vec = [vec value];
  endfor
dft =[dft sum(vec)];  
endfor
subplot(3,1,3);
stem(k,dft);
title('DFT apartado d');







