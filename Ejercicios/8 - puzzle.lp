%Solución de un problema parecido al puzzle de la cebra. Hecho en clingo.

% Definimos los dominios
colores(roja;verde;blanca;amarilla;azul).
nacionalidades(ingles;espanol;ucraniano;noruego;japones).
mascotas(perro;vibora;zorro;caballo;cebra).
bebidas(cafe;te;leche;vino;agua).
cigarros(old_gold;kool;chesterfield;gitanes;craven).

% Hay 5 casas
casas(1..5).

% Cada atributo debe ser asignado exactamente a una casa (reglas de unicidad)
1 { color(Casa, Color) : colores(Color) } 1 :- casas(Casa).
1 { color(Casa, Color) : casas(Casa) } 1 :- colores(Color).

1 { nacionalidad(Casa, Nacionalidad) : nacionalidades(Nacionalidad) } 1 :- casas(Casa).
1 { nacionalidad(Casa, Nacionalidad) : casas(Casa) } 1 :- nacionalidades(Nacionalidad).

1 { mascota(Casa, Mascota) : mascotas(Mascota) } 1 :- casas(Casa).
1 { mascota(Casa, Mascota) : casas(Casa) } 1 :- mascotas(Mascota).

1 { bebida(Casa, Bebida) : bebidas(Bebida) } 1 :- casas(Casa).
1 { bebida(Casa, Bebida) : casas(Casa) } 1 :- bebidas(Bebida).

1 { cigarro(Casa, Cigarro) : cigarros(Cigarro) } 1 :- casas(Casa).
1 { cigarro(Casa, Cigarro) : casas(Casa) } 1 :- cigarros(Cigarro).

% Vecindad (para representar casas adyacentes)
vecinos(Casa1, Casa2) :- casas(Casa1), casas(Casa2), |Casa1 - Casa2| == 1.

% Reglas basadas en las pistas

% a) El inglés vive en la casa roja.
:- nacionalidad(Casa1, ingles), color(Casa2, roja), Casa1 != Casa2.

% b) El perro pertenece al español.
:- nacionalidad(Casa1, espanol), mascota(Casa2, perro), Casa1 != Casa2.

% c) El de la casa verde toma café.
:- color(Casa1, verde), bebida(Casa2, cafe), Casa1 != Casa2.

% d) El ucraniano toma té.
:- nacionalidad(Casa1, ucraniano), bebida(Casa2, te), Casa1 != Casa2.

% e) La casa verde está a la derecha de la casa blanca.
:- color(Casa1, verde), color(Casa2, blanca), Casa1 != Casa2 + 1.

% f) El que fuma Old Gold entrena una víbora.
:- cigarro(Casa1, old_gold), mascota(Casa2, vibora), Casa1 != Casa2.

% g) El que fuma Kool vive en la casa amarilla.
:- cigarro(Casa1, kool), color(Casa2, amarilla), Casa1 != Casa2.

% h) El que toma leche vive en la casa de en medio.
:- not bebida(3, leche).

% i) El noruego vive en la primera casa.
:- not nacionalidad(1, noruego).

% j) El que fuma Chesterfield tiene un zorro
:- cigarro(Casa1, chesterfield), mascota(Casa2, zorro), Casa1 != Casa2.

% k) El que fuma Kool tiene un caballo.
:- cigarro(Casa1, kool), mascota(Casa2, caballo), Casa1 != Casa2.

% l) El que fuma Gitanes toma vino.
:- cigarro(Casa1, gitanes), bebida(Casa2, vino), Casa1 != Casa2.

% m) El japonés fuma Craven.
:- nacionalidad(Casa1, japones), cigarro(Casa2, craven), Casa1 != Casa2.

% n) El noruego vive en la casa azul
:- nacionalidad(Casa1, noruego), color(Casa2, azul), Casa1 != Casa2.

% Preguntas
tiene_cebra(Nacionalidad) :- nacionalidad(Casa, Nacionalidad), mascota(Casa, cebra).
bebe_agua(Nacionalidad) :- nacionalidad(Casa, Nacionalidad), bebida(Casa, agua).

% Mostrar la solución
house(Casa, Color, Nacionalidad, Mascota, Bebida, Cigarro) :-
    casas(Casa),
    color(Casa, Color),
    nacionalidad(Casa, Nacionalidad),
    mascota(Casa, Mascota),
    bebida(Casa, Bebida),
    cigarro(Casa, Cigarro).

#show house/6. %Muestra las combinaciones
#show tiene_cebra/1. %Japonés
#show bebe_agua/1. %Noruego