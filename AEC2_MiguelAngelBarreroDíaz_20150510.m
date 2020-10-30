%%GRÁFICA EJERCICIO 1 , APARTADO A
clear all                                       %%Vaciado variables
t=[-15:0.01:15];                                %%Base de tiempos
x1=exp(j*5*pi*t/3)+exp(j*3*pi*t/2);             %%Señal
real=cos(5*pi*t/3)+cos(3*pi*t/2);               %%Parte real
imaginaria=sin(5*pi*t/3)+sin(3*pi*t/2);         %%Parte imaginaria
modulo=abs(x1);                                 %%Módulo
fase=angle(x1);                                 %%Ángulo de fase
subplot(2,2,1);
plot(t,modulo);                                                 %%Gráfica módulo
axis([-15,15,-3,3]);                                            
xlabel('Tiempo(s)');ylabel('Amplitud');title('módulo');
subplot(2,2,2);
plot(t,fase);                                                   %%Gráfica fase
xlabel('Tiempo(s)');ylabel('Amplitud');title('fase');
subplot(2,2,3);
plot(t,real);                                                   %%Gráfica parte real
xlabel('Tiempo(s)');ylabel('Amplitud');title('parte real');
subplot(2,2,4);                                                 %%Gráfica parte imaginaria
plot(t,imaginaria);
xlabel('Tiempo(s)');ylabel('Amplitud');title('parte imaginaria');

c=0;
c=input ('Pulse  tecla enter para continuar:');         %%Interrupción
clear all                                               %%Vaciado variables

%%GRÁFICA EJERCICIO 1 , APARTADO B
figure                                  %%Nueva gráfica
t=[-50:0.01:50];                        %%Base de tiempos
x2=sin(j*5*pi*t/3)+cos(j*3*pi*t/2);     %%Señal
plot (t,x2);
xlabel('Tiempo(s)');ylabel('Amplitud');title('x2');

c=0;
c=input ('Pulse  tecla enter para continuar:');         %%Interrupción
clear all                                               %%Vaciado variables

%%GRÁFICA EJERCICIO 1 , APARTADO C
figure                                          %%Nueva gráfica
t=[-5:0.01:5];                                  %%Base de tiempos
x3=(cos(3*t)).^2;                               %%Señal
plot (t,x3);                                    %%Gráfica
axis ([-5,5,-0.5,1.5]);                         %%Límites a mostrar en la gráfica
xlabel('Tiempo(s)');ylabel('Amplitud');title('x3');

c=0;
c=input ('Pulse  tecla enter para continuar:');         %%Interrupción
clear all                                               %%Vaciado variables

%%GRÁFICA EJERCICIO 1 , APARTADO D
figure                                                                  %%Nueva gráfica
Entrada=input ('Introduzca valor del periodo,valor entre 0 y 10:');     %%Entrada de dato para periodo por teclado
Period=Entrada/2;                                                       %%Adaptar dato entrada
t=[-20:0.01:20];                                                        %%Base de tiempos
n=[-20:0.01:20];                                                        %%Base de tiempos corrimiento de señal
x5=((1)*(-1).^floor(n/(Period))+1)./2;                                  %%Señal
plot ((t-(Period/2)),x5);                                               %%Gráfica con t desplazado a la derecha T/4
axis([-10,10,0,1.5]);                                                   %%Límites a mostrar
xlabel('Tiempo(s)');ylabel('Amplitud');title('x4');

c=0;
c=input ('Pulse  tecla enter para continuar:');         %%Interrupción
clear all                                               %%Vaciado variables

%%GRÁFICA EJERCICIO 2,APARTADO A
figure
t=[-10:1:10];                                           %%Base de tiempos
w=[-10:0.1:10];
u=[ones(1,10),zeros(1,11)];                             %%Vector auxiliar de unos y ceros
ui=[zeros(1,10),ones(1,11)];                            %%Vector auxiliar de unos y ceros
x1=u-ui;                                                %%Señal resultante a partir de las matrices auxiliares
trans=exp(-j*w)./(1-exp(j*w))-1./(1-exp(-j*w));        %%Señal transformada
subplot(2,3,2)
stem(t,x1)                                              %%Gráfica de señal
xlabel('t');ylabel('Amplitud');title('x1');
subplot(2,2,3)
plot(w,abs(trans))
xlabel('w');ylabel('Amplitud');title('Modulo X1');
subplot(2,2,4)
plot(w,angle(trans))
xlabel('w');ylabel('Amplitud');title('Fase X1');

