function [out] = Pares(jogo)
% =========================================================================
%
% jogo ...............: vetor a ter verificado a quantidade de dezenas
%                       pertencentes aos números Pares.
%
% (*) Os números que compõem o conjunto dos Pares são: 
% 
%                [ 1  2  3  5  8  13  21]
%
% =========================================================================
PARES = [  2   4   6   8   10   12   14   16   18   20   22   24];    % 12 números no total.
        
%%%  Variáveis auxiliares
quantidade = 0;          % Contador de variáveis dos Pares.
dezenas    = [];         % Quais números Pares saíram.

%%% Verifica no jogo quantos números sorteados são da sequência de
%%% Pares.
for j = 1:12
    k = find( jogo == PARES(j) );
    if ( isempty(k) )
    else
        quantidade = quantidade + 1;
        dezenas = [dezenas PARES(j)];
    end    
end

%%% Saída da minha rotina.
out.quantidade = quantidade;
out.dezenas    = dezenas;
end   