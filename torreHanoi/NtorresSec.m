clear all;

n = 15;
theta = zeros(n,n);
theta(:,:) = -1;

w = zeros(n,n,n,n);

for i = 1:1:n
    for j = 1:1:n 
        w(i,j,1:n,j) = -2;
        w(i,j,i,1:n) = -2;
        w(i,j,i,j)   = 0;
    end
end

epoc = 20;
Shist = zeros(n,n,epoc);

for e = 2:1:epoc
     cambio = false;
     for i = 1 : 1 : n
         for j = 1:1:n
             h = 0;
             for l= 1:1:n
                 for k = 1:1:n
                     h = h + Shist(l,k,e) * w(i,j,l,k);
                 end
             end
             Shist(i,j,e) = int16(h>theta(i,j));
         end
     end
     s = Shist(:,:,e-1) ~= Shist(:,:,e);
     s = sum(sum(s))
     if s > 0
         break;
     end
end

Shist(:,:,e)


%lstm