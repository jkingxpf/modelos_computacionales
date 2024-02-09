clear all;

x = rand(4,5);
y = rand(4,2);

a = rand(4,5);
b = rand(4,2);

x = orth(x')';
y = orth(y);

w = x' * y; %equivalente al sumatorio.

w2 = a' * b; % de la no ortogonal.

y
x*w %reconstruccion de la salida ortogonal

b
a*w%reconstruccion de la salida no ortogonal


