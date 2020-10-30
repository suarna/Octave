##Ejercicio 6.12 tratamiento digital de la señal


#Apartado a

n=-100:1:100-1;         %%Base de tiempos
df=-100:1:100-1;        %%Base de frecuencias
B = input ("Introduzca ancho de banda de la señal(entre 1 y 10):");

xaf=[zeros(1,length(df)/2-B) ones(1,2*B) zeros(1,length(df)/2-B)];
xat = fftshift(ifft(xaf));
##El producto en el tiempo es la convolucion en frecuencia
xacf=conv(xaf,xaf);    %%Convolucion de xaf consigo misma 

subplot(3,1,1);
stairs(df,xaf);
title('espectro señal');xlabel('f');ylabel('|X(f)|');
axis([-15 15 -0.5 1.5]);
subplot(3,1,2);
plot(n,xat);
title('señal dominio temporal');xlabel('n');ylabel('x(n)');
subplot(3,1,3);
nconv=-length(xacf)/2:1:length(xacf)/2-1;
plot(nconv,xacf);
axis([-50 50 0 40]);
x2 = fftshift(fft(xacf));
figure;
plot(nconv,abs(x2));
title('Señal de salida y1');xlabel('t');ylabel('y1(t)');

##Apartado b

Fs=50;
t=-1:0.001:1-0.001;
xat=cos(2*pi*20.*t);
xan=cos(2*pi*(20/50).*n);
xan2=(cos(2*pi*(20/50).*n)).^2;
y1=(cos(2*pi*(20/50)*50*t)).^2;

subplot(4,1,1);
plot(t,xat);
title('Señal xt apartado b');xlabel('t');ylabel('x(t)');
subplot(4,1,2);
stem(n,xan);
title('Señal xn apartado b');xlabel('n');ylabel('x(n)');
subplot(4,1,3);
stem(n,xan2);
title('Señal xn^2 apartado b');xlabel('n');ylabel('x^2(n)');
subplot(4,1,4);
plot(t,y1);
title('Señal y1 apartado b');xlabel('t');ylabel('y1(t)');

xat=cos(2*pi*20.*t);
xat2=(cos(2*pi*20.*t)).^2;
xan2=(cos(2*pi*(20/50).*n)).^2;
y2=(cos(2*pi*(20/50)*50.*n)).^2;

figure;
subplot(4,1,1);
plot(t,xat);
title('Señal xt apartado b');xlabel('t');ylabel('x(t)');
subplot(4,1,2);
plot(t,xat2);
title('Señal xt^2 apartado b');xlabel('t');ylabel('x^2(t)');
subplot(4,1,3);
stem(n,xan2);
title('Señal xn^2 apartado b');xlabel('n');ylabel('x^2(n)');
subplot(4,1,4);


plot(t,y1);
title('Señal y2 apartado b');xlabel('t');ylabel('y(2t)');
