% Relaciones en la familia Rodríguez

% Definición de personas: persona (Nombre, Edad, Peso, Altura)
persona(alfonso, 42, 77, 180).
persona(beatriz, 40, 57, 168).
persona(carlos, 19, 61, 188).
persona(david, 17, 66, 163).
persona(elena, 15, 48, 153).

% Definición de relación padre e hijo
padre(alfonso, carlos).
padre(alfonso, david).
padre(alfonso, elena).

madre(beatriz, carlos).
madre(beatriz, david).
madre(beatriz, elena).

% Relaciones reflexivas: una persona se relaciona consigo misma en todos los atributos
reflexiva(X) :- persona(X, _, _, _).

% Relación simétrica: igualdad en peso entre dos personas
% No hay relación simétrica porque todos los valores son diferentes
% Pero debería haber una si igualamos el peso de dos personas.
simetrica(X, Y) :- persona(X, _, W, _), persona(Y, _, W, _), X != Y.

% Relación antisimétrica: si una persona es más alta que otra
antisimetrica(X, Y) :- persona(X, _, _, H1), persona(Y, _, _, H2), H1 > H2.

% Relación transitiva: si una persona es mayor que otra, y esta segunda persona es mayor que una tercera
transitiva(X, Z) :- persona(X, E1, _, _), persona(Y, E2, _, _), persona(Z, E3, _, _), E1 > E2, E2 > E3, X != Z.

% Relación de equivalencia: igualdad en peso
% Como no hay relación simétrica, no hay relación de equivalencia
% Se generará si hacemos que haya una simétrica
equivalencia(X, Y) :- persona(X, _, W, _), persona(Y, _, W, _), X != Y.

% Relación de orden parcial: en base a la edad
orden_parcial(X, Y) :- persona(X, E1, _, _), persona(Y, E2, _, _), E1 >= E2, X != Y.

#show reflexiva/1.
#show simetrica/2.
#show antisimetrica/2.
#show transitiva/2.
#show equivalencia/2.
#show orden_parcial/2.