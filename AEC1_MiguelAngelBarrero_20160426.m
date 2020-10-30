N=input('Numero de lineas de salida:')
lambda=input('Media lambda para distribucion de Poisson de las conexiones al nodo:')
media=input('Duracion media de las llamadas que llegan al nodo por unidad de tiempo:')
salidasnodo=N.*ones(1,1550);                    %%Matriz de salidas 
conexiones=poissrnd(lambda,[1,1501]);                %%Vector aleatorio segun distribución de Poisson
duracion=ceil(exprnd(media,[1,1501]));              %%Vector aleatorio segun distribución exponencial,redondeado hacia arriba para trabajar con enteros de la duración de la llamada en minutos
matriz=[conexiones;duracion];                   %%Matriz que almacena ambos valores en paralelo
stot=zeros(1,1550);                             %%Debemos incrementar suficientemente el vector para evitar fallos de longitud del mismo
for i=1:length(matriz)
  cinst=matriz(1,i);                                                    %%Valor de número de conexiones instantáneas
  tinst=matriz(2,i);                                                    %%Valor de duración instantánea de llamada
  if i==1,
    sinst=cinst*[ones(1,tinst) zeros(1,1550-tinst)];
  else
    sinst=cinst*[zeros(1,i) ones(1,tinst) zeros(1,1550-i-tinst)];               %%Vector de conexiones instantáneas
  end
  stot=stot+sinst;                                                              %%Vector de conexiones totales
end 
vectortratadas=salidasnodo-stot;                %%Vector de salidas tratadas,si es negativo supera capacidad,si es positivo sobran salidas,si es cero salidas justas
descartadas=0;
aceptadas=0;
for i=1:length(vectortratadas),                 %%Recorremos el vectortratadas 
  tratinst=vectortratadas(1,i);                 %%Cantidad de tratados o descartados instantáneos
  if tratinst<0                                 %%Si es negativo lo suma a las conexiones descartadas
    descartadas=descartadas+abs(tratinst);        
  elseif 0<=tratinst<N 
    aceptadas=aceptadas+tratinst;               %%Si es positivo lo suma a las conexiones tratadas satisfactoriamente
  else tratinst==N                              %%Para no sumar,pues es el exceso de valores sobrantes causados por el sobredimensionamiento del vector 
  end
end
vectorgos=zeros(1,1550);
vectorgosinst=zeros(1,1550); 
for i=1:length(vectortratadas)                             %%Bucle cálculo de Gos instantáneo
    tratinst=vectortratadas(1,i);                        %%Valores instantáneos del vector de conexiones tratadas y descartadas
    vectorgos=vectorgos+vectorgosinst;                          %%Vector de Gos total instantáneo
    if i==1                                                     %%Condición para evitar que sea siempre cero el primer elemento del vector
      if tratinst<0
        descartadasinst=abs(tratinst);
        gosinst=descartadasinst/(descartadasinst+N);                                                %%Se dividen las conexiones descartadas entre la capacidad de salidas del nodo pues es el valor máximo de tratadas cuando se pierden llamadas      
        vectorgosinst=gosinst*[ones(1,1) zeros(1,1550-1)];                        %%Vector gos instantáneo cuando hay pérdidas
      else 
        gosinst=0;                                                                %%Cuando no se descartan llamadas el Gos será 0 
        vectorgosinst=zeros(1,1550);
      end
    else
      if tratinst<0
        descartadasinst=abs(tratinst);
        gosinst=descartadasinst/(descartadasinst+N);                                                %%Se dividen las conexiones descartadas entre la capacidad de salidas del nodo pues es el valor máximo de tratadas cuando se pierden llamadas      
        vectorgosinst=gosinst*[zeros(1,i) ones(1,1) zeros(1,1550-i-1)];           %%Vector gos instantáneo cuando hay pérdidas
      else 
        gosinst=0;                                                                %%Cuando no se descartan llamadas el Gos será 0 
        vectorgosinst=zeros(1,1550);                                              %%Vector gos instantáneo cuando no hay pérdidas
      end
    end  
 end 
gosmedio=100*descartadas/(aceptadas+descartadas);                 %%Gos medio del nodo
t=[1:1550];
figure
plot(t,100.*vectorgos);
axis([0,1500,0,100]);
xlabel('Tiempo'),ylabel('Gos Instantáneo en %');
legend('N=100,lambda=10,media=4');
gosmedio

