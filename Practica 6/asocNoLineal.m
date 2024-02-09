clear all;
numIter = 21;
s = [-1,-1,1,1,1];
w = 1/size(s,2)*s'*s;
w = w - diag(diag(w)); % el primer diag devuelve vector el segundo hace una matriz con diagonal w
                       % Para autoconexiones.
S = zeros(size(s,2),numIter);
S(:,1) = [-1,-1,1,-1,1];

for t = 2:numIter
    cambio = false;
    S(:,t) = S(:,t-1);

    for i = 1 : size(s,2)
        h = sum(S(:,t)' .* w(i,:), "all");
        S(i,t) = (h>0) * 2 -1 ;%{-1,1}
        cambio = cambio || S(i,t)~=S(i,t-1);
    end
    if ~cambio
        break;
    end
end

S(:,t)