c=0;
c=input ('Pulse  tecla enter para continuar:');         %%Interrupción
clear all                                               %%Vaciado variables

%%GRÁFICA EJERCICIO 2,APARTADO B
figure
t0=[-10:0.001:10];                                      %%Base de tiempos señal original
t=[-100:1:100];                                         %%Base de tiempos para pulso cuadrado
t1=[-100:1:100];                                        %%Base de tiempos para señal de deltas
a=input ('Introduzca valor de a entre 1 y 100:');       %%Entrada por teclado de valor de a 
w0=input ('Introduzca valor de w entre 1 y 100:');      %%Entrada por teclado de w
w1=w0+1;                                                %%Desplazamineto de w 1 unidad para generar el impulso unitario
x2=(sin(a*t0).*cos(w0*t0))./(pi*t0);                    %%Señal original
u=[zeros(1,100-a),ones(1,101+a)];                       %%Vector de unos y ceros para pulso cuadrado
ui=[zeros(1,100+a),ones(1,101-a)];                      %%Vector de unos y ceros para pulso cuadrado
x=(u-ui)/(2*pi);                                        %%Pulso cuasdrado de -a hasta a multiplcado por 1/2pi
v=[ones(1,100-w0),zeros(1,101+w0)];                     %%Vector de unos y ceros para impulso
vi=[ones(1,100-w1),zeros(1,101+w1)];                    %%Vector de unos y ceros para impulso
v2=[ones(1,100+w0),zeros(1,101-w0)];                    %%Vector de unos y ceros para impulso
vi2=[ones(1,100+w1),zeros(1,101-w1)];                   %%Vector de unos y ceros para impulso
delta1=pi*(v-vi);                                       %%Primer impulso
delta2=pi*(vi2-v2);                                     %%Segundo impulso
y=delta1+delta2;                                        %%Suma de ambos impulsos
convolucion=conv(x,y);                                  %%Convolución de ambas señales
tco=[-200:1:200];                                       %%Base de tiempos para la convolución
subplot(2,3,2);
plot(t0,x2)                                               %%Gráfica señal original
xlabel('t');ylabel('Amplitud');title('x2');
axis ([-5,5,-3,3]);
subplot(2,3,4);
plot(t,x)                                               %%Gráfica pulso
xlabel('w');ylabel('Amplitud');title('(1/2pi)X(jw)');
axis ([-100,100,-0.1,0.3]);
subplot(2,3,5);
stem(t1,y)                                              %%Gráfica señal de deltas
xlabel('w');ylabel('Amplitud');title('Y(jw)');
axis ([-100,100,-0.5,4]);
subplot(2,3,6);
plot(tco,convolucion);                                  %%Gráfica de la convolución
axis ([-201,201,-0.5,2]);
xlabel('w');ylabel('Amplitud');title('convolución');

c=0;
c=input ('Pulse  tecla enter para continuar:');         %%Interrupción
clear all                                               %%Vaciado variables

%%GRÁFICA EJERCICIO 2,APARTADO C
figure                                                                 %%Nueva grafica
t=[-100:0.01:100];                                                     %%Base de tiempos
w=[-100:0.01:100];
a=input ('Introduzca valor de a entre 1 y 100:');                      %%Entrada por teclado de valor de a
x3=exp(-a*abs(t));                                                     %%Señal
xjw=(1./(a-(j*w)))+(1./(a+(j*w)));                                           %%Señal transformada
Modxjw=abs(xjw);                                                       %%Modulo transformada
Anglexjw=angle(xjw);                                                   %%Fase transformada
subplot (2,2,1)
plot(t,x3)                                                             %%Grafica señal original
xlabel('t');ylabel('Amplitud');title('x3');
subplot (2,2,2)
plot(t,xjw)                                                            %%Grafica transformada
xlabel('w');ylabel('Amplitud');title('X3(jw)');
subplot (2,2,3)
plot(t,Modxjw)                                                         %%Grafica modulo transformada
xlabel('w');ylabel('Amplitud');title('Modulo X3(jw)');  
subplot (2,2,4)
plot(t,Anglexjw)                                                       %%Grafica fase transformada
xlabel('w');ylabel('Amplitud');title('Fase X3(jw)');

