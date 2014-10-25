%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: meanFilter.m                            |%
%|  Funci�n:  aplica un filtro de paso bajo a una imagen.  |%
%|  Par�metros entrada:                                    |%
%|    - I:  imagen a tratar.                               |%
%|  Par�metros salida:                                     |%
%|    - I: imagen con el filtro de paso bajo aplicado.     |%
%-----------------------------------------------------------%

function [] = meanFilter(I,file_name)
  % se crea el filtro de la media
  h = fspecial('average',8);
  % se aplica el filtro
  I = imfilter(I,h);
  cd 'ImagenesAtaques'
  imwrite(I,file_name);
  cd ..
return
