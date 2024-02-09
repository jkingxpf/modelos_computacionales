clear;
clc;
close all;

%load DatosAND
%load DatosLS5
%load DatosLS10
%load DatosLS50
%load DatosOR
load DatosXOR

%Data(:,end)=Data(:,end)==1;

LR=0.5;
Limites=[-1.5, 2.5, -1.5, 2.5];
MaxEpoc=100;

W=PerceptronWeigthsGenerator(Data);

 %cogemos cada fila sin la última columna, es decir, las entradas sin el
 %valor real
 Input = Data(:, 1:end-1);
 %valores reales
 resultadoReal = Data(:, end);

 %nEntradas
 nFilas = size(Data, 1);

% Crear un vector de -1s con nFilas elementos
columna_de_minus_uno = -ones(nFilas, 1); 

%sacamos todas las entradas (filas de atributos)
X = [Input columna_de_minus_uno];


%aplicamos la fórmula analítica
W = inv(X'*X)*X'*resultadoReal; 

% Inicializar un vector para almacenar los resultados
resultado = zeros(size(X, 1), 1);

%guardamos resultados
for i=1:size(X,1)

    resultado(i) = Signo(X(i,:) * W);

end
    
    %calculamos ECM
    ecm = sum((resultadoReal - resultado).^2) / nFilas;


   % Calcular el Accuracy (Acc)
    patrones_correctos = sum(resultado == resultadoReal);
    acc = (patrones_correctos / nFilas) * 100;

%Mostramos resultados
if(resultado == resultadoReal)
    disp('Correcto');
else
    disp('Incorrecto');
end

    disp(['Error Cuadrático Medio (ECM): ' num2str(ecm)]);
    disp(['Accuracy (Acc): ' num2str(acc) '%']);


