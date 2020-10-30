##Ejercicio 2.39 tratamiento digital de la señal
##Al realizar la convolucion esta se hace sobre funciones finitas,limitadas por
##la longitud del vector,al contrario que en la resolucion teorica donde se
##trabaja con señales infinitas. 
##SE NECESITA PAQUETE SPECFUN PARA FUNCION HEAVISIDE

pkg load specfun;
clear all;

Ts=1
n=0:Ts:100-Ts;    %%Base de tiempos

a = input ("Introduzca el valor de a:");
hn=a.^n;
xn=heaviside(1)-[zeros(1,9) ones(1,length(n)-9)];
yn=conv(hn,xn);
figure
subplot(3,1,1);  
plot(n,hn);
title("Respuesta del sistema h(n)");
subplot(3,1,2);  
stairs(n,xn);axis ([0 100 -0.5 2]);
title("Señal x(n)");
subplot(3,1,3);
nconv=0:1:length(yn)-1;
plot(nconv,yn);
title("Señal de salida x(n)-Convolucion");
