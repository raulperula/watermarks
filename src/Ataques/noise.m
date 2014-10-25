%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: noise.m                                 |%
%|  Funci�n:  a�ade ruido gausiano a una imagen.           |%
%|  Par�metros entrada:                                    |%
%|    - I:  imagen a tratar.                               |%
%|    - M:  media especificada.                            |%
%|    - V:  varianza especificada.                         |%
%|  Par�metros salida:                                     |%
%|    - I: imagen con el ruido gaussiano a�adido.          |%
%-----------------------------------------------------------%

function [] = noise(I,file_name,M,V)
  if(nargin == 2)
    % se a�ade ruido gaussiano con media cero y varianza 0.01
    I = imnoise(I,'gaussian');
    cd 'ImagenesAtaques'
    imwrite(I,file_name);
    cd ..
  else
    % se a�ade ruido gaussiano con media y varianza especificados
    I = imnoise(I,'gaussian',M,V);
  end
return
