% Definir un rango de números
num(0..20).

% Caso base: 0 es par
es_par(0).

% Caso base: 1 es impar
es_impar(1).

% Caso recursivo: un número X es par si X-2 es par
es_par(X) :- num(X), X > 1, X2 = X - 2, es_par(X2).

% Caso recursivo: un número X es impar si X-2 es impar
es_impar(X) :- num(X), X > 1, X2 = X - 2, es_impar(X2).

#show es_par/1.
#show es_impar/1.