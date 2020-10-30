N=input('Numero de lineas de salida:')
conexiones=poissrnd(8,[1502]);
duracion=exprnd(4,[1,1501]);
matriz=[conexiones;duracion];
