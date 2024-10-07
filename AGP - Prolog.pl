% Gutiérrez Pacheco Ángel de Jesús Elvis

%% Problema 1: placa del uber

% Punto 1. Definir un predicado que permita determinar si un número N es un cubo perfecto.
es_cubo(N) :- N >= 0, A is round(N ** (1/3)), A * A * A =:= N.

% Punto 2. Definir un predicado que permita determinar si un número N puede ser escrito como la suma de dos cubos perfectos.
descompone(N, X, Y) :- between(0, N, X), Y is N - X, es_cubo(X), es_cubo(Y), X =< Y.

% Punto 3. Definir la relación profesor(N) que verifique si N puede descomponerse en la suma de dos cubos perfectos de dos maneras diferentes.
% Ejemplo: profesor(4104) es verdadero porque 4104 = 2^3 + 16^3 = 9^3 + 15^3.
profesor(N) :- findall((X, Y), descompone(N, X, Y), Par), length(Par, Cuenta), Cuenta =:= 2.

% Punto 4. Esta regla debe buscar el menor entero N tal que profesor(N) sea verdadero.
xavier(N) :- between(1, inf, N), profesor(N), !. %El ! es para indicar que no siga buscando más soluciones

%% Problema 2: subconjunto suma.

% Punto 5. Definir la relación subconjuntoSuma(L1, N, L2) que sea verdadera si L2 es un subconjunto de L1 y la suma de los elementos de L2 es igual a N.
subconjuntoSuma([], 0, []). % Caso base: Lista vacía y suma 0
subconjuntoSuma([Z|L1], N, [Z|L2]) :- N > 0, N1 is N - Z, subconjuntoSuma(L1, N1, L2). % Incluir el elemento en el subconjunto
subconjuntoSuma([_|L1], N, L2) :- subconjuntoSuma(L1, N, L2). % No incluir el elemento en el subconjunto

%% Problema 3: cifrado de la escítala.

% Definir la relación escitala(Texto, Columnas, TextoCifrado) que cifra el Texto utilizando el método de la escítala.
% Cifrado usando el método de la escítala
escitala(Text, Columns, CipherText) :-
    string_chars(Text, Chars),                          % Convertir el texto en lista de caracteres
    length(Chars, Length),                              % Obtener la longitud del texto
    Rows is ceiling(Length / Columns),                  % Calcular el número de filas necesarias
    create_grid(Chars, Columns, Grid),                  % Crear la matriz (grid) del texto
    read_columns(Grid, Columns, Rows, CipherChars),     % Leer por columnas
    string_chars(CipherText, CipherChars),              % Convertir los caracteres cifrados en un string
    !.

% Crea una matriz a partir de una lista de caracteres.
create_grid([], _, []). 
create_grid(List, Columns, [Row | Rest]) :-
    length(Row, Columns),                            % Crea una fila de tamaño `Columns`
    append(Row, RestList, List),                     % Divide la lista de caracteres en fila y resto
    RestList \= [],                                  % Asegurarse de que no esté vacía
    create_grid(RestList, Columns, Rest).            % Crear el resto de la matriz

create_grid(List, Columns, [Row | []]) :-            % Caso base: Última fila
    length(Row, N), N =< Columns,                    % Si la longitud de la fila es menor o igual a `Columns`
    append(Row, RestList, List),                     
    RestList = [].                                   

% Leer las columnas de la matriz para cifrar
read_columns(Grid, Columns, Rows, CipherChars) :-
    findall(Char, 
        (between(1, Columns, Col),                   % Iterar sobre las columnas
         between(1, Rows, Row),                      % Iterar sobre las filas
         nth1(Row, Grid, RowList),                   % Obtener la fila
         (   nth1(Col, RowList, Char)                % Obtener el carácter en la posición [Row, Col]
         ->  true                
         ;   fail 
         )), 
    CipherChars).