clear all; close all; clc;

%%% Carrega os parâmetros que chamam as funções. 
MainPath = pwd;
Folders  = {'funcoes_base';
            'funcoes_carater_geral';
            'funcoes_estatisticas';
            'funcoes_imprime'};
for i = 1:numel(Folders)
    Pasta = [MainPath '/' Folders{i}];
    rmpath(Pasta);
    addpath(Pasta);
end

%%% Carrega os parâmetros dos jogos realizados. 
[fileName, ~] = uigetfile('*.mat');
load(fileName);
String = split(fileName, '.');
fileName = String{1};
fileName = strcat('Resultado_', fileName);
fileName = strcat(fileName, '.txt');

%%% Faz a abertura do arquivo.
FILE = fopen(fileName, 'w');

% =========================================================================
% 
%                   Verifica quantas foram acertadas. 
%
%
jogoSorteado = sort([1 2 4 5 8 10 11 12 13 16 20 22 23 24 25]);
% =========================================================================
data = date;
for i = 1:max(size(JOGO))
    dezenas(i) = comparaJogos(jogoSorteado, JOGO{i}, 15); 
end

fprintf(FILE, '  ------------------------------------------------------------------------------------\n');
fprintf(FILE, '  |                                                                                  |\n');
fprintf(FILE, '  |                            FECHAMENTO DA LOTO FÁCIL                              |\n');
fprintf(FILE, '  |                                                                                  |\n');
fprintf(FILE, '  ------------------------------------------------------------------------------------\n\n');
fprintf(FILE, '\n\n');

%%% Números do fechamento inseridos. 
fprintf(FILE, 'Números pertencentes ao Fechamento: [');
for i = 1:max(size(numeros_no_fechamento))
    fprintf(FILE, '%3d ', numeros_no_fechamento(i));
end
fprintf(FILE, ']\n');

%%% Números excluídos do fechamento.
fprintf(FILE, 'Números pertencentes ao Fechamento: [');
for i = 1:max(size(numeros_excluidos_do_fechamento))
    fprintf(FILE, '%3d ', numeros_excluidos_do_fechamento(i));
end
fprintf(FILE, ']\n');

%%% Números do fechamento inseridos. 
fprintf(FILE, 'Números pertencentes ao Fechamento: [');
for i = 1:max(size(tJogo))
    fprintf(FILE, '%3d ', tJogo(i));
end
fprintf(FILE, ']\n\n');



for i = 1:max(size(JOGO))
   fprintf(FILE, 'jogo %3d = [', i);
   for j = 1:15
      fprintf(FILE, '%4d ', JOGO{i}(1,j));
   end
   fprintf(FILE, ']  -- %3d acertos ', dezenas(i));
   if (dezenas(i) >= 11)
       fprintf(FILE, '(tem prêmio)\n');
   else
       fprintf(FILE, '\n');
   end
end
fclose(FILE);


%% Faz uma verificação estatística dos jogos. 
% ==========================================
cont11 = find(dezenas == 11);
cont12 = find(dezenas == 12);
cont13 = find(dezenas == 13);
cont14 = find(dezenas == 14);
cont15 = find(dezenas == 15);


if (isempty(cont11))
    Ncont11 = 0;
else
    Ncont11 = max(size(cont11));
end

if (isempty(cont12))
    Ncont12 = 0;
else
    Ncont12 = max(size(cont12));
end

if (isempty(cont13))
    Ncont13 = 0;
else
    Ncont13 = max(size(cont13));
end

if (isempty(cont14))
    Ncont14 = 0;
else
    Ncont14 = max(size(cont14));
end

if (isempty(cont15))
    Ncont15 = 0;
else
    Ncont15 = max(size(cont15));
end  

fprintf(['O custo envolvido nas apostas foi de R$ ', num2str(max(size(JOGO))*2.5), '\n']);
fprintf(['A quantidade de jogos de 11 foi de ', num2str(Ncont11), ' -- o recebido total foi de R$ ', num2str(Ncont11*5), '\n']);
fprintf(['A quantidade de jogos de 12 foi de ', num2str(Ncont12), ' -- o recebido total foi de R$ ', num2str(Ncont12*10), '\n']);
fprintf(['A quantidade de jogos de 13 foi de ', num2str(Ncont13), ' -- o recebido total foi de R$ ', num2str(Ncont13*25), '\n']);
fprintf(['A quantidade de jogos de 14 foi de ', num2str(Ncont14), ' -- o recebido total foi de R$ ', num2str(Ncont14*1046.33), '\n']);
fprintf(['A quantidade de jogos de 15 foi de ', num2str(Ncont15), ' -- o recebido total foi de R$ ', num2str(Ncont15*1281983.38), '\n']);

