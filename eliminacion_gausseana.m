% Preguntar cuantas variables va a haber en la matriz cuadrada
prompt = "¿Cuántas variables deseas en tu matriz?: ";
n = input(prompt);

disp("Ingresa los elementos de la matriz A:");
MatrizA = zeros(n);
MatrizB = zeros(n,1);

for fila = 1:n
    fprintf('\nFila %d:\n', fila);
    for columna = 1:n
        prompt = sprintf('Ingresa el elemento en la posición (%d, %d) para la matriz A: ', fila, columna);
        MatrizA(fila, columna) = input(prompt);
    end

    % Obtener elementos para la Matriz B
    prompt = sprintf('\nIngresa el elemento para la matriz B(%d): ', fila);
    MatrizB(fila) = input(prompt);
end

disp("Tu matriz A es:");
disp(MatrizA);

disp("Tu matriz B es:");
disp(MatrizB);



% Algoritmo:

% Verificar si el elemento en la posición (1,1) de la matriz A es igual a 0
if MatrizA(1, 1) == 0
    disp("El elemento en la posición (1,1) de la matriz A es igual a 0.");
    disp("");
    disp("Cerrando el programa...");
    return; % Salir del bucle y detener la ejecución.
else
    disp("El elemento en la posición (1,1) de la matriz A NO es igual a 0. --> Se puede continuar");
end


% Verificar que el determinante NO sea distinto de 0
if det(MatrizA) == 0
    disp("El determinante de la matriz A es igual a 0.");
    disp("");
    disp("Cerrando el programa...");
    return; % Salir del bucle y detener la ejecución.
else
    disp("El determinante de la matriz es NO igual a 0. --> Se puede continuar");
end


% Hacer las operaciones:
for i = 1:n-1
    for j = i+1:n
        factorElemento = MatrizA(j, i) / MatrizA(i, i);

        MatrizA(j, :) = MatrizA(j, :) - factorElemento * MatrizA(i, :);
        MatrizB(j) = MatrizB(j) - factorElemento * MatrizB(i);
    end
end

disp("Matriz A después de las operaciones:");
disp(MatrizA);

disp("Matriz B después de las operaciones:");
disp(MatrizB);



% Resolver el sistema de ecuaciones mediante sustitución hacia atrás
solucion = zeros(n, 1);

for i = n:-1:1
    solucion(i) = MatrizB(i) / MatrizA(i, i);
    for j = i-1:-1:1
        MatrizB(j) = MatrizB(j) - MatrizA(j, i) * solucion(i);
    end
end

disp("La solución del sistema de ecuaciones es:");
disp(solucion);

