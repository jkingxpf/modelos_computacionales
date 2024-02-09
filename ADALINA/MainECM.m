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

W=[0;0;0];%%PerceptronWeigthsGenerator(Data); %%[0;0;0]

Epoc=1;
ecm = [];


resultadoCheckPattern = false;
while ~resultadoCheckPattern && Epoc<MaxEpoc
    totalError = 0; % Inicializar el error total en esta época
    for i=1:size(Data,1)
        [Input,Output,Target]=ValoresIOT(Data,W,i);
        
        
        if Signo(Output) ~=Target
            W=UpdateNet(W,LR,Output,Target,Input);
        end
               
    totalError = totalError + (Output - Target)^2;

    end
    
    ecm(Epoc) = totalError / size(Data, 1); % Calcular el ECM promedio en esta época
    resultadoCheckPattern = CheckPattern(Data, W); 
    
    Epoc=Epoc+1;
end

totalError = 0;
for i=1:size(Data,1)
        [Input,Output,Target]=ValoresIOT(Data,W,i);
        
               
    totalError = totalError + (Output - Target)^2;

end
    ecm(Epoc) = totalError / size(Data, 1); % Calcular el ECM promedio en la última



if(resultadoCheckPattern)
    disp('Correcto')
else
    disp('Incorrecto')
end

% Mostrar el vector del ECM en cada época
disp('Vector del ECM en cada época:');
disp(ecm);

% Graficar la evolución del ECM
figure;
plot(1:length(ecm), ecm, 'LineWidth', 2);
xlabel('Época');
ylabel('ECM');
title('Evolución del Error Cuadrático Medio (ECM)');
grid on;
