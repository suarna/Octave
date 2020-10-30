##Ejercicio 8.4 tratamiento digital de la señal

##Estrategia divide y venceras

clear all;

n=0:1:23;
xn = input('Introduzca señal para realizar FFT de 24 con estrategia divide y venceras (Ej: cos(3*pi/2*n)):');

fila1=[];
valor=0;

for i=0:1:length(xn)
   if i==0;
   valor = xn(1);
   fila1=[fila1 valor];
   elseif 3*i<24
   valor = xn(3*i);
   fila1=[fila1 valor];
   else 
   endif
endfor


fila2=[];
i=0;
valor=0;

for i=0:1:length(xn)
   if (3*i+1)<24
   valor = xn(3*i+1);
   fila2=[fila2 valor];
   else
   endif
endfor


fila3=[];
i=0;
valor=0;
for i=0:1:length(xn)
   if (3*i+2)<24
   valor = xn(3*i+2);
   fila3=[fila3 valor];
   else
   endif
endfor

disp('Matriz divide y venceras:');
matriz=[fila1;fila2;fila3]

##DFT de la fila 1

vec=[];
value=0;
dft1=[];
for k=0:1:length(n)
  for i=1:1:8
    value=matriz(1,i).*e^-((j*2*pi*i*k)/(length(n)/3));
    vec=[vec value];
  endfor
dft1=[dft1 sum(vec)];  
endfor

##DFT de la fila 2

vec=[];
value=0;
dft2=[];
for k=0:1:length(n)
  for i=1:1:8
    value=matriz(2,i).*e^-((j*2*pi*i*k)/(length(n)/3)).*e^-((j*2*pi*k)/length(n));
    vec=[vec value];
  endfor
dft2=[dft2 sum(vec)];  
endfor

##DFT de la fila 3

vec=[];
value=0;
dft3=[];
for k=0:1:length(n)
  for i=1:1:8
    value=matriz(3,i).*e^-((j*2*pi*i*k)/(length(n)/3)).*e^-((j*4*pi*k)/length(n));
    vec=[vec value];
  endfor
dft3=[dft3 sum(vec)];  
endfor

fft=dft1+dft2+dft3;
stem([0:1:24],fft);

