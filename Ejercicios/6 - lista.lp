
%Conjunto de valores para S
#const s=10.
num(1..s).

pair(S, X, Y) :- num(X), num(Y), S = X + Y, X <= Y, num(S).

#show pair/3.