% [[1,1,1,0,1,1,1,1], [1,0,1,1,1,1,1,1], [1,1,1,1,1,1,1,0], [1,1,1,1,1,1,1,1], 
% [1,1,1,1,1,1,1,1], [1,1,1,1,1,1,1,1], [1,1,1,1,1,1,1,1], [1,1,1,1,1,1,1,1]]

% [[1,1,1,0,1,1,1,1], 
% [1,0,1,1,1,1,1,1], 
% [1,1,1,1,1,1,1,0],  
% [1,1,1,1,1,1,1,1], 
% [1,1,1,1,1,1,1,1], 
% [1,1,1,1,1,1,1,1], 
% [1,1,1,1,1,1,1,1], 
% [1,1,1,1,1,1,1,1]]

%[[1,4], [2,2], [3,8]]

while([R | _], 0) :- not(member(0,R)).
while([R | []], 1) :- member(0,R).
while([R | Resto], ToR) :- member(0, R), while(Resto, ToP), ToR is ToP +1.

atacaV([[_, Y] | _], Y).
atacaV([_ | Resto], Y) :- atacaV(Resto, Y).

atacaD([[X, Y] | _], [A, B]) :- abs(X - A) =:=  abs(Y - B), !.
atacaD([_ | Reinas], P) :- atacaD(Reinas, P).

atacaH([[X, _] | _], X).
atacaH([_ | Reinas], X) :- atacaH(Reinas, X).

es_atacada(Reinas, [Xc, Yc]) :-
    atacaV(Reinas, Yc);
    atacaH(Reinas, Xc);
    atacaD(Reinas, [Xc, Yc]).

% Verifica si una reina está dentro del tablero (1-8 para filas y columnas)
valida_reina([X, Y]) :-
between(1, 8, X), % Fila válida (1-8)
between(1, 8, Y). % Columna válida (1-8)

% Proporciona una lista de las casillas que no son atacadas por las reinas en una fila determinada
% y verifica que la fila esté dentro del rango válido (1 a 8).
ciclo(Reinas, Fila, R) :-
    between(1, 8, Fila),
    findall([Fila, Columna], (between(1, 8, Columna), \+ es_atacada(Reinas, [Fila, Columna])), R).

% Proporciona una lista de todas las casillas que no son atacadas en todo el tablero
general(Reinas, CasillasSeguras) :-
    findall(CasillasFila, (between(1, 8, Fila), ciclo(Reinas, Fila, CasillasFila)), TodasLasFilas),
    append(TodasLasFilas, CasillasSeguras).
