pkg load communications
clear all

Mensaje = fopen ("fichero.txt","r");      %Abrimos el fichero de texto
Scan = fscanf (Mensaje,"%c");             %Escaneamos contenido del mismo
fclose(Mensaje);                          %Cerramos fichero
Asciil = toascii (Scan);                  %Convertimos el fichero a codigo Asciil
Binario = dec2bin (Asciil);               %Convertimos de Asciil a binario en variable de tipo string,cada fila es una letra

Contaje = zeros(size(Asciil));            %Generamos un vector de zeros del tamaño de Asciil

  for i = 1:length(Asciil)                %Hacemos un bucle para contar el numero de elementos que hay en el vector Asciil
    Contaje(i) = sum(Asciil==Asciil(i));  %%Cuando coincide la posicion suma la posicion al vector asciil y lo guarda en Contaje
  end
 
Elementos = [Contaje;Asciil];             %%Matriz compuesta por todos los simbolos en una fila y en la otra el numero de repeticiones
Matrizsalida = unique(transpose(Elementos),'rows');  %%Matriz de dos columnas eliminando las columnas repetidas,sobre esta matriz calcularemos la probabilidad
Vectorrepeticiones = Matrizsalida (:,1);  %%Tomamos el vector de medidas y lo almacenamos en Vectorrepeticiones

  for i=1:length(Vectorrepeticiones);                             %%Bucle para calcular la probabilidad de ocurrencia de cada simbolo
    Vectorprobabilidad(i)=Vectorrepeticiones(i)/length(Asciil);
  end
  
Entropia = -sum(Vectorprobabilidad.*log2(Vectorprobabilidad));    %%Calculamos la entropia del mensaje en base a la probailidad de cada simbolo
printf("Entropia = ")
disp(Entropia);

Vectorsimbolos = Matrizsalida(:,2);       %%Tomamos el vector de simbolos para asociar al vector de probabilidad

figure;
stem(Vectorsimbolos,Vectorprobabilidad);
title("PROBABILIDADES DE SIMBOLOS EN ASCIIL");
figure;
stem(Vectorsimbolos,log2(1./Vectorprobabilidad));
title("INFORMACION ASOCIADA A CADA SIMBOLO EN ASCIIL");
figure;
stem(Vectorsimbolos,-Vectorprobabilidad.*log2(Vectorprobabilidad));
title("ENTROPIA ASOCIADA A CADA SIMBOLO EN ASCIIL");

CodHuffman = huffmandict(Vectorsimbolos,Vectorprobabilidad);      %%Función del paquete communications que genera el codigo Huffman (pkg load communications)
CodAsciil = transpose(mat2cell(dec2bin(Vectorsimbolos),[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]));
CellSimbolos = mat2cell(Vectorsimbolos,[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]);

A=[CodHuffman;transpose(CellSimbolos)];     %%Representacion en cell de codificacion huffman
B=[CodAsciil;transpose(CellSimbolos)];      %%Representacion en cell de codificacion asciil

ins = input("Se mostrara codificacion Huffman obtenida,presione enter para continuar");
A
ins = input("Se mostrara codificacion Asciil obtenida,presione enter para continuar");
B


