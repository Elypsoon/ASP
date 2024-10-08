% Definir un rango de valores posibles para la base y el exponente
num(0..10).  % Definimos base y exponente entre 0 y 10 para evitar sobrecarga.

% Caso base: cualquier número elevado a la potencia de 0 es 1
exponente(X, 0, 1) :- num(X), X > 0.

% Caso recursivo: X^Y = X * X^(Y-1)
exponente(X, Y, Z) :- num(X), num(Y), Y > 0, Y1 = Y - 1, exponente(X, Y1, Z1), Z = X * Z1, num(Z).

#show exponente/3.