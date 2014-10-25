%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: scdct_recuperar_sin_permutacion.m       |%
%|  Funci�n:  extracci�n de la marca de agua por el m�todo |%
%|            de las secuencias caoticas y la DCT, sin     |%
%|            permutaci�n.                                 |%
%-----------------------------------------------------------%

% se limpia todo
clear all;

% se cargan los datos necesarios para la extracci�n
cd 'Datos'
load 'datosSCDCT_noper.mat'
cd ..

% se guarda el tiempo de comienzo de computaci�n
start_time = cputime;

% se lee la imagen marcada y se le cambia el tipo a double
file_name = 'scdct_noper_watermarked.bmp';
watermarked_image = double(imread(file_name));

% se determinan las dimensiones de la imagen marcada
[Mw,Nw] = size(watermarked_image);

% se genera la marca con numeros pseudoaleatorios de una N(0,1)
randn('state',key);
orig_watermark = randn(tam,1);

% se calcula la DCT
trans = dct2(watermarked_image);

% se extraen los coeficientes en zig-zag, se extraen los coefcientes DCT
% que se usaron para ocultar la marca
watermark = zeros(tam,1);
k = 1;
for i = 2:Mw
  for j = 1:i
    if(k <= tam)
      watermark(k) = trans(i,j);
      k = k+1;
    end
  end
end

% se muestra el tiempo de computaci�n
elapsed_time = cputime-start_time

% se calcula la similaridad
graf = correlacion(orig_watermark,watermark,tam,1);
title('Correlacion');

% se guarda la gr�fica en un fichero
cd 'ImagenesPruebas'
I = getframe(gcf);
imwrite(I.cdata,'scdct_noper_correlacion.bmp');
cd ..
