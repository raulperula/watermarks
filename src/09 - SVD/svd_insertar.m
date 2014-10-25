%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: svd_insertar.m                          |%
%|  Funci�n:  inserci�n de una marca de agua por el m�todo |%
%|            SVD.                                         |%
%-----------------------------------------------------------%

% se limpia todo
clear all;

% se guarda el tiempo de comienzo de computaci�n
start_time = cputime;

% se inicializan los par�metros necesarios
key = 250;
tam = 50;

% se lee la imagen de cobertura
file_name = 'lena_256.bmp';
cover_object = double(imread(file_name));

% se determinan las dimensiones de la imagen de cobertura
[Mc,Nc] = size(cover_object);

% se reinicia el generador PN de MATLAB con "key"
randn('state',key); 

% se crea la marca con n�meros aleatorios de N(0,1)
watermark = randn(tam,tam);
marcagrande = zeros(Mc,Nc);
marcagrande(1:tam,1:tam) = watermark;

% se inserta la marca de agua
[U,S,V] = svd(cover_object);
D = S+0.2*marcagrande;
[UW,SW,VW] = svd(D);

% se guardan las matrices que har�n falta para la extracci�n
cd 'Datos'
save datosSVD.mat UW VW S key tam;
cd ..

% se hace la operaci�n inversa para recuperar la imagen marcada
watermarked_image = U*SW*(V');

% se convierte la imagen marcada a tipo uint8
watermarked_image_int = uint8(watermarked_image);

% se guarda la imagen marcada en un fichero
cd 'ImagenesPruebas'
imwrite(watermarked_image_int,'svd_watermarked.bmp');
cd ..

% se muestra el tiempo de computaci�n
elapsed_time = cputime-start_time

% se calcula el valor del PSNR para la imagen marcada
psnr = psnr(cover_object,watermarked_image,Mc,Nc)

% se muestra la imagen marcada por pantalla
% figure
% imshow(watermarked_image_int,[])
% title('Imagen Marcada')
