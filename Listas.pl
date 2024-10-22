%Lista = [2, 4, 6, 1, 3, 5, [2, 4, 6, 1, 3, 5]]
%Matriz = [[1,2,3], [4, 5, 6], [7, 8, 9]]

pertenece(X, [X | _]).
pertenece(X, [_, Resto]) :- pertence(X, Resto).

longitud([], 0).
longitud([_ | Resto], N) :- longitud(Resto, N1), N is N1+1.

pares([_], []).
pares([_,S | R], [S | NR]) :- pares(R, NR).

impares([E], [E]).
impares([S,_ | R], [S | NR]) :- impares(R, NR).

cuarto([_], []).
cuarto([_, _, _, S | _], S).

%Trae el 6 interno
interno([_,_,_,_,_,_,[_|[_|[S|_]]]], S).

%Último usando una función predefinida
ult(L,U) :- reverse(L, [U|_]).

%Último sin usar una función
ultimo([X], X).
ultimo([_|T], Ultimo) :- ultimo(T, Ultimo).

primer_ultimo([X], [X, X]).
primer_ultimo([Primero|Resto], [Primero, Ultimo]) :- ultimo(Resto, Ultimo).

fila([R | _], 1, R).
fila([_ | Res], N, Ren) :- Nn is N-1, fila(Res, Nn, Ren).

columna([], _, []).
columna([R | Res], C, [E | RR]) :- columna(Res, C, RR), fila(R, C, E).

elem([_ | Res], N, Ren) :- Nn is N - 1, elem(Res, Nn, Ren).

diagonal([], _, []).
diagonal([R | Res], N, [E | D]) :- elem(R, N, E), Nn is N + 1, diagonal(Res, Nn, D).

diagonal2([], _, []).
diagonal2([R | Res], N, [E | D]) :- length(R, Len), C is Len - N + 1, elem(R, C, E), Nn is N+1, diagonal2(Res, Nn, D).

sum(0, 0).
sum(N, Suma) :- N > 0, N1 is N-1, sum(N1, Suma1), Suma is N + Suma1.

mus(N , 1) :- N=< 1.
mus(N, R) :- not(N=<1), N1 is N-1, mus(N1, R1), R is N+R1.

pablo(L, U) :- append(_, [U], L).

nexta(X, Y, [X, Y | _]).
nexta(X, Y, [_ | Z]) :- nexta(X, Y, Z).

tyrone(X, Y, Z) :- append(_, [X, Y | _], Z).

uniqua(X, L) :- append(_, [X | _], L).


