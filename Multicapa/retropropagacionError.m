function [difW, difT] = retropropagacionError(patron, Z, y, w, s, h, u, Beta, eta)
%% Función que calcula los diferenciales de los pesos W y T

%% Incialización de variables
nSalidas=size(y,1);
nOcultas=size(w,2);

delta2=zeros(nSalidas,1);
difW=zeros(nSalidas, nOcultas);
delta1=zeros(nOcultas,1);
difT=zeros(nOcultas,size(patron,2));

%% --> Cálculo de deltas2 y difW <--
%% ->> Completar aquí <<-
yDif = (Z-y);
g1 = derivadaLogistica(h,Beta); %logistica(h,Beta);
difW = eta*yDif*g1*s;
%% --> Cálculo de deltas1 y difT <--
g3 = derivadaLogistica(u,Beta);
ss=g3'*patron;
d2 = yDif*g1';
difT = eta*d2*w*ss;
%% ->> Completar aquí <<-
end

