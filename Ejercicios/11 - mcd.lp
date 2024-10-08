%Hallar el máximo común divisor de dos números
n(0..10).
%Definimos casos particulares
mcd(0,0,0).
mcd(X, 0, 0) :- n(X).
mcd(0, X, 0) :- n(X).

mcd(X, Y, MCD) :- Y>X, mcd(Y, X, MCD).
mcd(X, Y, MCD) :- Z = X\Y, Z!=0, mcd(Y, Z, MCD), n(X), n(Y), n(Z).
mcd(X, Y, Y) :- Z = X\Y, Z==0, n(X), n(Y), n(Z).

#show mcd/3.