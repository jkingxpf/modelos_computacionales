clear;
clc;
close all;

%load DatosAND
%load DatosLS5
%load DatosLS10
load DatosLS50
%load DatosOR
%load DatosXOR

%Data(:,end)=Data(:,end)==1;

LR=0.5;
Limites=[-1.5, 2.5, -1.5, 2.5];
MaxEpoc=100;

W=PerceptronWeigthsGenerator(Data); 

Epoc=1;

%bucle que cada iteracion va actualizando pesos y calculando si el
%resultado estimado coincide con el real
while ~CheckPattern(Data, W) && Epoc<MaxEpoc
    for i=1:size(Data,1)
        [Input,Output,Target]=ValoresIOT(Data,W,i);
        
        
        if Signo(Output) ~=Target
            W=UpdateNet(W,LR,Output,Target,Input);
        end
               
    end    
    Epoc=Epoc+1;
end


if(CheckPattern(Data, W))
    disp('Correcto')
else
    disp('Incorrecto')
end