HuffEnvio = [];                                 %%Preparamos el mensaje en un vector para enviarlo por el canal con codificacion Huffman
  for i = 1:length(Asciil); 
      switch x = Asciil(i);
        case x = 48;
        HuffEnvio = [HuffEnvio 1,0,0,0,0,1,1,1,1,0,0];
        case x = 49;
        HuffEnvio = [HuffEnvio 1,0,0,0,0,1,1,1,1,0,1];
        case x = 52;
        HuffEnvio = [HuffEnvio 1,0,0,0,0,1,1,1,1,1,0];
        case x = 56;
        HuffEnvio = [HuffEnvio 1,0,0,0,0,1,1,1,1,1,1];
        case x = 63;
        HuffEnvio = [HuffEnvio 1,0,0,0,0,1,1,0,0,1,0];
        case x = 67;
        HuffEnvio = [HuffEnvio 1,0,0,0,0,1,1,0,0,1,1];
        case x = 74;
        HuffEnvio = [HuffEnvio 1,0,0,0,0,1,1,0,0,0,0];
        case x = 76;
        HuffEnvio = [HuffEnvio 1,0,0,0,0,1,1,0,0,0,1];
        case x = 78;
        HuffEnvio = [HuffEnvio 1,0,0,0,0,1,1,0,1,1,1];
        case x = 80;
        HuffEnvio = [HuffEnvio 1,0,0,0,0,1,1,0,1,0,0];
        case x = 84;
        HuffEnvio = [HuffEnvio 1,0,0,0,0,1,1,0,1,0,0];
        case x = 86;
        HuffEnvio = [HuffEnvio 1,0,0,0,0,1,1,0,1,0,1];
        case x = 33;
        HuffEnvio = [HuffEnvio 1,0,1,1,1,1,1,0,0,0];
        case x = 83;
        HuffEnvio = [HuffEnvio 1,0,1,1,1,1,1,0,0,1];
        case x = 65;
        HuffEnvio = [HuffEnvio 1,0,1,1,1,1,1,1,1];
        case x = 89;
        HuffEnvio = [HuffEnvio 1,0,1,1,1,1,1,0,1];
        case x = 106;
        HuffEnvio = [HuffEnvio 1,0,1,1,1,1,1,1,0];
        case x = 69;
        HuffEnvio = [HuffEnvio 1,0,0,0,0,1,1,1,0];
        case x = 59;
        HuffEnvio = [HuffEnvio 0,1,0,1,0,0,0,1,0];
        case x = 81;
        HuffEnvio = [HuffEnvio 0,1,0,1,0,0,0,1,1];
        case x = 104;
        HuffEnvio = [HuffEnvio 0,1,1,1,0,1,1,1];
        case x = 102;
        HuffEnvio = [HuffEnvio 0,1,1,1,0,1,1,0]; 
        case x = 58;
        HuffEnvio = [HuffEnvio 0,1,0,1,0,0,0,0];
        case x = 122;
        HuffEnvio = [HuffEnvio 1,0,1,1,1,1,0]; 
        case x = 46;
        HuffEnvio = [HuffEnvio 1,0,0,0,0,1,0];
        case x = 103;
        HuffEnvio = [HuffEnvio 0,1,1,1,0,1,0];
        case x = 113;
        HuffEnvio = [HuffEnvio 0,1,0,1,0,0,1];
        case x = 98;
        HuffEnvio = [HuffEnvio 1,0,1,1,1,0];
        case x = 118;
        HuffEnvio = [HuffEnvio 1,0,0,0,0,0];
        case x = 121;
        HuffEnvio = [HuffEnvio 0,1,1,1,0,0];
        case x = 112;
        HuffEnvio = [HuffEnvio 0,1,0,1,0,1];
        case x = 99;
        HuffEnvio = [HuffEnvio 0,0,0,0,1,1];
        case x = 44;
        HuffEnvio = [HuffEnvio 0,0,0,0,1,0];
        case x = 116;
        HuffEnvio = [HuffEnvio 1,0,1,1,0];
        case x = 100;
        HuffEnvio = [HuffEnvio 1,0,0,0,1];
        case x = 117;
        HuffEnvio = [HuffEnvio 0,1,1,1,1];
        case x = 109;
        HuffEnvio = [HuffEnvio 0,1,0,1,1];
        case x = 115;
        HuffEnvio = [HuffEnvio 0,1,0,0,1];
        case x = 0;
        HuffEnvio = [HuffEnvio 0,1,0,0,0];
        case x = 110;
        HuffEnvio = [HuffEnvio 0,0,0,0,0];
        case x = 108;
        HuffEnvio = [HuffEnvio 1,1,0,1];
        case x = 114;
        HuffEnvio = [HuffEnvio 1,1,0,0];
        case x = 105;
        HuffEnvio = [HuffEnvio 1,0,1,0];
        case x = 10;
        HuffEnvio = [HuffEnvio 1,0,0,1];
        case x = 111;
        HuffEnvio = [HuffEnvio 0,1,1,0];
        case x = 101;
        HuffEnvio = [HuffEnvio 0,0,0,1];
        case x = 97;
        HuffEnvio = [HuffEnvio 1,1,1];
        case x = 32;
        HuffEnvio = [HuffEnvio 0,0,1];
        otherwise continue;
        endswitch
  end
  
        
