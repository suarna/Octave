##Ejercicio 1.16 tratamiento digital de la señal

pkg load communications;
pkg load specfun;
clear all

n=0:1:200-1;       %%Base de tiempos señal de entrada
Fo = 1/50;         %%Frecuencia de la señal de entrada
To=1/Fo;           %%Periodo de la señal de entrada
N=200;             %%Numero de puntos de la señal muestreada

xn=sin(2*pi*Fo*n);
plot(n,xn);
title("Señal de entrada");

%%Cuantificación con 64 niveles con redondeo

delta= 1/63;          %%Valor de incremento de cuantificacion
deltavecpositiva=[];
for i=1:1:63
  deltaval=i*delta;
  deltavecpositiva=[deltavecpositiva deltaval];
endfor
deltavecnegativa=-deltavecpositiva;
deltavec=[deltavecpositiva deltavecnegativa];

xq64r=[];
for i=1:1:length(xn)
  [p,idx] = min(abs(deltavec-xn(i)));
  xq64r=[xq64r deltavec(idx)];
endfor
figure
subplot(2,1,1);        
stairs (n,xq64r);
title("Cuantificacion 64 niveles por redondeo");     
subplot(2,1,2);
plot (n,xq64r-xn);
title("Señal de error de cuantificacion");  


[sqnr] = calsqnr(xn,xq64r,N);     %%Llamada a funcion para calcular sqnr
disp("SQNR 64 niveles con redondeo:");disp(sqnr);

%%Cuantificación con 128 niveles con redondeo

delta= 1/127;          %%Valor de incremento de cuantificacion
deltavecpositiva=[];
for i=1:1:127
  deltaval=i*delta;
  deltavecpositiva=[deltavecpositiva deltaval];
endfor
deltavecnegativa=-deltavecpositiva;
deltavec=[deltavecpositiva deltavecnegativa];

xq128r=[];
for i=1:1:length(xn)
  [p,idx] = min(abs(deltavec-xn(i)));
  xq128r=[xq128r deltavec(idx)];
endfor
figure
subplot(2,1,1);        
stairs (n,xq128r);
title("Cuantificacion 128 niveles por redondeo");     
subplot(2,1,2);
plot (n,xq128r-xn);
title("Señal de error de cuantificacion");  


[sqnr] = calsqnr(xn,xq128r,N);     %%Llamada a funcion para calcular sqnr
disp("SQNR de 128 niveles con redondeo:");disp(sqnr);

%%Cuantificación con 256 niveles con redondeo

delta= 1/255;          %%Valor de incremento de cuantificacion
deltavecpositiva=[];
for i=1:1:255
  deltaval=i*delta;
  deltavecpositiva=[deltavecpositiva deltaval];
endfor
deltavecnegativa=-deltavecpositiva;
deltavec=[deltavecpositiva deltavecnegativa];

xq256r=[];
for i=1:1:length(xn)
  [p,idx] = min(abs(deltavec-xn(i)));
  xq256r=[xq256r deltavec(idx)];
endfor
figure
subplot(2,1,1);        
stairs (n,xq256r);
title("Cuantificacion 256 niveles por redondeo");     
subplot(2,1,2);
plot (n,xq256r-xn);
title("Señal de error de cuantificacion");  


[sqnr] = calsqnr(xn,xq256r,N);     %%Llamada a funcion para calcular sqnr
disp("SQNR de 256 niveles con redondeo:");disp(sqnr);


%%Cuantificacion con 64 niveles con truncamiento


delta= 1/63;          %%Valor de incremento de cuantificacion
deltavecpositiva=[];
for i=1:1:63
  deltaval=i*delta;
  deltavecpositiva=[deltavecpositiva deltaval];
endfor
deltavecnegativa=-deltavecpositiva;
deltavec=[deltavecpositiva deltavecnegativa];

xq64t=[];
for i=1:1:length(xn)
  [p,idx] = min(abs(deltavec-xn(i)));
  if deltavec(idx)>xn(i)&&deltavec(idx)>=0&&idx>1         %%Si el valor del redondeo es un numero mayor trunca al anterior
  xq64t=[xq64t deltavec(idx-1)];
  elseif deltavec(idx)>xn(i)&&deltavec(idx)<0                              
  xq64t=[xq64t deltavec(idx+1)];
  else
  xq64t=[xq64t deltavec(idx)];
  endif
endfor
figure
subplot(2,1,1);        
stairs (n,xq64t);
title("Cuantificacion 64 niveles por truncamiento");     
subplot(2,1,2);
plot (n,xq64t-xn);
title("Señal de error de cuantificacion");
[sqnr] = calsqnr(xn,xq64t,N);
disp("SQNR de 64 niveles con truncamiento:");disp(sqnr);

%%Cuantificacion con 128 niveles con truncamiento


delta= 1/127;          %%Valor de incremento de cuantificacion
deltavecpositiva=[];
for i=1:1:127
  deltaval=i*delta;
  deltavecpositiva=[deltavecpositiva deltaval];
endfor
deltavecnegativa=-deltavecpositiva;
deltavec=[deltavecpositiva deltavecnegativa];

xq128t=[];
for i=1:1:length(xn)
  [p,idx] = min(abs(deltavec-xn(i)));
  if deltavec(idx)>xn(i)&&deltavec(idx)>=0&&idx>1         %%Si el valor del redondeo es un numero mayor trunca al anterior
  xq128t=[xq128t deltavec(idx-1)];
  elseif deltavec(idx)>xn(i)&&deltavec(idx)<0                              
  xq128t=[xq128t deltavec(idx+1)];
  else
  xq128t=[xq128t deltavec(idx)];
  endif
endfor
figure
subplot(2,1,1);        
stairs (n,xq128t);
title("Cuantificacion 128 niveles por truncamiento");     
subplot(2,1,2);
plot (n,xq128t-xn);
title("Señal de error de cuantificacion");
[sqnr] = calsqnr(xn,xq128t,N);
disp("SQNR de 128 niveles con truncamiento:");disp(sqnr);

%%Cuantificacion con 256 niveles con truncamiento


delta= 1/255;          %%Valor de incremento de cuantificacion
deltavecpositiva=[];
for i=1:1:255
  deltaval=i*delta;
  deltavecpositiva=[deltavecpositiva deltaval];
endfor
deltavecnegativa=-deltavecpositiva;
deltavec=[deltavecpositiva deltavecnegativa];

xq256t=[];
for i=1:1:length(xn)
  [p,idx] = min(abs(deltavec-xn(i)));
  if deltavec(idx)>xn(i)&&deltavec(idx)>=0&&idx>1         %%Si el valor del redondeo es un numero mayor trunca al anterior
  xq256t=[xq256t deltavec(idx-1)];
  elseif deltavec(idx)>xn(i)&&deltavec(idx)<0                              
  xq256t=[xq256t deltavec(idx+1)];
  else
  xq256t=[xq256t deltavec(idx)];
  endif
endfor
figure
subplot(2,1,1);        
stairs (n,xq256t);
title("Cuantificacion 256 niveles por truncamiento");     
subplot(2,1,2);
plot (n,xq256t-xn);
title("Señal de error de cuantificacion");
[sqnr] = calsqnr(xn,xq256t,N);
disp("SQNR de 256 niveles con truncamiento:");disp(sqnr);