c=0;
c=input ('Pulse  tecla enter para continuar:');         %%Interrupción
clear all                                               %%Vaciado variables

%%GRÁFICA EJERCICIO 2,APARTADO D
t=[-10:0.01:10];                                                       %%Base de tiempos
w=[-10:0.01:10];
u=[zeros(1,1000),ones(1,1001)];                                        %%Vector de unos y ceros para pulso cuadrado
ui=[zeros(1,1200),ones(1,801)];                                        %%Vector de unos y ceros para pulso cuadrado
ut=u-ui;                                                               %%Pulso cuadrado 
x4=(1-abs(t-1)).*ut;                                                   %%Señal
trans=exp(-j.*w).*sinc(w./2).^2;                                       %%Transformada
subplot(2,1,1)
plot(t,x4)
xlabel('t');ylabel('Amplitud');title('x3');
subplot(2,1,2)
plot(w,trans)
xlabel('w');ylabel('Amplitud');title('Transformada');

c=0;
c=input ('Pulse  tecla enter para continuar:');         %%Interrupción
clear all                                               %%Vaciado variables

%%GRÁFICA EJERCICIO 3,APARTADO A
figure
n=[-100:1:100];                                                         %%Base de tiempos
W=input ('Introduzca valor de W entre 0 y pi:');                        %%Entrada por teclado de valor de W
x1=(sin(W.*n))/(pi.*n);
stem(n,x1);
xlabel('n');ylabel('Amplitud');title('x1');

c=0;
c=input ('Pulse  tecla enter para continuar:');         %%Interrupción
clear all                                               %%Vaciado variables

%%GRÁFICA EJERCICIO 3,APARTADO B
figure                                                                  %%Nueva grafica
t=[-10:0.01:10];                                                        %%Base de tiempos
w=[-10:0.01:10];
u=[zeros(1,1000),ones(1,1001)];                                         %%Vector de unos y ceros para pulso cuadrado
ui=[zeros(1,1200),ones(1,801)];                                         %%Vector de unos y ceros para pulso cuadrado
ut=u-ui;                                                                %%Pulso cuadrado 
x2=(1-abs(t-1)).*ut;                                                    %%Señal
trans=exp(-j.*w).*sinc(w./2).^2;                                        %%Transformada
subplot(2,1,1)
plot(t,x2)
xlabel('t');ylabel('Amplitud');title('x2');
subplot(2,1,2)
plot(w,trans)
xlabel('w');ylabel('Amplitud');title('Transformada');

c=0;
c=input ('Pulse  tecla enter para continuar:');         %%Interrupción
clear all                                               %%Vaciado variables

%%GRÁFICA EJERCICIO 3,APARTADO C
figure                                                                  %%Nueva grafica
t=[-10:0.01:10];                                                        %%Base de tiempos
w=[-10:0.01:10];                                                        %%Base tiempos frecuencia
a=input ('Introduzca valor de a entre 1 y 100:');                       %%Entrada por teclado de valor de a
ut=[zeros(1,1000),ones(1,1001)];                                        %%escalón unitario
x3=t.*exp(-a*t).*ut;                                                    %%Señal 
trans=1./((a+j*w).^2);                                                   %%Transformada
subplot(2,1,1)
plot(t,x3)
xlabel('t');ylabel('Amplitud');title('x3');
subplot(2,1,2)
plot(w,trans)
xlabel('w');ylabel('Amplitud');title('X3(jw)');

c=0;
c=input ('Pulse  tecla enter para continuar:');         %%Interrupción
clear all                                               %%Vaciado variables

