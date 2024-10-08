% Definir un rango de valores posibles para X (base) y Y (exponente)
num(0..10).  

% Caso base: cualquier número elevado a la potencia de 0 es 1
potencia(X, 0, 1) :- num(X), X > 0.

% Caso recursivo: X^Y = X * X^(Y-1)
potencia(X, Y, Z) :- 
    num(X), num(Y), Y > 0, 
    Y1 = Y - 1, 
    potencia(X, Y1, Z1), 
    Z = X * Z1, num(Z).
    
#show Z: potencia(2,3,Z). %Ejemplo particular de 2^3
#show potencia/3.