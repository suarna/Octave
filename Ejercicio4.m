##Ejercicio 6.10 tratamiento digital de la señal
##Calculadora de frecuencia de muestreo
clear all

Fh= input ("Introduzca valor de la frecuencia máxima:");
B= input ("Introduzca ancho de banda de la señal:");
n= fix (Fh/B);
B2=Fh/n;
Fs=2*B2;
fprintf("La frecuencia de muestreo es:%d Hz\n ", Fs);