AsciilEnvio = [];                                 %%Preparamos el mensaje en un vector para enviarlo por el canal con codificacion Asciil
  for i = 1:length(Asciil); 
      switch x = Asciil(i);
        case x = 48;
        AsciilEnvio = [AsciilEnvio 0,1,1,0,0,0,0];
        case x = 49;
        AsciilEnvio = [AsciilEnvio 0,1,1,0,0,0,1];
        case x = 52;
        AsciilEnvio = [AsciilEnvio 0,1,1,0,1,0,0];
        case x = 56;
        AsciilEnvio = [AsciilEnvio 0,1,1,1,0,0,0];
        case x = 63;
        AsciilEnvio = [AsciilEnvio 0,1,1,1,1,1,1];
        case x = 67;
        AsciilEnvio = [AsciilEnvio 1,0,0,0,0,1,1];
        case x = 74;
        AsciilEnvio = [AsciilEnvio 1,0,0,1,0,1,0];
        case x = 76;
        AsciilEnvio = [AsciilEnvio 1,0,0,1,1,0,0];
        case x = 78;
        AsciilEnvio = [AsciilEnvio 1,0,0,1,1,1,0];
        case x = 80;
        AsciilEnvio = [AsciilEnvio 1,0,1,0,0,0,0];
        case x = 84;
        AsciilEnvio = [AsciilEnvio 1,0,1,0,1,0,0];
        case x = 86;
        AsciilEnvio = [AsciilEnvio 1,0,1,0,1,1,0];
        case x = 33;
        AsciilEnvio = [AsciilEnvio 0,1,0,0,0,0,1];
        case x = 83;
        AsciilEnvio = [AsciilEnvio 1,0,1,0,0,1,1];
        case x = 65;
        AsciilEnvio = [AsciilEnvio 1,0,0,0,0,0,1];
        case x = 89;
        AsciilEnvio = [AsciilEnvio 1,0,1,1,0,0,1];
        case x = 106;
        AsciilEnvio = [AsciilEnvio 1,1,0,1,0,1,0];
        case x = 69;
        AsciilEnvio = [AsciilEnvio 1,0,0,0,1,0,1];
        case x = 59;
        AsciilEnvio = [AsciilEnvio 0,1,1,1,0,1,1];
        case x = 81;
        AsciilEnvio = [AsciilEnvio 1,0,1,0,0,0,1];
        case x = 104;
        AsciilEnvio = [AsciilEnvio 1,1,0,1,0,0,0];
        case x = 102;
        AsciilEnvio = [AsciilEnvio 1,1,0,0,1,1,0]; 
        case x = 58;
        AsciilEnvio = [AsciilEnvio 0,1,1,1,0,1,0];
        case x = 122;
        AsciilEnvio = [AsciilEnvio 1,1,1,1,0,1,0]; 
        case x = 46;
        AsciilEnvio = [AsciilEnvio 0,1,0,1,1,1,0];
        case x = 103;
        AsciilEnvio = [AsciilEnvio 1,1,0,0,1,1,1];
        case x = 113;
        AsciilEnvio = [AsciilEnvio 1,1,1,0,0,0,1];
        case x = 98; 
        AsciilEnvio = [AsciilEnvio 1,1,0,0,0,1,0];
        case x = 118;
        AsciilEnvio = [AsciilEnvio 1,1,1,0,1,1,0];
        case x = 121;
        AsciilEnvio = [AsciilEnvio 1,1,1,1,0,0,1];
        case x = 112;
        AsciilEnvio = [AsciilEnvio 1,1,1,0,0,0,0];
        case x = 99;
        AsciilEnvio = [AsciilEnvio 1,1,0,0,0,1,1];
        case x = 44;
        AsciilEnvio = [AsciilEnvio 0,1,0,1,1,0,0];
        case x = 116;
        AsciilEnvio = [AsciilEnvio 1,1,1,0,1,0,0];
        case x = 100;
        AsciilEnvio = [AsciilEnvio 1,1,0,0,1,0,0];
        case x = 117;
        AsciilEnvio = [AsciilEnvio 1,1,1,0,1,0,1];
        case x = 109;
        AsciilEnvio = [AsciilEnvio 1,1,0,1,1,0,1];
        case x = 115;
        AsciilEnvio = [AsciilEnvio 1,1,1,0,0,1,1];
        case x = 0;
        AsciilEnvio = [AsciilEnvio 0,0,0,0,0,0,0];
        case x = 110;
        AsciilEnvio = [AsciilEnvio 1,1,0,1,1,1,0];
        case x = 108;
        AsciilEnvio = [AsciilEnvio 1,1,0,1,1,0,0];
        case x = 114;
        AsciilEnvio = [AsciilEnvio 1,1,1,0,0,1,0];
        case x = 105;
        AsciilEnvio = [AsciilEnvio 1,1,0,1,0,0,1];
        case x = 10;
        AsciilEnvio = [AsciilEnvio 0,0,0,1,0,1,0];
        case x = 111;
        AsciilEnvio = [AsciilEnvio 1,1,0,1,1,1,1];
        case x = 101;
        AsciilEnvio = [AsciilEnvio 1,1,0,0,1,0,1];
        case x = 97;
        AsciilEnvio = [AsciilEnvio 1,1,0,0,0,0,1];
        case x = 32;
        AsciilEnvio = [AsciilEnvio 0,1,0,0,0,0,0];
        otherwise continue;
       endswitch
  end       
 

