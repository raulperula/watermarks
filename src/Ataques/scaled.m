%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: scaled.m                                |%
%|  Funci�n:  escalado de una imagen.                      |%
%|  Par�metros entrada:                                    |%
%|    - I:  imagen a tratar.                               |%
%|    - scale:  tama�o de escalado.                        |%
%|  Par�metros salida:                                     |%
%|    - I: imagen con el escalado realizado.               |%
%-----------------------------------------------------------%

function [] = scaled(I,scale,file_name)
  I = imresize(I, scale);
  cd 'ImagenesAtaques'
  imwrite(I,file_name);
  cd ..
return
