clear all; close all; clc; 

%%% Fechamento entre os parâmetros.
nFechamento = 20;
garantiasFechamento = 14;

%%% Dezenas da composição do jogo.
dezenasAptas  = linspace(1, 25, 25);

%%% Números julgados interessantes de se colocar no fechamento
numeros_no_fechamento      = [13];      
size_numeros_no_fechamento = max(size(numeros_no_fechamento));

%%% Números julgados NÃO interessantes de se colocar no fechamento
numeros_excluidos_do_fechamento      = [23];          
size_numeros_excluidos_do_fechamento = max(size(numeros_excluidos_do_fechamento));

%%% Números que podem participar do sorteio. 
for i = 1:size_numeros_no_fechamento
    dezenasAptas = dezenasAptas (find (dezenasAptas ~= numeros_no_fechamento(i)));
end

for i = 1:size_numeros_excluidos_do_fechamento
    dezenasAptas = dezenasAptas (find (dezenasAptas ~= numeros_excluidos_do_fechamento(i)));
end
size_dezenasAptas = max(size(dezenasAptas));

%%% Quantidade de combinações máximas a escolher.
numeros_que_faltam_escolher = nFechamento - size_numeros_no_fechamento;
qntCombinacoesPossiveis = nchoosek(max(size(dezenasAptas)), numeros_que_faltam_escolher);

%%% Seleciona uma combinaçao randômica.
C = nchoosek(dezenasAptas, numeros_que_faltam_escolher);

%%% Qual jogo será empregado na análise.
tCombinacaoJogo = round(1 + max(size(C)) * rand(1));
tJogo = C(tCombinacaoJogo, :);
tJogo = sort([tJogo numeros_no_fechamento]);

%  Realiza o fechamento
% ======================
[JOGO] = fechamento(garantiasFechamento, tJogo);


% Inserção no dia 01/03/2021
flag     = 0;
contador = 0;
while(~flag)   
    %%% Pega um jogo. 
    tCombinacaoJogo = round(1 + max(size(C)) * rand(1));
    tJogo = C(tCombinacaoJogo, :);
    
    %%% Aumenta o jogo do sistema.
    tJogo = sort([tJogo numeros_no_fechamento]); 
    
    %%% Realiza o fechamento.
    [JOGO] = fechamento(garantiasFechamento, tJogo);
    
    %%% Levanta as estatísticas para esse fechamento.
    for i = 1:max(size(JOGO))
        % Pega o jogo;
        pickJogo = JOGO{i};

        % Aplica a estatística.
        matriz{i}  = Matriz(pickJogo);         % Filtro de Matriz (linhas e colunas).
        fibo{i}    = Fibonacci(pickJogo);      % Filtro de Fibonacci.
        moldura{i} = Moldura(pickJogo);        % Filtro de Moldura.
        pares{i}   = Pares(pickJogo);          % Filtro de Pares.
        primos{i}  = Primos(pickJogo);         % Filtro de Primos.
    end
    
    % Estatística do meu sistema em relação aos parâmetros que existem
    % dentro de cada conjunto de 5 parâmetros. 
    for i = 1:max(size(matriz))
       contMAX_matricial(i) = max(matriz{i}); 
       contMIN_matricial(i) = min(matriz{i}); 
    end
    
    % =====================================================================
    % Estatística para a soma das dezenas para exclusão das absurdas. 
    contSoma = 0;
    for i = 1:max(size(JOGO))
        soma(i) = sum(JOGO{i});
        if ( (soma(i) >= 160) & (soma(i) <= 230) )
            contSoma = contSoma + 1;
        end
    end
    % =====================================================================
    
    
    %%% Quantidade de conjuntos iguais (filtro matricial).
    qntCinco = max(size(find(contMAX_matricial == 5)));
    qntZero  = max(size(find(contMIN_matricial == 0)));
    if ( ((qntCinco/max(size(contMAX_matricial))) < 0.25) && (qntZero/max(size(contMIN_matricial)) < 0.015) && ...
         (contSoma/max(size(soma)) <= 0.95 ) )
        flag = 1;
        disp(['Conseguimos selecionar!!!']);
        disp(['% de 5: ' num2str(100*(qntCinco/max(size(contMAX_matricial)))) '%']);
        disp(['% de 0: ' num2str(100*(qntZero/max(size(contMIN_matricial)))) '%']);
        disp(['Percentual da soma: ' num2str(100*(contSoma/max(size(soma)))) '%']);
        disp(' ');
    else
        %%% Contador de entradas
        contador = contador + 1;
        disp(['Estamos indo para mais uma seleção. Entrada: ' num2str(contador)]);
        disp(['% de 5: ' num2str(100*(qntCinco/max(size(contMAX_matricial)))) '%']);
        disp(['% de 0: ' num2str(100*(qntZero/max(size(contMIN_matricial)))) '%']);
        disp(['Percentual da soma: ' num2str(100*(contSoma/max(size(soma)))) '%']);
        disp(' ');
    end
end

%%% Salva o resultado de hoje
dataHoje = date;
nameFile = strcat('Fechamento_', num2str(nFechamento));
nameFile = strcat(nameFile, '_');
nameFile = strcat(nameFile, num2str(garantiasFechamento));
nameFile = strcat(nameFile, '__');
nameFile = strcat(nameFile, 'DATA_');
nameFile = strcat(nameFile, dataHoje);
nameFile = strcat(nameFile, '.mat');
save(nameFile, 'JOGO', 'tJogo', 'numeros_no_fechamento', 'numeros_excluidos_do_fechamento');

%%% Imprime os jogos a serem realizados 
imprime_Jogos_Realizados(JOGO, tJogo, numeros_no_fechamento, numeros_excluidos_do_fechamento);
