function [Y] = derivadaLogistica(X,beta)
%% Calcula la derivada de la función logística para cada uno de los elementos del vector columna X
    %% ->> Completar aquí <<-
    g1 = logistica(X,beta);
    Y = 2*beta*g1.*(1-g1);
end

