% Definición de ejemplo de grafo
node(a). node(b). node(c). node(d). node(e). node(f). node(g). node(h).

arc(a, b, 12).
arc(a, c, 2).
arc(b, c, 22).
arc(c, b, 9).
arc(c, d, 17).
arc(d, e, 14).
arc(d, f, 8).
arc(f, g, 2).
arc(g, c, 12).
arc(b, h, 9).
arc(h, d, 7).
arc(h, e, 11).

% Suma de los costos de los arcos
total(Costos) :- Costos = #sum { C,X,Y : arc(X,Y,C) }.

#show total/1.
