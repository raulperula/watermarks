%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: scdct_insertar_sin_permutacion.m        |%
%|  Funci�n:  inserci�n de una marca de agua por el m�todo |%
%|            de las secuencias caoticas y la DCT, sin     |%
%|            permutaci�n.                                 |%
%-----------------------------------------------------------%

% se limpia todo
clear all;

% se guarda el tiempo de comienzo de computaci�n
start_time = cputime;

% se inicializan los par�metros necesarios
tam = 1000;
alpha = 1;
key = 250.;

% se guardan las variables que har�n falta para la extracci�n
cd 'Datos'
save 'datosSCDCT_noper.mat' tam key;
cd ..

% se lee la imagen de cobertura
file_name = 'lena_256.bmp';
cover_object = double(imread(file_name));

% se determinan las dimensiones de la imagen de cobertura
[Mc,Nc] = size(cover_object);

% se calcula la DCT
trans = dct2(cover_object);

% se genera la marca con n�meros pseudoaleatorios de una N(0,1)
randn('state',key);
marca = randn(tam,1);

% se ponen los coeficientes en zig-zag
transmod = trans;
k = 1;
for i = 2:Mc
  for j = 1:i
    if(k <= tam)
      transmod(i,j) = trans(i,j)+alpha*marca(k)*abs(trans(i,j));
      k = k+1;
    end
  end
end

% se realiza la transformada inversa
watermarked_image_dbl = idct2(transmod);

% se convierte la imagen marcada a tipo uint8
watermarked_image_int = uint8(watermarked_image_dbl);

% se guarda la imagen marcada en un fichero
cd 'ImagenesPruebas'
imwrite(watermarked_image_int,'scdct_noper_watermarked.bmp');
cd ..

% se muestra el tiempo de computaci�n
elapsed_time = cputime-start_time

% se calcula el valor del PSNR para la imagen marcada
psnr = psnr(cover_object,watermarked_image_dbl,Mc,Nc)

% se muestra la imagen marcada por pantalla
% figure
% imshow(watermarked_image_int,[])
% title('Imagen Marcada')
