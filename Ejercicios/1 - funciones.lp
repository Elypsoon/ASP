% Conjunto de valores para N
% Para sustituir en el #int, indicas el conjunto de valores que puede tomar la variable
% Básicamente es el equivalente del -N=4 de DLV, pero especificado en el programa
n(1..4).

% A) Definir las funciones g y f

%Esto se mantiene igual que en DLV, es el caso base
g(1, 1).

% g(N, R) :- N>0, #prec(N, N1), g(N1, Rp), R = Rp + 2, #int(N), #int(R). Esto es en DLV, para que veas la diferencia
g(N, R) :- N1 = N - 1, g(N1, Rp), R = Rp + 2, n(N), n(R).

% n(R) y n(N) es el equivalente a #int(R) y #int(N) en DLV, N y R toma los valores del conjunto n
% No es necesario el N>0, ya que el conjunto n ya lo limita
% En clingo se pueden manejar operaciones matemáticas directamente, por lo que no es necesario el #prec
% #prec(N, N1) equivale a N1 = N -1, ya que #prec es un operador que resta 1 al valor de N

f(1, 1).

% f(N) = f(N-1) + g(N) para N > 1
f(N, R) :- N1 = N - 1, f(N1, Rp), g(N, Rpg), R = Rp + Rpg, n(N), n(R).
% Lo dicho en g aplica aquí igual

% B) Definir la función z

% z(1) = f(1)
z(1, R) :- f(1, R).

% z(N) = f(N) + z(N-1) para N > 1
z(N, R) :- N1 = N - 1, f(N, Rp), z(N1, Rz), R = Rp + Rz, n(N), n(R).

% Mostramos los resultados, en clingo es especificar qué mostrar
% Si comparas los resultados con la versión en DLV con N=4, deberían ser los mismos.
#show g/2.
#show f/2.
#show z/2.