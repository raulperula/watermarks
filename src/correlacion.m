%-----------------------------------------------------------%
%|  Nombre proyecto:  Marcas de agua en im�genes digitales |%
%|  Autor:            Ra�l P�rula Mart�nez                 |%
%|  A�o:              2009                                 |%
%-----------------------------------------------------------%
%|  Nombre c�digo: correlacion.m                           |%
%|  Funci�n:  calcula la correlaci�n entre dos marcas de   |%
%|            agua.                                        |%
%|  Par�metros entrada:                                    |%
%|    - orig_watermark:  marca original.                   |%
%|    - watermark:  marca extraida.                        |%
%|    - tam: n�mero de filas de la marca.                  |%
%|    - tam1: n�mero de columnas de la marca.              |%
%|  Par�metros salida:                                     |%
%|    - grafico: grafica de correlaciones.                 |%
%-----------------------------------------------------------%

function grafico = correlacion(orig_watermark,watermark,tam,tam1)
  % se inicializa a ceros el vector
  correlacion = zeros(1,500);
  
  if nargin == 3
    % se crean las marcas aleatorias
    for i = 1:500
      randn('state',double(i));
      ale_watermark = randn(tam,tam);
      correlacion(i) = corr2(watermark,ale_watermark);
    end
  else
    % se crean las marcas aleatorias
    for i = 1:500
      randn('state',double(i));
      ale_watermark = randn(tam,tam1);
      correlacion(i) = corr2(watermark,ale_watermark);
    end
  end
  
  % se pone el resultado con la marca original y la extraida
  correlacion(250) = corr2(orig_watermark,watermark);

  % se crea el gr�fico con los 500 resultados
  x = 1:500;
  grafico = plot(x,correlacion);
end