function [correcto] = CheckPattern(Data, W)
%CHECKPATTERN Summary of this function goes here
%   Detailed explanation goes here


nFilas = size(Data,1);

correcto = true;

%bucle que itera y devuelve true o false si la salida es igual al valor
%real para todos los patrones
for i=1:nFilas
   [~, Output, Target] = ValoresIOT(Data, W, i);

   if Signo(Output) ~= Target
       correcto = false;
       break;
   end

end

