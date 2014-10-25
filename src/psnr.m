%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: psnr.m                                  |%
%|  Funci�n:  calcula el psnr de una imagen.               |%
%|  Par�metros entrada:                                    |%
%|    - image:  imagen original.                           |%
%|    - image_prime:  imagen marcada.                      |%
%|    - M: ancho de la imagen.                             |%
%|    - N: alto de la imagen.                              |%
%|  Par�metros salida:                                     |%
%|    - A: valor del psnr en decibelios.                   |%
%-----------------------------------------------------------%

function [A] = psnr(image,image_prime,M,N)
  % convierte las imagenes a tipo double para poder tratarlas
  image = double(image);
  image_prime = double(image_prime);

  % comprobacion de que no se divida por 0
  if((sum(sum(image-image_prime))) == 0)
    error('Las imagenes de entrada no deben de ser identicas')
  else
    psnr_num = M*N*max(max(image.^2));                % calcula el numerador
    psnr_den = sum(sum((image-image_prime).^2));      % calcula el denominador   
    A = psnr_num/psnr_den;                            % calcula el PSNR
  end

  A = 10*log10(A); % convierte el PSNR en decibelios
return
