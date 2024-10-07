% Definir el valor de n.
n(3).

% Calcular la potencia 2^n
exp2(N, E) :- n(N), E = 2 ** N.

% Generar valores de I para la sumatoria desde i = 0 hasta n-1
sum_element(I, N, Value) :- n(N), I = 0..N-1, Value = 2 ** I * N.

% Calcular la sumatoria completa
sumatoria(Sum) :- n(N), Sum = #sum { Value : sum_element(_, N, Value) }.

% Calcular el resultado final S = 2^n * sumatoria
resultado(N, S) :- n(N), exp2(N, Exp2N), sumatoria(Sum), S = Exp2N * Sum.

#show resultado/2.
