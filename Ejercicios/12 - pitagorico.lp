% Parámetros para los rangos
n(1..10).

% Condiciones para la tripleta
pyt(Z, X, Y) :- n(X), n(Y), n(Z), Z*Z = X*X + Y*Y.

#show pyt/3.