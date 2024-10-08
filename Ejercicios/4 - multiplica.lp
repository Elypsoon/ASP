% Definir un rango de valores posibles para los números 
num(0..10).

% Caso base: cualquier número multiplicado por 0 es 0
multiplicacion(X, 0, 0) :- num(X).

% Caso recursivo: X * Y = X + X * (Y - 1)
multiplicacion(X, Y, Z) :- num(X), num(Y), Y > 0, Y1 = Y - 1, multiplicacion(X, Y1, Z1), Z = Z1 + X, num(Z).

#show multiplicacion/3.