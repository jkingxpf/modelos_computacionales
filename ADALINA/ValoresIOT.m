function [Input, Output, Target] = ValoresIOT(Data, W, i)
%Tomar la fila i sin la última columna (fila de atributos)
 Input = Data(i, 1:end-1);
%Coger el valor real    (clase real)
 Target = Data(i, end);
%Calculamos la y gorrito (valor calculado) por el perceptron, igual que en
%simple pero sin signo
 Output = [Input -1]*W;

end