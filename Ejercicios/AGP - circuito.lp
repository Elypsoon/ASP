%Gutiérrez Pacheco Ángel de Jesús Elvis

%%  Definiciones de componentes y conexiones

% Outside power
power(a).

% Definimos los componentes del sistema eléctrico
componente(s1). % Switch 1
componente(s2). % Switch 2 (Two way switch)
componente(s3). % Switch 3 (Two way switch)
componente(cb1).
componente(cb2).
componente(p1). 
componente(p2).
componente(l1).
componente(l2).

% Conexiones
conexion(a, cb1, w5).
conexion(a, cb2, w5). 
conexion(cb1, s1, w3).
conexion(s1, s2, w1).
conexion(s1, s2, w2).
conexion(s2, l1, w0).
conexion(cb2, p2, w6).
conexion(s3, l2, w4).
conexion(cb1,s3,w3).
conexion(w2, s2, w2).

%% Comportamiento, a partir de aquí se modela el comportamiento para simular el suministro de energía existente

% Modelar el comportamiento de los circuit breakers
breaker(cb1).
breaker(cb2). 
usable(cb1). % Esto indica que está en buen estado
usable(cb2).

% Para mantener encendidos o cerrados los switches
cerrado(s2).
cerrado(s3).
cerrado(cb1).
cerrado(cb2).
cerrado(a).

% La energía fluye si el breaker está en buen estado
energia(cb1) :- power(a), usable(cb1).
energia(cb2) :- power(a), usable(cb2).

% La energía fluye si hay una conexión y el switch está cerrado
energia(X) :- conexion(X, Y, _), energia(X), cerrado(X).

% Modela los Two way switch
energia(w5) :- cerrado(a).
energia(a) :- energia(w5).
energia(w3) :- cerrado(cb1).
energia(w2) :- cerrado(s2).
energia(w4) :- cerrado(s3).
energia(w6) :- cerrado(cb2).

% w1 no recibe energía porque s1 no está alimentando w1
energia(s2) :- energia(w1), cerrado(s2).

% La energía fluye desde cb2 a s3, y l2 se enciende
energia(s3) :- energia(cb1).
energia(s1) :- energia(w2).
energia(l2) :- energia(w4).

% La luz se enciende si recibe energía
luz_encendida(l2) :- energia(w4).
luz_encendida(l1) :- energia(w0).

% Para los enchufes
energia(p1) :- energia(cb1), usable(cb1).
energia(p2) :- energia(cb2), usable(cb2).

#show luz_encendida/1.
#show energia/1.