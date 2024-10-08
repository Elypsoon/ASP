%Función que realiza el factorial de un número
n(1..200).

fac(0,1).
fac(N,R) :- R=N*Rt, fac(Fant, Rt), Fant=N-1, n(N), n(R).

#show fac/2.