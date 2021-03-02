function [out] = Primos(jogo)
% =========================================================================
%
% jogo ...............: vetor a ter verificado a quantidade de dezenas
%                       pertencentes aos números Primos.
%
% (*) Os números que compõem o conjunto dos números primos são: 
% 
%             [ 1   2   3   5   7   11   13   17   19   23]
%
% =========================================================================
PRIMOS    = [ 1  2  3  5  7  11  13  17  19  23];

%%%  Variáveis auxiliares
quantidade = 0;          % Contador de variáveis de Primos.
dezenas    = [];         % Quais números Primos saíram.

%%% Verifica no jogo quantos números sorteados são Primos
for j = 1:7
    k = find( jogo == PRIMOS(j) );
    if ( isempty(k) )
    else
        quantidade = quantidade + 1;
        dezenas = [dezenas PRIMOS(j)];
    end    
end

%%% Saída da minha rotina.
out.quantidade = quantidade;
out.dezenas    = dezenas;
end   