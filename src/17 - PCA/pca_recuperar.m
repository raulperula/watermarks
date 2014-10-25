%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: PCA_recuperar.m                         |%
%|  Funci�n:  extracci�n de la marca de agua por el m�todo |%
%|            PCA.                                         |%
%-----------------------------------------------------------%

% se limpia todo
clear all;

% se cargan los datos necesarios para la extracci�n
cd 'Datos'
load 'datosPCA.mat'
cd ..

% se guarda el tiempo de comienzo de computaci�n
start_time = cputime;

% se lee la imagen marcada y se le cambia el tipo a double
file_name = 'pca_watermarked.bmp';
watermarked_image = double(imread(file_name));

% carga de las im�genes atacadas
% file_name = 'pca_JPEGatack.jpg';
% file_name = 'pca_NOISEatack.bmp';
% file_name = 'pca_MEANatack.bmp';
% file_name = 'pca_CROPPINGatack.bmp';
% file_name = 'pca_SCALEDatack.bmp';
% file_name = 'pca_ROTATEatack.bmp';
% cd 'ImagenesAtaques'
% watermarked_image = double(imread(file_name));
% cd ..

% se determinan las dimensiones de la imagen marcada
[Mw,Nw] = size(watermarked_image);

% se lee la imagen de cobertura
file_name = 'lena_256.bmp';
cover_object = double(imread(file_name));

% se obtiene la marca original
randn('state',key);
orig_watermark = randn(tam,1);

% se averigua la matriz de proyeccion a partir de la matriz original
% se divide la imagen en bloques 8x8, se convierten en vectores 1D
X = zeros(64,1024);
k = 1;
for i = 1:8:Mw
  for j = 1:8:Nw
    A = cover_object(i:i+7,j:j+7);
    A = A(:);
    X(:,k) = A;
    k = k+1;
  end
end

% se calcula la media de las filas
media = mean(X,2);

% a cada fila se le resta su media
X2 = X-repmat(media,[1 1024]);

% se calcula la matriz de proyecci�n: U
[U,S,V] = svds((1/sqrt(1024.))*X2,p);

% se proyecta la imagen original
proy = U'*X2;

% se extraen las 16 ultimas coordenadas de cada bloque de la imagen
% original para formar el vector y(i)
y = zeros(tam,1);
k = 1;
for i = 1:1024
  y(k:k+15,1) = proy(49:64,i);
  k = k+16;
end

% se proyecta la imagen marcada con la matriz de proyecci�n de la imagen
% original
X = zeros(64,1024);
k = 1;
for i = 1:8:Mw
  for j = 1:8:Nw
    A = watermarked_image(i:i+7,j:j+7);
    A = A(:);
    X(:,k) = A;
    k = k+1;
  end
end
X2 = X-repmat(media,[1 1024]);
proymarcada = U'*X2;

% se extraen las 16 ultimas coordenadas proyectadas
ypri = zeros(tam,1);
k = 1;
for i = 1:1024
  ypri(k:k+15,1) = proymarcada(49:64,i);
  k = k+16;
end
unos = ones(tam,1);
watermark = (ypri./y-unos)/alpha;

% se muestra el tiempo de computaci�n
elapsed_time = cputime-start_time

% se calcula la similaridad
graf = correlacion(orig_watermark,watermark,tam,1);
title('Correlacion');

% se guarda la gr�fica en un fichero
cd 'ImagenesPruebas'
I = getframe(gcf);
imwrite(I.cdata,'pca_correlacion.bmp');
cd ..
