function [out] = Fibonacci(jogo)
% =========================================================================
%
% jogo ...............: vetor a ter verificado a quantidade de dezenas
%                       pertencentes à sequência de Fibonacci.
%
% (*) Os números que compõem o conjunto de Fibonnaci são: 
% 
%                [ 1  2  3  5  8  13  21]
%
% =========================================================================
FIBONACCI = [ 1  2  3  5  8  13  21];    % O vetor possui tamanho 7.

%%%  Variáveis auxiliares
quantidade = 0;          % Contador de variáveis de Fibonacci.
dezenas    = [];         % Quais números de Fibonacci saíram.


%%% Verifica no jogo quantos números sorteados são da sequência de
%%% Fibonacci.
for j = 1:7
    k = find( jogo == FIBONACCI(j) );
    if ( isempty(k) )
    else
        quantidade = quantidade + 1;
        dezenas = [dezenas FIBONACCI(j)];
    end    
end


%%% Saída da minha rotina.
out.quantidade = quantidade;
out.dezenas    = dezenas;
end   