%Algorimo mejorado para el problema de las n reinas
#const n = 12.
row(1..n).
col(1..n).

% Aseguramos que cada fila tiene exactamente una reina, y se asignan las columnas directamente
1 { queen(I,J) : col(J) } 1 :- row(I).

% Aseguramos que haya exactamente n reinas en el tablero
:- n != { queen(I,J) : row(I), col(J) }.

% Restricción para que no haya dos reinas en la misma columna
:- queen(I1,J), queen(I2,J), I1 != I2.

% Restricción para que no haya dos reinas en la misma diagonal principal
:- queen(I,J), queen(II,JJ), I != II, J != JJ, I-J == II-JJ.

% Restricción para que no haya dos reinas en la misma diagonal secundaria
:- queen(I,J), queen(II,JJ), I != II, J != JJ, I+J == II+JJ.

#show queen/2.