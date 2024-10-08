%Programa que realiza el triángulo de pascal
n(0..10).
%Primero definimos el factorial|
fac(0,1).
fac(N,R) :- R=N*Rt, fac(Fant, Rt), Fant = N-1,n(N), n(R), N>0.

coefB(N, K, Resul) :- fac(N,Num), fac(K,Fk), Nk=N-K, fac(Nk, FNk), Den = Fk * FNk, Resul = Num / Den. 

#show coefB/3.