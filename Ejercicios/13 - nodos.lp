% Definir las aristas del nodo
arc(a, b).
arc(a, c).
arc(b, d).
arc(c, d).
arc(d, e).

% Tomar los nodos únicos de las aristas
node(N) :- arc(N, _).
node(N) :- arc(_, N).

% Contar los nodos únicos
count(N) :- N = #count { X : node(X) }.

#show count/1.