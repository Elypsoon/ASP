%Problema que resuelve el problema de las torres de Hanoi. Hecho en clingo

peg(a;b;c). %Torres
disk(1..4). %Discos
init_on(1..4,a). %Discos iniciales
goal_on(1..4,c). %Discos objetivo
moves(15). %Número de movimientos máximos

% Generate
{ move(D,P,T) : disk(D), peg(P) } = 1 :- moves(M), T = 1..M.
% Define
move(D,T) :- move(D,_,T).
on(D,P,0) :- init_on(D,P).
on(D,P,T) :- move(D,P,T).
on(D,P,T+1) :- on(D,P,T), not move(D,T+1), not moves(T).
blocked(D-1,P,T+1) :- on(D,P,T), not moves(T).
blocked(D-1,P,T) :- blocked(D,P,T), disk(D).
% Test
:- move(D,P,T), blocked(D-1,P,T).
:- move(D,T), on(D,P,T-1), blocked(D,P,T).
:- goal_on(D,P), not on(D,P,M), moves(M).
:- { on(D,P,T) } != 1, disk(D), moves(M), T = 1..M.
