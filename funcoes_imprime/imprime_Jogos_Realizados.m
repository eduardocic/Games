% =================================================================
%                       IMPRIME JOGOS
% =================================================================
function [] = imprime_Jogos_Realizados(JOGOS, tJogo, numeros_no_fechamento, numeros_excluidos_do_fechamento)

% Abre uma janela para selação de jogo a ser impresso.
[arquivo, caminho] = uigetfile('*.mat');
load(arquivo);
dataHoje = date;
nameFile = strcat('Jogos_Loto_Facil_sorteio_dia_',dataHoje);
nameFile = strcat(nameFile, '.txt');
file = fopen(nameFile,'w');

fprintf(file, '  +----------------------------------------------------------------------------------+\n');
fprintf(file, '  |                                                                                  |\n');
fprintf(file, '  |                             FECHAMENTO DA LOTO FÁCIL                             |\n');
fprintf(file, '  |                                                                                  |\n');
fprintf(file, '  +----------------------------------------------------------------------------------+\n\n');

%%% Números do fechamento inseridos. 
fprintf(file, 'Números pertencentes ao Fechamento: [');
for i = 1:max(size(numeros_no_fechamento))
    fprintf(file, '%3d ', numeros_no_fechamento(i));
end
fprintf(file, ']\n');

%%% Números excluídos do fechamento.
fprintf(file, 'Números excluídos do Fechamento: [');
for i = 1:max(size(numeros_excluidos_do_fechamento))
    fprintf(file, '%3d ', numeros_excluidos_do_fechamento(i));
end
fprintf(file, ']\n');

%%% Números do fechamento inseridos. 
fprintf(file, 'Números pertencentes ao Fechamento: [');
for i = 1:max(size(tJogo))
    fprintf(file, '%3d ', tJogo(i));
end
fprintf(file, ']\n\n');

%%% Dezenas a serem jogadas.
for i = 1:max(size(JOGO))
    fprintf(file, 'jogo %3d = [', i);
    for j = 1:15
        fprintf(file, '%4d ', JOGO{i}(1,j));
    end
    fprintf(file, ']\n');
end

fclose(file);
end