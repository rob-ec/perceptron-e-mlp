% Rede Neural Perceptron para a porta lógica OU
%
% @author Robson Mesquita Gomes <robson.mesquita56@gmail.com>
%
% MATLAB R2023b

function main()
    % Define a semente para a geração de números aleatórios
    rng(0);

    % Dados de treinamento
    X = [0 0; 0 1; 1 0; 1 1];
    y = [0; 1; 1; 1];  % Saída esperada

    % Inicialização dos pesos e viés (bias)
    pesos = rand(1, 2);
    vies = rand(); % (bias)

    % Taxa de aprendizado
    taxa_de_aprendizado = 0.5;

    % Número de épocas (iterações)
    epocas = 100;

    % Treinamento do Perceptron
    [pesos, vies] = treinar_perceptron(X, y, pesos, vies, taxa_de_aprendizado, epocas);

    % Plotagem dos pontos e da reta
    plotar_resultados(X, pesos, vies);
end

% Função de ativação
function saida = ativacao(x)
    saida = x >= 0;
end

% Função de treinamento
function [pesos_atualizados, vies_atualizado] = treinar_perceptron(X, y, pesos, vies, taxa_de_aprendizado, epocas)
    for epoca = 1:epocas
        for i = 1:size(X, 1)
            % Cálcular saída do Perceptron
            saida = ativacao(X(i, :) * pesos' + vies);

            % Atualizaar pesos e viés (bias)
            pesos = pesos + taxa_de_aprendizado * (y(i) - saida) * X(i, :);
            vies = vies + taxa_de_aprendizado * (y(i) - saida);
        end
    end

    pesos_atualizados = pesos;
    vies_atualizado = vies;
end

% Função de plotagem de pontos e reta
function plotar_resultados(X, pesos, vies)

    scatter(X(:, 1), X(:, 2), 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r');

    hold on;

    valores_em_x = -0.2:0.01:1.2;
    valores_em_y = (-vies - pesos(1) * valores_em_x) / pesos(2);

    plot(valores_em_x, valores_em_y, 'g--');

    xlabel('Entrada 1');
    ylabel('Entrada 2');

    title('Porta Lógica OR');

    legend('0', '1', 'Linha de Decisão');

    grid on;

    hold off;
end