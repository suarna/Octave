HuffDeco = [];
  for i = 1:length(HuffRecep)
      if (HuffRecep(i:i+2) == [1 1 1])
      HuffDeco = [HuffDeco 'a'];
      i = i + 3;
      elseif (HuffRecep(i:i+2) == [0 0 1])
      HuffDeco = [HuffDeco ' '];
      i = i + 3;
      elseif (HuffRecep(i:i+3) == [1 1 0 1])
      HuffDeco = [HuffDeco 'l'];
      i = i + 4;
      elseif (HuffRecep(i:i+3) == [1 1 0 0])
      HuffDeco = [HuffDeco 'r'];
      i = i + 4;
      elseif (HuffRecep(i:i+3) == [1 0 1 0])
      HuffDeco = [HuffDeco 'i'];
      i = i + 4;
      elseif (HuffRecep(i:i+3) == [1 0 0 1])
      HuffDeco = [HuffDeco '\n'];
      i = i + 4;
      elseif (HuffRecep(i:i+3) == [0 1 1 0])
      HuffDeco = [HuffDeco 'o'];
      i = i + 4;
      elseif (HuffRecep(i:i+3) == [0 0 0 1])
      HuffDeco = [HuffDeco 'e'];
      i = i + 4;
      elseif (HuffRecep(i:i+4) == [1 0 1 1 0])
      HuffDeco = [HuffDeco 't'];
      i = i + 5;
      elseif (HuffRecep(i:i+4) == [1 0 0 0 1])
      HuffDeco = [HuffDeco 'd'];
      i = i + 5;
      elseif (HuffRecep(i:i+4) == [1 0 1 1 1])
      HuffDeco = [HuffDeco 'u'];
      i = i + 5;
      elseif (HuffRecep(i:i+4) == [0 1 0 1 1])
      HuffDeco = [HuffDeco 'm'];
      i = i + 5;
      elseif (HuffRecep(i:i+4) == [0 1 0 0 1])
      HuffDeco = [HuffDeco 's'];
      i = i + 5;
      elseif (HuffRecep(i:i+4) == [0 1 0 0 0])
      HuffDeco = [HuffDeco 'NULL'];
      i = i + 5;
      elseif (HuffRecep(i:i+4) == [0 0 0 0 0])
      HuffDeco = [HuffDeco 'n'];
      i = i + 5;
      elseif (HuffRecep(i:i+5) == [1 0 1 1 1 0])
      HuffDeco = [HuffDeco 'b'];
      i = i + 6;
      elseif (HuffRecep(i:i+5) == [1 0 0 0 0 0])
      HuffDeco = [HuffDeco 'v'];
      i = i + 6;
      elseif (HuffRecep(i:i+5) == [0 1 1 1 0 0])
      HuffDeco = [HuffDeco 'y'];
      i = i + 6;
      elseif (HuffRecep(i:i+5) == [0 1 0 1 0 1])
      HuffDeco = [HuffDeco 'p'];
      i = i + 6;
      elseif (HuffRecep(i:i+5) == [0 0 0 0 1 1])
      HuffDeco = [HuffDeco 'c'];
      i = i + 6;
      elseif (HuffRecep(i:i+5) == [0 0 0 0 1 0])
      HuffDeco = [HuffDeco ','];
      i = i + 6;
      elseif (HuffRecep(i:i+6) == [1 0 1 1 1 1 0])
      HuffDeco = [HuffDeco 'z'];
      i = i + 7;
      elseif (HuffRecep(i:i+6) == [1 0 0 0 0 1 0])
      HuffDeco = [HuffDeco '.'];
      i = i + 7;
      elseif (HuffRecep(i:i+6) == [0 1 1 1 0 1 0])
      HuffDeco = [HuffDeco 'g'];
      i = i + 7;
      elseif (HuffRecep(i:i+6) == [0 1 0 1 0 0 1])
      HuffDeco = [HuffDeco 'q'];
      i = i + 7;
      elseif (HuffRecep(i:i+7) == [0 1 1 1 0 1 1 1])
      HuffDeco = [HuffDeco 'h'];
      i = i + 8;
      elseif (HuffRecep(i:i+7) == [0 1 1 1 0 1 1 0])
      HuffDeco = [HuffDeco 'f'];
      i = i + 8;
      elseif (HuffRecep(i:i+7) == [0 1 0 1 0 0 0 0])
      HuffDeco = [HuffDeco ':'];
      i = i + 8;
      elseif (HuffRecep(i:i+8) == [1 0 1 1 1 1 1 1 1])
      HuffDeco = [HuffDeco 'A'];
      i = i + 9;
      elseif (HuffRecep(i:i+8) == [1 0 1 1 1 1 1 0 1])
      HuffDeco = [HuffDeco 'Y'];
      i = i + 9;
      elseif (HuffRecep(i:i+8) == [1 0 1 1 1 1 1 1 0])
      HuffDeco = [HuffDeco 'j'];
      i = i + 9;
      elseif (HuffRecep(i:i+8) == [1 0 0 0 0 1 1 1 0])
      HuffDeco = [HuffDeco 'E'];
      i = i + 9;
      elseif (HuffRecep(i:i+8) == [0 1 0 1 0 0 0 1 0])
      HuffDeco = [HuffDeco ';'];
      i = i + 9;
      elseif (HuffRecep(i:i+8) == [0 1 0 1 0 0 0 1 1])
      HuffDeco = [HuffDeco 'Q'];
      i = i + 9;
      elseif (HuffRecep(i:i+9) == [1 0 1 1 1 1 1 0 0 0])
      HuffDeco = [HuffDeco '!'];
      i = i + 10;
      elseif (HuffRecep(i:i+9) == [1 0 1 1 1 1 1 0 0 1])
      HuffDeco = [HuffDeco 'S'];
      i = i + 10;
      elseif (HuffRecep(i:i+10) == [1 0 0 0 0 1 1 1 1 0 0])
      HuffDeco = [HuffDeco '0'];
      i = i + 11;
      elseif (HuffRecep(i:i+10) == [1 0 0 0 0 1 1 1 1 0 1])
      HuffDeco = [HuffDeco '1'];
      i = i + 11;
      elseif (HuffRecep(i:i+10) == [1 0 0 0 0 1 1 1 1 1 0])
      HuffDeco = [HuffDeco '4'];
      i = i + 11;
      elseif (HuffRecep(i:i+10) == [1 0 0 0 0 1 1 0 0 1 0])
      HuffDeco = [HuffDeco '?'];
      i = i + 11;
      elseif (HuffRecep(i:i+10) == [1 0 0 0 0 1 1 0 0 1 1])
      HuffDeco = [HuffDeco 'C'];
      i = i + 11;
      elseif (HuffRecep(i:i+10) == [1 0 0 0 0 1 1 0 0 0 0])
      HuffDeco = [HuffDeco 'J'];
      i = i + 11;
      elseif (HuffRecep(i:i+10) == [1 0 0 0 0 1 1 0 0 0 1])
      HuffDeco = [HuffDeco 'L'];
      i = i + 11;
      elseif (HuffRecep(i:i+10) == [1 0 0 0 0 1 1 0 1 1 1])
      HuffDeco = [HuffDeco 'N'];
      i = i + 11;
      elseif (HuffRecep(i:i+10) == [1 0 0 0 0 1 1 0 1 0 0])
      HuffDeco = [HuffDeco 'T'];
      i = i + 11;
      elseif (HuffRecep(i:i+10) == [1 0 0 0 0 1 1 0 1 0 1])
      HuffDeco = [HuffDeco 'V'];
      i = i + 11;
      else continue;
      end
  end
 
 
VectorIndex = find(HuffRecep == 1);
 
VectorResta = [];
for i=1:length(VectorIndex)-1;
  x = VectorIndex(i+1)-VectorIndex(i);
  VectorResta = [VectorResta x];
end
 
 
 
 
 
 
 