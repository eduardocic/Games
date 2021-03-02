function [out] = Moldura(jogo)
% =========================================================================
%
% jogo ...............: vetor a ter verificado a quantidade de dezenas
%                       pertencentes à Moldura.
%
% (*) Os números que compõem a Moldura:
% 
%     [ 1  2  3  4  5  6  10  11  15  16  20  21  22  23  24  25]
%
% =========================================================================
% Máscara da moldura.
MOLDURA   = [  1   2   3   4   5   6   10   11   15   16   20   21  ...
              22  23  24  25];          % 16 números pertencem à Moldura.

%%%  Variáveis auxiliares
quantidade = 0;          % Contador de variáveis da Moldura.
dezenas    = [];         % Quais números da Moldura saíram.


%%% Verifica no jogo quantos números sorteados pertencem à Moldura
for j = 1:16
    k = find( jogo == MOLDURA(j) );
    if ( isempty(k) )
    else
        quantidade = quantidade + 1;
        dezenas = [dezenas MOLDURA(j)];
    end    
end

%%% Saída da minha rotina.
out.quantidade = quantidade;
out.dezenas    = dezenas;
end   