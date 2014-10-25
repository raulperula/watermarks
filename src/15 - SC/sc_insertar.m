%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: SC_insertar.m                           |%
%|  Funci�n:  inserci�n de una marca de agua por el m�todo |%
%|            de las secuencias ca�ticas.                  |%
%-----------------------------------------------------------%

% se limpia todo
clear all;

% se guarda el tiempo de comienzo de computaci�n
start_time = cputime;

% se inicializan los par�metros necesarios
lambda = 3.98;
alpha = 10;
umbral = 0.5;

% se guardan los datos que har�n falta para la extracci�n
cd 'Datos'
save datosSC.mat lambda umbral;
cd ..

% se lee la imagen de cobertura
file_name = 'lena_256.bmp';
cover_object = double(imread(file_name));

% se determinan las dimensiones de la imagen de cobertura
[Mc,Nc] = size(cover_object);

% se genera la marca pseudoaleatoria
x = zeros(1,Mc*Nc);
x(1) = 0.1;
for i = 2:Mc*Nc
  x(i) = lambda*x(i-1)*(1-x(i-1));
end

w = zeros(1,Mc*Nc);
for i = 1:Mc*Nc
  if(x(i) < umbral)
    w(i) = 1;
  end
end

% se redimensiona la marca en forma de matriz
W = reshape(w,[Mc,Nc]);

% se a�ade la m�scara de marca a la imagen de cobertura usando el factor de
% ganancia k
watermarked_image_dbl = cover_object+alpha*W;
watermarked_image_int = uint8(watermarked_image_dbl);

% se guarda la imagen marcada en un fichero
cd 'ImagenesPruebas'
imwrite(watermarked_image_int,'sc_watermarked.bmp');
cd ..

% se muestra el tiempo de computaci�n
elapsed_time = cputime-start_time

% se calcula el valor del PSNR para la imagen marcada
psnr = psnr(cover_object,watermarked_image_dbl,Mc,Nc)

% se muestra la imagen marcada por pantalla
% figure
% imshow(watermarked_image_int,[])
% title('Imagen Marcada')
