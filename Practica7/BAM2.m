clear all;
barco = load('./barco.mat');
coche = load('./coche.mat');
textoBarco = load('./textoBarco.mat');
textoCoche = load('./textoCoche.mat');
x(1,:) = reshape(barco.barco,1,size(barco.barco,1)*size(barco.barco,2));
x(2,:) = reshape(coche.coche,1,size(coche.coche,1)*size(coche.coche,2));
y(1,:) = reshape(textoBarco.textoBarco,1,size(textoBarco.textoBarco,1)*size(textoBarco.textoBarco,2));
y(2,:) = reshape(textoCoche.textoCoche,1,size(textoCoche.textoCoche,1)*size(textoCoche.textoCoche,2));

epocMax = 21;

w = x'*y;
S = zeros(size(x,2), epocMax);
S2 = zeros(size(y,2), epocMax);

gaus = imnoise(x(2,:),'gaussian',0.75) *2-1;
sinit = gaus;
s2init = sign(sinit*w);
S(:,1) = sinit;
S2(:,1) = s2init;

for epoc = 2 : 1: epocMax
    S(:,epoc) = sign(w*S2(:, epoc-1));
    S2(:, epoc) = sign(S(:, epoc)'*w);
    if (sum(S(:,epoc) == S(:,epoc-1)) == size(x,2)) && (sum(S2(:,epoc) == S2(:,epoc-1)) == size(y,2)) 
        subplot(3,1,1);
        imshow(reshape(sinit,size(barco.barco,1),size(barco.barco,2)))
        subplot(3,1,2)
        imshow(reshape(S(:,epoc),size(barco.barco,1),size(barco.barco,2) ));
        subplot(3,1,3)
        imshow(reshape( S2(:,epoc),size(textoBarco.textoBarco,1),size(textoBarco.textoBarco,2) ))
        break;
    end
end
