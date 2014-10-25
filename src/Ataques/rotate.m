%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: rotate.m                                |%
%|  Funci�n:  rotaci�n de una imagen en el plano.          |%
%|  Par�metros entrada:                                    |%
%|    - I:  imagen a tratar.                               |%
%|    - angle:  �ngulo en grados.                          |%
%|  Par�metros salida:                                     |%
%|    - I: imagen rotada.                                  |%
%-----------------------------------------------------------%

function [] = rotate(I,angle,file_name)
  I = imrotate(I,angle,'crop');
  cd 'ImagenesAtaques'
  imwrite(I,file_name);
  cd ..
return
