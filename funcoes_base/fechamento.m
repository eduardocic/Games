function [filtroJOGO] = fechamento(valorFechamento, dezenasFechamento)
% =========================================================================
%
% Esta função gera os parâmetros de fechamento para uma análise de jogos. 
% 
% 1. valorFechamento ..............: quantidade de acertos caso 15 das
%                                   'qntDezenas' acertadas saiam. 
% 2. dezenasFechamento ............: quantidade de dezenas selecionadas
%                                    dentro das quais deseja-se acertas os
%                                    números. 
% =========================================================================

% Combinação dos parâmetros dentro dos quais escolherei os jogos de 15.
nMax = max(size(dezenasFechamento));
v = 1:1:nMax;
C = nchoosek(v, 15);

% Cria todos os jogos com base na argumentação dos parâmetros de entrada.
for i = 1:size(C,1)
    for j = 1:size(C,2)
        gameFull{i}(1, j) = dezenasFechamento(1, C(i,j));
    end
end

% Eliminar os jogos de dezenas que são iguais. 
filtroJOGO{1} = gameFull{1};
cont = 1;
for i = 2:max(size(gameFull))
    
    for j = 1:max(size(filtroJOGO))
        [qntAcerto(j)] = comparaJogos(gameFull{i}, filtroJOGO{j}, 15); 
    end
    
    if (max(qntAcerto) < valorFechamento)
        clear qntAcerto
        cont = cont + 1;
        filtroJOGO{cont} = gameFull{i};
    end 
end