Prob = input('Introduzca la probabilidad de error del canal por bit entre 0 y 1:')        %%Introducimos error en el canal  
HuffRecep = bsc(HuffEnvio,Prob);                                              %%Aplicamos error al mensaje Huffman de manera aleatoria
AsciilRecep = bsc(AsciilEnvio,Prob);                                          %%Aplicamos error al mensaje Asciil de manera aleatoria
 
AsciilDeco = [];
  for i = 1:7:length(AsciilRecep);
      switch x = AsciilRecep(i:i+6);
        case x = [0 1 1 0 0 0 0];
        AsciilDeco = [AsciilDeco '0'];
        case x = [0 1 1 0 0 0 1];
        AsciilDeco = [AsciilDeco '1'];
        case x = [0 1 1 0 1 0 0];
        AsciilDeco = [AsciilDeco '4'];
        case x = [0 1 1 1 0 0 0];
        AsciilDeco = [AsciilDeco '8'];
        case x = [0 1 1 1 1 1 1];
        AsciilDeco = [AsciilDeco '?'];
        case x = [1 0 0 0 0 1 1];
        AsciilDeco = [AsciilDeco 'C'];
        case x = [1 0 0 1 0 1 0];
        AsciilDeco = [AsciilDeco 'J'];
        case x = [1 0 0 1 1 0 0];
        AsciilDeco = [AsciilDeco 'L'];
        case x = [1 0 0 1 1 1 0];
        AsciilDeco = [AsciilDeco 'N'];
        case x = [1 0 1 0 0 0 0];
        AsciilDeco = [AsciilDeco 'P'];
        case x = [1 0 1 0 1 0 0];
        AsciilDeco = [AsciilDeco 'T'];
        case x = [1 0 1 0 1 1 0];   
        AsciilDeco = [AsciilDeco 'V'];
        case x = [0 1 0 0 0 0 1];   
        AsciilDeco = [AsciilDeco '!'];
        case x = [1 0 1 0 0 1 1];   
        AsciilDeco = [AsciilDeco 'S'];
        case x = [1 0 0 0 0 0 1];   
        AsciilDeco = [AsciilDeco 'A'];
        case x = [1 0 1 1 0 0 1];   
        AsciilDeco = [AsciilDeco 'Y'];
        case x = [1 1 0 1 0 1 0];   
        AsciilDeco = [AsciilDeco 'j'];
        case x = [1 0 0 0 1 0 1];   
        AsciilDeco = [AsciilDeco 'E'];
        case x = [0 1 1 1 0 1 1];   
        AsciilDeco = [AsciilDeco ';'];
        case x = [1 0 1 0 0 0 1];   
        AsciilDeco = [AsciilDeco 'Q'];
        case x = [1 1 0 1 0 0 0];   
        AsciilDeco = [AsciilDeco 'h'];
        case x = [1 1 0 0 1 1 0];   
        AsciilDeco = [AsciilDeco 'f'];
        case x = [0 1 1 1 0 1 0];   
        AsciilDeco = [AsciilDeco ':'];
        case x = [1 1 1 1 0 1 0];   
        AsciilDeco = [AsciilDeco 'z'];
        case x = [0 1 0 1 1 1 0];   
        AsciilDeco = [AsciilDeco '.'];
        case x = [1 1 0 0 1 1 1];   
        AsciilDeco = [AsciilDeco 'g'];
        case x = [1 1 1 0 0 0 1];   
        AsciilDeco = [AsciilDeco 'q'];
        case x = [1 1 0 0 0 1 0];   
        AsciilDeco = [AsciilDeco 'b'];
        case x = [1 1 1 0 1 1 0];   
        AsciilDeco = [AsciilDeco 'v'];
        case x = [1 1 1 1 0 0 1];   
        AsciilDeco = [AsciilDeco 'y'];
        case x = [1 1 1 0 0 0 0];   
        AsciilDeco = [AsciilDeco 'p'];
        case x = [1 1 0 0 0 1 1];   
        AsciilDeco = [AsciilDeco 'c'];
        case x = [0 1 0 1 1 0 0];   
        AsciilDeco = [AsciilDeco ','];
        case x = [1 1 1 0 1 0 0];   
        AsciilDeco = [AsciilDeco 't'];
        case x = [1 1 0 0 1 0 0];   
        AsciilDeco = [AsciilDeco 'd'];
        case x = [1 1 1 0 1 0 1];   
        AsciilDeco = [AsciilDeco 'u'];
        case x = [1 1 0 1 1 0 1];   
        AsciilDeco = [AsciilDeco 'm'];
        case x = [1 1 1 0 0 1 1];   
        AsciilDeco = [AsciilDeco 's'];
        case x = [0 0 0 0 0 0 0];   
        AsciilDeco = [AsciilDeco '-'];
        case x = [1 1 0 1 1 1 0];   
        AsciilDeco = [AsciilDeco 'n'];
        case x = [1 1 0 1 1 0 0];   
        AsciilDeco = [AsciilDeco 'l'];
        case x = [1 1 1 0 0 1 0];   
        AsciilDeco = [AsciilDeco 'r'];
        case x = [1 1 0 1 0 0 1];   
        AsciilDeco = [AsciilDeco 'i'];
        case x = [0 0 0 1 0 1 0];   
        AsciilDeco = [AsciilDeco ' \n '];
        case x = [1 1 0 1 1 1 1];   
        AsciilDeco = [AsciilDeco 'o'];
        case x = [1 1 0 0 1 0 1];   
        AsciilDeco = [AsciilDeco 'e'];
        case x = [1 1 0 0 0 0 1];   
        AsciilDeco = [AsciilDeco 'a'];
        case x = [0 1 0 0 0 0 0];   
        AsciilDeco = [AsciilDeco ' '];
        otherwise continue;
     endswitch       
  end 
 
