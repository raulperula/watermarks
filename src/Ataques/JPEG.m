%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: JPEG.m                                  |%
%|  Funci�n:  guarda una imagen con compresi�n jpeg.       |%
%|  Par�metros entrada:                                    |%
%|    - I:  imagen a tratar.                               |%
%|    - file_name:  nombre del archivo a guardar.          |%
%|    - quality:  calidad de la compresi�n.                |%
%|  Par�metros salida:                                     |%
%|    - No tiene.                                          |%
%-----------------------------------------------------------%

function [] = JPEG(I,file_name,quality)
  cd 'ImagenesAtaques'
  if(nargin == 2)
    % la compresi�n se realiza con 75 de calidad
    imwrite(I,file_name);
  else
    % se especifica la calidad que se desea
    imwrite(I,file_name,'Quality',quality);
  end
  cd ..
return
