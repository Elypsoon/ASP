%Función de Ackermann
n(1..10).
% Caso base: Ackermann(0, n) = n + 1
ackermann(0, N, R) :- N >= 0, R = N + 1, n(N), n(R).

% Caso: Ackermann(m, 0) = Ackermann(m-1, 1)
ackermann(M, 0, R) :- M > 0,M1 = M-1, ackermann(M1, 1, R), n(M), n(R).

% Caso recursivo: Ackermann(m, n) = Ackermann(m-1, Ackermann(m, n-1))
ackermann(M, N, R) :- M > 0, N > 0, N1 = N-1, ackermann(M, N1, R1), M1 = M-1, ackermann(M1, R1, R), n(N), n(R), n(M).

#show ackermann/3.