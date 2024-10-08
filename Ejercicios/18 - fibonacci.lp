%Programa que realiza la serie de fibonacci
n(0..100).
% Caso base para Fibonacci
fibonacci(0, 0).
fibonacci(1, 1).

% Caso recursivo para Fibonacci
fibonacci(N,F) :- N1 = N2+1, N = N1+1, fibonacci(N1,F1), fibonacci(N2,F2), F = F1 + F2, n(N), n(F).

#show fibonacci/2.
