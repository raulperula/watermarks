%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: similaridad.m                           |%
%|  Funci�n:  calcula la similaridad entre dos marcas de   |%
%|            agua.                                        |%
%|  Par�metros entrada:                                    |%
%|    - orig_watermark:  marca original.                   |%
%|    - watermark:  marca extraida.                        |%
%|    - tam: n�mero de filas de la marca.                  |%
%|    - tam1: n�mero de columnas de la marca.              |%
%|  Par�metros salida:                                     |%
%|    - grafico: grafica de similaridades.                 |%
%-----------------------------------------------------------%

function grafico = similaridad(orig_watermark,watermark,tam,tam1)
  if (size(orig_watermark) ~= size(watermark))
    watermark = reshape(watermark,size(orig_watermark));
  end

  % se inicializa a ceros el vector
  simi = zeros(1,500);

  % seg�n el n�mero de par�metros de entrada se crea unas marcas u otras
  if nargin == 3
    % se crean las marcas aleatorias
    for i = 1:500
      rand('seed',double(i));
      ale_watermark = ceil(2*rand(tam,1)-1);
      simi(i) = (ale_watermark'*orig_watermark)/sqrt(ale_watermark'*ale_watermark);
    end
  else
    % se crean las marcas aleatorias
    for i = 1:500
      rand('seed',double(i));
      ale_watermark = ceil(2*rand(tam*tam1,1)-1);
      simi(i) = (ale_watermark'*orig_watermark)/sqrt(ale_watermark'*ale_watermark);
    end
  end
  
  % se pone el resultado con la marca original y la extraida
  simi(250) = (watermark'*orig_watermark)/sqrt(watermark'*watermark);
  
  % se crea el gr�fico con los 500 resultados
  x = 1:500;
  grafico = plot(x,simi);
end