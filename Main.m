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

%%% Faz a limpeza da tela, caso necessário.
fprintf('Carregando banco de dados... \n');

%%% Carrega histório de forma direta.
FILE = readtable('HistoricoLotoFacil.xls');
FILE = table2cell(FILE);

%%% Identifica o instante em que se deve iniciar a contagem dos parâmetros.
for i = 1:10
    if (strcmp(FILE(i,1), 'Concurso') == 1)
        nInicio = i + 1;
        break
    end
end

%%% Pegar os parâmetros numéricos.
cont = 0;
for i = nInicio:size(FILE, 1)
    
    if (strcmp(FILE(i,1), '') == 1)
        % não faz nada
    else
        % Atualiza o contador
        cont = cont + 1;
        
        % Pega o concurso
        intermed = char(FILE(i, 1));
        resultadoLotoFacil(cont).concurso = str2num(intermed);
        
        % Pega a data da realização do concurso
        resultadoLotoFacil(cont).dataConcurso = char(FILE(i, 2));
        
        % Pega os números sorteados
        intermed = char(FILE(i, 3:17));
        resultadoLotoFacil(cont).dezenasSorteadas = sort(str2num(intermed)');
    end
end
clc
fprintf('Banco de dados carregado e estatística realizada.\n\n');

%%% Faz as análises estatísticas.
[soma, fibonacci, moldura, pares] = parametrosEstatisticos(resultadoLotoFacil);

%%% Imprime a tabela.
% imprime_Gap(resultadoLotoFacil);

%%% Matriz de ocorrência.
ocorrenciaEventos = estatistica_ocorrencia(resultadoLotoFacil);

%%% Faz a verificação de ocorrência dentro das linhas. 
estatisticaLinhas = [];
for i = 1:max(size(resultadoLotoFacil))
    estatisticaLinhas = [estatisticaLinhas; Matriz(resultadoLotoFacil(i).dezenasSorteadas)'];
end

l1 = estatisticaLinhas(:,1);
l2 = estatisticaLinhas(:,2);
l3 = estatisticaLinhas(:,3);
l4 = estatisticaLinhas(:,4);
l5 = estatisticaLinhas(:,5);


n1 = max(size(find(l1 == 0)));
n2 = max(size(find(l2 == 0)));
n3 = max(size(find(l3 == 0)));
n4 = max(size(find(l4 == 0)));
n5 = max(size(find(l5 == 0)));
sumN = n1 + n2 + n3 + n4 + n5;


cont = 0;
for i = 1:max(size(estatisticaLinhas))
    M = estatisticaLinhas(i,:);
    if (~isempty(find(M == 5)))
        cont = cont + 1;
        alpha (cont) = i;
        tam(cont) = max(size((find(M==5))));
    end    
end



