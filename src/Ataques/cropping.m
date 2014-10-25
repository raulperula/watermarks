%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: cropping.m                              |%
%|  Funci�n:  recortado de una imagen.                     |%
%|  Par�metros entrada:                                    |%
%|    - I: imagen a tratar.                                |%
%|    - XMIN: coordenada x.                                |%
%|    - YMIN: coordenada y.                                |%
%|    - WIDTH: ancho que se desea.                         |%
%|    - HEIGHT: alto que se desea.                         |%
%|  Par�metros salida:                                     |%
%|    - I: imagen con el recortado realizado.              |%
%-----------------------------------------------------------%

function [] = cropping(I,XMIN,YMIN,WIDTH,HEIGHT,file_name)
  I = imcrop(I, [XMIN YMIN WIDTH HEIGHT]);
  cd 'ImagenesAtaques'
  imwrite(I,file_name);
  cd ..
return
