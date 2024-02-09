clear;
clc;
close all;

%load DatosAND
load DatosLS5
%load DatosLS10
%load DatosLS50
%load DatosOR
%load DatosXOR

Data(:,end)=Data(:,end)==1;

LR=0.5;
Limites=[-1.5, 2.5, -1.5, 2.5];
MaxEpoc=100;

W=PerceptronWeigthsGenerator(Data);

Epoc=1;
emc = [];
errorPasada = [];
while ~CheckPattern(Data,W) && Epoc<MaxEpoc
     for i=1:size(Data,1)
        [Input,Output,Target]=ValoresIOT(Data,W,i);
        
       
        %pause;
        
        if Signo(Output)~=Target
           W=UpdateNet(W,LR,Output,Target,Input);
        end
        %pause;
        emc = [emc,EMC(Target,Output)];
     
     end
     errorPasada = [errorPasada, sum(emc)/size(emc,1)];
     emc = [];
    Epoc=Epoc+1;
end

plot(errorPasada);

