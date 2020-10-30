##Ejercicio 4.7 tratamiento digital de la señal

clear all;

N=8;
n=0:1:100;

##DEFINIMOS LAS SEÑALES A PARTIR DE SUS COEFICIENTES

%%Señal apartado a

xna=[];
for i=0:1:100
  vec=[];
  for k=0:1:N-1
    value=(cos(pi*k/3)+sin(3*pi*k/4))*e^(j*2*pi*k*i/N);
    vec = [vec value];
  endfor
xna = [xna sum(vec)];
endfor
figure;
subplot(2,1,1);
stem(n,xna);
subplot(2,1,2);
plot(n,angle(xna));

%%Señal apartado b

n=0:1:100;
xnb=[];
for i=0:1:100
  vec=[];
  for k=0:1:N-2
    value=(sin(pi*k/3))*e^(j*2*pi*k*i/N);
    vec = [vec value];
  endfor
  vec = [vec 7];
xnb = [xnb sum(vec)];
endfor
figure;
subplot(2,1,1);
stem(n,abs(xnb));
subplot(2,1,2);
plot(n,angle(xnb));

%%Señal apartado c

xnc=[];
ck=[1/4,1/2,1,2,1,1/2,1/4];
for i=0:1:100
  idx=1;
  vec=[];
  for k=-3:1:3
    value=ck(idx)*e^(j*2*pi*k*i/N);
    vec = [vec value];
    idx=idx+1;
  endfor 
xnc=[xnc sum(vec)];
endfor
figure;
subplot(2,1,1);
stem(n,xnc);
subplot(2,1,2);
plot(n,angle(xnc));


