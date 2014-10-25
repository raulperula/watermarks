%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: svd_recuperar.m                         |%
%|  Funci�n:  extracci�n de la marca de agua por el m�todo |%
%|            SVD.                                         |%
%-----------------------------------------------------------%

% se limpia todo
clear all;

% se cargan los datos necesarios para la extracci�n
cd 'Datos'
load datosSVD.mat;
cd ..

% se guarda el tiempo de comienzo de computaci�n
start_time = cputime;

% se lee la imagen marcada y se le cambia el tipo a double
file_name = 'svd_watermarked.bmp';
watermarked_image = double(imread(file_name));

% carga de las im�genes atacadas
% file_name = 'svd_JPEGatack.jpg';
% file_name = 'svd_NOISEatack.bmp';
% file_name = 'svd_MEANatack.bmp';
% file_name = 'svd_CROPPINGatack.bmp';
% file_name = 'svd_SCALEDatack.bmp';
% file_name = 'svd_ROTATEatack.bmp';
% cd 'ImagenesAtaques'
% watermarked_image = double(imread(file_name));
% cd ..

% se reinicia el generador PN de MATLAB con "key"
randn('state',key);

% se obtiene la marca original
orig_watermark = randn(tam,tam);

% se calcula los SVD de la imagen marcada
[U,SW,V] = svd(watermarked_image);

% se calcula la marca
D = UW*SW*(VW');
watermark = (1/0.2)*(D-S);
watermark = watermark(1:tam,1:tam);

% se muestra el tiempo de computaci�n
elapsed_time = cputime-start_time

% se calcula la similaridad
graf = correlacion(orig_watermark,watermark,tam);
title('Correlacion');

% se guarda la gr�fica en un fichero
cd 'ImagenesPruebas'
I = getframe(gcf);
imwrite(I.cdata,'svd_correlacion.bmp');
cd ..