x = []; 
n =[];
HuffDeco = [];
for i=1:length(HuffRecep);
n = [n HuffRecep(i)];
  switch x = n;
    case x =  [0 0 1];
    HuffDeco = [HuffDeco ' '];
    n = [];
    case x = [1 1 1];
    HuffDeco = [HuffDeco 'a'];
    n = [];
    case x = [1 1 0 1]; 
    HuffDeco = [HuffDeco 'l'];
    n = [];
    case x = [1 1 0 0];
    HuffDeco = [HuffDeco 'r'];
    n = [];
    case x = [1 0 1 0];
    HuffDeco = [HuffDeco 'i'];
    n = [];
    case x = [1 0 0 1];
    HuffDeco = [HuffDeco ' \n '];
    n = [];
    case x = [0 1 1 0];
    HuffDeco = [HuffDeco 'o'];
    n = [];
    case x = [0 0 0 1];
    HuffDeco = [HuffDeco 'e'];
    n = [];
    case x = [1 0 1 1 0];
    HuffDeco = [HuffDeco 't'];
    n = [];
    case x = [1 0 0 0 1];
    HuffDeco = [HuffDeco 'd'];
    n = [];
    case x = [0 1 1 1 1];
    HuffDeco = [HuffDeco 'u'];
    n = [];
    case x = [0 1 0 1 1];
    HuffDeco = [HuffDeco 'm'];
    n = [];
    case x = [0 1 0 0 1];
    HuffDeco = [HuffDeco 's'];
    n = [];
    case x = [0 1 0 0 0];
    HuffDeco = [HuffDeco '-'];
    n = [];
    case x = [0 0 0 0 0];
    HuffDeco = [HuffDeco 'n'];
    n = [];
    case x = [1 0 1 1 1 0];
    HuffDeco = [HuffDeco 'b'];
    n = [];
    case x = [1 0 0 0 0 0];
    HuffDeco = [HuffDeco 'v'];
    n = [];
    case x = [0 1 1 1 0 0];
    HuffDeco = [HuffDeco 'y'];
    n = [];
    case x = [0 1 0 1 0 1];
    HuffDeco = [HuffDeco 'p'];
    n = [];
    case x = [0 0 0 0 1 1];
    HuffDeco = [HuffDeco 'c'];
    n = [];
    case x = [0 0 0 0 1 0];
    HuffDeco = [HuffDeco ','];
    n = [];
    case x = [1 0 1 1 1 1 0];
    HuffDeco = [HuffDeco 'z'];
    n = [];
    case x = [1 0 0 0 0 1 0];
    HuffDeco = [HuffDeco '.'];
    n = [];
    case x = [0 1 1 1 0 1 0];
    HuffDeco = [HuffDeco 'g'];
    n = [];
    case x = [0 1 0 1 0 0 1];
    HuffDeco = [HuffDeco 'q'];
    n = []; 
    case x = [0 1 1 1 0 1 1 1];
    HuffDeco = [HuffDeco 'h'];
    n = [];
    case x = [0 1 1 1 0 1 1 0];
    HuffDeco = [HuffDeco 'f'];
    n = [];
    case x = [0 1 0 1 0 0 0 0];
    HuffDeco = [HuffDeco ':'];
    n = [];
    case x = [1 0 1 1 1 1 1 1 1];
    HuffDeco = [HuffDeco 'A'];
    n = [];
    case x = [1 0 1 1 1 1 1 0 1];
    HuffDeco = [HuffDeco 'Y'];
    n = [];
    case x = [1 0 1 1 1 1 1 1 0];
    HuffDeco = [HuffDeco 'j'];
    n = [];
    case x = [1 0 1 1 1 1 1 1 0];
    HuffDeco = [HuffDeco 'j'];
    n = [];
    case x = [1 0 0 0 0 1 1 1 0];
    HuffDeco = [HuffDeco 'E'];
    n = [];
    case x = [0 1 0 1 0 0 0 1 0];
    HuffDeco = [HuffDeco ';'];
    n = [];
    case x = [0 1 0 1 0 0 0 1 1];
    HuffDeco = [HuffDeco 'Q'];
    n = [];
    case x = [1 0 1 1 1 1 1 0 0 0];
    HuffDeco = [HuffDeco '!'];
    n = [];
    case x = [1 0 1 1 1 1 1 0 0 1];
    HuffDeco = [HuffDeco 'S'];
    n = [];
    case x = [1 0 0 0 0 1 1 0 1 0 1];
    HuffDeco = [HuffDeco 'V'];
    n = [];
    case x = [1 0 0 0 0 1 1 1 1 0 0];
    HuffDeco = [HuffDeco 'O'];
    n = [];
    case x = [1 0 0 0 0 1 1 1 1 0 1];
    HuffDeco = [HuffDeco '1'];
    n = [];
    case x = [1 0 0 0 0 1 1 1 1 1 0];
    HuffDeco = [HuffDeco '4'];
    n = [];
    case x = [1 0 0 0 0 1 1 0 0 1 0];
    HuffDeco = [HuffDeco '?'];
    n = [];
    case x = [1 0 0 0 0 1 1 0 0 1 1];
    HuffDeco = [HuffDeco 'C'];
    n = [];
    case x = [1 0 0 0 0 1 1 0 0 0 0];
    HuffDeco = [HuffDeco 'J'];
    n = [];
    case x = [1 0 0 0 0 1 1 0 0 0 1];
    HuffDeco = [HuffDeco 'L'];
    n = [];
    case x = [1 0 0 0 0 1 1 0 1 1 1];
    HuffDeco = [HuffDeco 'N'];
    n = [];
    case x = [1 0 0 0 0 1 1 0 1 0 0];
    HuffDeco = [HuffDeco 'T'];
    n = [];
    case x = [1 0 0 0 0 1 1 0 1 0 1];
    HuffDeco = [HuffDeco 'V'];
    n = [];
    otherwise
    endswitch
 end
 
printf("DECODIFICACION HUFFMAN:\n")  %Imprimimos mensaje Huffman decodificado
printf(HuffDeco);
printf("\n");
printf("DECODIFICACION ASCIIL:\n"); %Imprimimos mensaje Asccil decodificado
printf(AsciilDeco);
printf("\n");



 