%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: errMatriz.m                             |%
%|  Funci�n:  comprueba cuantos bits son err�neos entre la |%
%|            marca original y la extraida.                |%
%|  Par�metros entrada:                                    |%
%|    - orig_watermark:  marca original.                   |%
%|    - watermark:  marca extraida.                        |%
%|    - Mw: n�mero de filas de la marca.                   |%
%|    - Nw: n�mero de columnas de la marca.                |%
%|  Par�metros salida:                                     |%
%|    - Ninguno.                                           |%
%-----------------------------------------------------------%

function errMatriz(orig_watermark,watermark,Mw,Nw)
  malos = 0;
  
  for i = 1:Mw
    for j = 1:Nw
      if(orig_watermark(i,j) ~= watermark(i,j))
        malos = malos+1;
      end
    end
  end

  fprintf('Bits mal recuperados de la marca: %d de %d\n',malos,Mw*Nw);
end