%%GRÁFICA EJERCICIO 3,APARTADO D
figure                                                                  %%Nueva grafica
t=[-10:0.01:10];                                                        %%Base de tiempos
w=[-10:0.01:10];                                                        %%Base tiempos frecuencia
a=input ('Introduzca valor de a entre 1 y 100:');                       %%Entrada por teclado de valor de a
w0=input ('Introduzca valor de w0:');                                   %%Entrada por teclado de valor de w
ut=[zeros(1,1000),ones(1,1001)];                                        %%escalón unitario
x4=t.*((exp(j*w0-a)*t)+exp((j*w0+a)*t)).*ut;                            %%Señal
trans=(1./((a+j*w+j*w0).^2))+(1./((a+j*w-j*w0).^2));                    %%Transformada
subplot(2,1,1)
plot(t,x4)
xlabel('t');ylabel('Amplitud');title('x4');
subplot(2,1,2)
plot(w,trans)
xlabel('w');ylabel('Amplitud');title('X4(jw)');

c=0;
c=input ('Pulse  tecla enter para continuar:');         %%Interrupción
clear all                                               %%Vaciado variables

%%FFT

t=[-10:0.1:10];
u=[ones(1,10),zeros(1,11)];                             %%Vector auxiliar de unos y ceros
ui=[zeros(1,10),ones(1,11)];                            %%Vector auxiliar de unos y ceros
x1=u-ui;                                                %%Señal resultante a partir de las matrices auxiliares
ft1=fft(x1);
disp ('fft x1:'),disp (ft1);

t=[-10:0.1:10];                                       %%Base de tiempos señal original
a=input ('Introduzca valor de a entre 1 y 100:');       %%Entrada por teclado de valor de a 
w0=input ('Introduzca valor de w entre 1 y 100:');      %%Entrada por teclado de w
w1=w0+1;                                                %%Desplazamineto de w 1 unidad para generar el impulso unitario
x2=(sin(a*t).*cos(w0*t))./(pi*t);                       %%Señal original
ft2=fft(x2);
disp ('fft x2:'),disp (ft2);

t=[-100:0.1:100];                                                     %%Base de tiempos
a=input ('Introduzca valor de a entre 1 y 100:');                      %%Entrada por teclado de valor de a
x3=exp(-a*abs(t));
ft3=fft(x3);
disp ('fft x3:'),disp (ft3);

t=[-10:0.1:10];                                                       %%Base de tiempos
u=[zeros(1,100),ones(1,101)];                                        %%Vector de unos y ceros para pulso cuadrado
ui=[zeros(1,120),ones(1,81)];                                        %%Vector de unos y ceros para pulso cuadrado
ut=u-ui;                                                               %%Pulso cuadrado 
x4=(1-abs(t-1)).*ut;                                                   %%Señal
ft4=fft(x4);
disp ('fft x4:'),disp (ft4);

%%IFFT

n=[-100:1:100];                                                         %%Base de tiempos
W=input ('Introduzca valor de W entre 0 y pi:');                        %%Entrada por teclado de valor de W
x1=(sin(W.*n))/(pi.*n);
ift1=ifft(x1);
disp ('ifft x4:'),disp (ift1);

t=[-10:0.01:10];                                                        %%Base de tiempos
u=[zeros(1,1000),ones(1,1001)];                                         %%Vector de unos y ceros para pulso cuadrado
ui=[zeros(1,1200),ones(1,801)];                                         %%Vector de unos y ceros para pulso cuadrado
ut=u-ui;                                                                %%Pulso cuadrado 
x2=(1-abs(t-1)).*ut;                                                    %%Señal
ift2=ifft(x2);
disp ('ifft x2:'),disp (ift2);

t=[-10:0.01:10];                                                        %%Base de tiempos
a=input ('Introduzca valor de a entre 1 y 100:');                       %%Entrada por teclado de valor de a
ut=[zeros(1,1000),ones(1,1001)];                                        %%escalón unitario
x3=t.*exp(-a*t).*ut;  
ift3=ifft(x3);
disp ('ifft x3:'),disp (ift3);

t=[-10:0.1:10];                                                       %%Base de tiempos
u=[zeros(1,100),ones(1,101)];                                        %%Vector de unos y ceros para pulso cuadrado
ui=[zeros(1,120),ones(1,81)];                                        %%Vector de unos y ceros para pulso cuadrado
ut=u-ui;                                                               %%Pulso cuadrado 
x4=(1-abs(t-1)).*ut;                                                   %%Señal
ift4=ifft(x4);
disp ('ifft x4:'),disp (ift4);
