clean all;
epocMax = 21;

x(1,:) = [1 1 1 -1 1 -1 -1 1 -1];
x(2,:) = [1 -1 -1 1 -1 -1 1 1 1];
y(1,:) = [1 -1 -1];
y(2,:) = [-1 -1 1];

w = x'*y;
S = zeros(size(x,2), epocMax);
S2 = zeros(size(y,2), epocMax);

sinit = [1 1 1 -1 1 -1 -1 1 1]
s2init = sign(sinit*w);
S(:,1) = sinit;
S2(:,1) = s2init;

for epoc = 2 : 1: epocMax
    S(:,epoc) = sign(w*S2(:, epoc-1));
    S2(:, epoc) = sign(S(:, epoc)'*w);
    if (sum(S(:,epoc) == S(:,epoc-1)) == size(x,2)) && (sum(S2(:,epoc) == S2(:,epoc-1)) == size(y,2)) 
        sinit
        S(:,epoc)
        S2(:,epoc)
        break;
    end
end


