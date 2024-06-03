% Definición de los símbolos y sus probabilidades
symbols = {'S1', 'S2', 'S3'};
probabilities = [0.5, 0.2, 0.3];

% Secuencia a codificar
sequence = {'S1', 'S2', 'S1', 'S3', 'S2'};

% Inicialización de los intervalos
low = 0.0;
high = 1.0;

% Diccionario de probabilidades acumuladas
cumulative_prob = [0, cumsum(probabilities)];

% Codificación aritmética
for i = 1:length(sequence)
    symbol = sequence{i};
    idx = find(strcmp(symbols, symbol));
    
    range = high - low;
    high = low + range * cumulative_prob(idx + 1);
    low = low + range * cumulative_prob(idx);
end

% El resultado es un número dentro del intervalo final [low, high)
encoded_value = (low + high) / 2;

% Mostrar el valor codificado
fprintf('El valor codificado es: %.10f\n', encoded_value);
