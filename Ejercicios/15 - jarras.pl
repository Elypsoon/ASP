% Programa que resuelve el problema de las jarras. Hecho en Prolog.

% Goal: estado final deseado, donde CJG es 4 litros en la jarra grande, y no nos importa cuánto haya en la pequeña.
meta(estado(2,_)). 

% posible(EstadoActual, EstadoSiguiente, CapacidadMaxJarraGrande, CapacidadMaxJarraPequena)

% Llenar la jarra grande
posible(estado(CJG,CJP), estado(CJG1, CJP), MJG, _):- 
    CJG>=0,                % CJG tiene que ser un valor válido (mayor o igual que 0)
    CJG < MJG,             % CJG es menor que la capacidad máxima de la jarra grande (no está llena)
    CJG1 is MJG.           % CJG1 es el nuevo estado, es decir, llenamos la jarra grande completamente.

% Llenar la jarra pequeña
posible(estado(CJG,CJP), estado(CJG, CJP1), _, MJP):- 
    CJP>=0,                % CJP tiene que ser un valor válido (mayor o igual que 0)
    CJP < MJP,             % CJP es menor que la capacidad máxima de la jarra pequeña (no está llena)
    CJP1 is MJP.           % CJP1 es el nuevo estado, es decir, llenamos la jarra pequeña completamente.

% Vaciar la jarra grande
posible(estado(CJG,CJP), estado(CJG1,CJP), _, _):- 
    CJG > 0,               % CJG tiene que tener agua para poder vaciarla
    CJG1 is 0.             % CJG1 es el nuevo estado, vaciamos la jarra grande (quedando 0 litros).

% Vaciar la jarra pequeña
posible(estado(CJG,CJP), estado(CJG,CJP1), _, _):- 
    CJP > 0,               % CJP tiene que tener agua para poder vaciarla
    CJP1 is 0.             % CJP1 es el nuevo estado, vaciamos la jarra pequeña (quedando 0 litros).

% Verter el agua de la jarra grande a la pequeña, cuando la jarra grande tiene MENOS agua que lo necesario para llenar la jarra pequeña
posible(estado(CJG,CJP), estado(CJG1,CJP1), _, MJP):- 
    CJG > 0,               % La jarra grande tiene que tener agua
    CJP < MJP,             % La jarra pequeña no está completamente llena
    CJG =< (MJP - CJP),    % El agua de la jarra grande cabe completamente en la jarra pequeña
    CJG1 is 0,             % Vaciamos la jarra grande
    CJP1 is CJP + CJG.     % El nuevo contenido de la jarra pequeña es la suma de lo que ya tenía más lo que se vertió.

% Verter el agua de la jarra grande a la pequeña, cuando la jarra grande tiene MÁS agua que lo necesario para llenar la jarra pequeña
posible(estado(CJG,CJP), estado(CJG1,CJP1), _, MJP):- 
    CJG > 0,               % La jarra grande tiene que tener agua
    CJP < MJP,             % La jarra pequeña no está completamente llena
    CJG > (MJP - CJP),     % La cantidad de agua en la jarra grande es mayor que lo necesario para llenar la jarra pequeña
    CJG1 is CJG - (MJP - CJP), % La jarra grande queda con lo que sobra después de llenar la pequeña
    CJP1 is MJP.           % La jarra pequeña queda completamente llena.

% Verter el agua de la jarra pequeña a la grande, cuando la jarra pequeña tiene MENOS agua que lo necesario para llenar la jarra grande
posible(estado(CJG,CJP), estado(CJG1,CJP1), MJG, _):- 
    CJP > 0,               % La jarra pequeña tiene que tener agua
    CJG < MJG,             % La jarra grande no está completamente llena
    CJP =< (MJG - CJG),    % El agua de la jarra pequeña cabe completamente en la jarra grande
    CJP1 is 0,             % Vaciamos la jarra pequeña
    CJG1 is CJG + CJP.     % La nueva cantidad en la jarra grande es la suma de lo que ya tenía más lo que se vertió.

% Verter el agua de la jarra pequeña a la grande, cuando la jarra pequeña tiene MÁS agua que lo necesario para llenar la jarra grande
posible(estado(CJG,CJP), estado(CJG1,CJP1), MJG, _):- 
    CJP > 0,               % La jarra pequeña tiene que tener agua
    CJG < MJG,             % La jarra grande no está completamente llena
    CJP > (MJG - CJG),     % La cantidad de agua en la jarra pequeña es mayor que lo necesario para llenar la jarra grande
    CJP1 is CJP - (MJG - CJG), % La jarra pequeña queda con lo que sobra después de llenar la grande
    CJG1 is MJG.           % La jarra grande queda completamente llena.

% Verificar si un estado ya ha sido visitado (evitar bucles)
miembro(X,[X|_]).               % Caso base: X es el primer elemento de la lista.
miembro(X,[_|L]):- miembro(X,L). % Caso recursivo: verificar el resto de la lista.

% Implementación de la solución

% Caso base: si el estado actual es el objetivo, la lista de solución es la misma.
solucion([E|L],[E|L],_,_):-meta(E).

% Caso recursivo: si el estado actual no es el objetivo, encontrar un estado siguiente posible y continuar.
solucion([E|L],LS,MJG,MJP):- 
    posible(E,EP,MJG,MJP),      % Generar un nuevo estado EP a partir del estado E
    not(miembro(EP,L)),         % Verificar que EP no ha sido visitado antes
    solucion([EP,E|L],LS,MJG,MJP). % Continuar la búsqueda desde EP.

/*
Ejemplo de solución para solucion([estado(0,0)], Solucion, 4, 3):

La meta es obtener 2 litros en la jarra grande (meta(estado(2,_))).

Al ejecutar solucion([estado(0,0)], Solucion, 4, 3), uno de los resultados posibles es: 
[estado(2,0), estado(0,2), estado(4,2), estado(3,3), estado(3,0), estado(0,3), estado(4,3), estado(4,0), estado(0,0)]

La explicación de la solución es la siguiente:
Pasos:
1. estado(0,0)  % Ambas jarras están vacías.
2. estado(4,0)  % Llenamos la jarra grande a su capacidad máxima (4 litros).
3. estado(4,3)  % Llenamos la jarra pequeña a su capacidad máxima (3 litros).
4. estado(0,3)  % Vaciamos la jarra grande. Ahora la grande está vacía y la pequeña tiene 3 litros.
5. estado(3,0)  % Vertemos el agua de la jarra pequeña a la grande, quedando 3 litros en la grande y 0 en la pequeña.
6. estado(3,3)  % Llenamos de nuevo la jarra pequeña a su capacidad máxima (3 litros), manteniendo los 3 litros en la grande.
7. estado(4,2)  % Llenamos la jarra grande usando el agua de la jarra pequeña (3 litros), quedando 2 litros en la pequeña.
8. estado(0,2)  % Vaciamos la jarra grande. Ahora la grande está vacía y la pequeña tiene 2 litros.
9. estado(2,0)  % Vertemos el agua de la jarra pequeña a la grande, quedando 2 litros en la grande y 0 en la pequeña.

De esta forma, se ha obtenido el objetivo de tener 2 litros en la jarra grande.
*/