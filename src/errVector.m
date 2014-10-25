%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: errVector.m                             |%
%|  Funci�n:  comprueba cuantos bits son err�neos entre la |%
%|            marca original y la extraida.                |%
%|  Par�metros entrada:                                    |%
%|    - orig_watermark:  marca original.                   |%
%|    - watermark:  marca extraida.                        |%
%|    - tam: dimensi�n de la marca.                        |%
%|  Par�metros salida:                                     |%
%|    - Ninguno.                                           |%
%-----------------------------------------------------------%

function errVector(orig_watermark,watermark,tam)
  malos = 0;
  
  for i = 1:tam
    if(orig_watermark(i) ~= watermark(i))
      malos = malos+1;
    end
  end

    fprintf('Bits mal recuperados de la marca: %d de %d\n',malos,tam);
end
