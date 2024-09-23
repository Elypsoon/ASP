%Programa que resuelve el problema de las jarras. Hecho en Prolog.

% Goal
meta(estado(4,_)).

                  % CJG= amount of water in the large jug,   CJP= amount of water in the small jug
                  % MJG= maximum capacity of the large jug,    MJP= maximum capacity of the small jug.

%fill the large jug
posible(estado(CJG,CJP), estado(CJG1, CJP), MJG, _):- CJG>=0, CJG < MJG, CJG1 is MJG.

% fill the small jug
posible(estado(CJG,CJP), estado(CJG, CJP1), _, MJP):- CJP>=0, CJP < MJP, CJP1 is MJP.

% empty the large jug
posible(estado(CJG,CJP),estado(CJG1,CJP), _, _):- CJG > 0, CJG1 is 0.

% empty the small jug
posible(estado(CJG,CJP),estado(CJG,CJP1), _, _):- CJP > 0, CJP1 is 0.

% Pour the water from the large jug into the small jug and the amount of water in the large jug is LESS than the amount of water left to fill the small jug CJP
posible(estado(CJG,CJP),estado(CJG1,CJP1), _, MJP):- CJG > 0, CJP < MJP, CJG =< (MJP - CJP), CJG1 is 0, CJP1 is CJP + CJG.

% Pour the water from the large jug into the small jug and the amount of water in the large jug is MORE than the amount of water left to fill the small jug CJP
posible(estado(CJG,CJP),estado(CJG1,CJP1), _, MJP):- CJG > 0, CJP < MJP, CJG > (MJP - CJP), CJG1 is CJG - (MJP - CJP), CJP1 is MJP.

% Pour the water from the small jug into the large jug and the amount of water in the small jug is LESS than the amount of water left to fill the large jug CJG
posible(estado(CJG,CJP),estado(CJG1,CJP1), MJG, _):- CJP > 0, CJG < MJG, CJP =< (MJG - CJG), CJP1 is 0, CJG1 is CJG + CJP .

% Pour the water from the small jug into the large jug and the amount of water in the small jug is MORE than the amount of water left to fill the small jug CJG
posible(estado(CJG,CJP),estado(CJG1,CJP1), MJG, _):- CJP > 0, CJG < MJG, CJP > (MJG - CJG), CJP1 is CJP - (MJG - CJG), CJG1 is MJG.

          /* COMPARE THE NEW STATE WITH THE PREVIOUS */
miembro(X,[X|_]).
miembro(X,[_|L]):-miembro(X,L).

         /* IMPLEMENTING THE SOLUTION */

solucion([E|L],[E|L],MJG,MJP):-meta(E).
solucion([E|L],LS,MJG,MJP):- posible(E,EP,MJG,MJP),not(miembro(EP,L)),solucion([EP,E|L],LS,MJG,MJP).