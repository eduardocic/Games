function [matriz] = Matriz(jogo)
% =========================================================================
%
% jogo ...............: vetor a ter verificado a quantidade de dezenas
%                       pertencentes aos grupos de 5 dezenas (1 a 5, ...,
%                       21 a 25).
%
% =========================================================================
MATRIZ    = [  1   2   3   4   5;
               6   7   8   9  10;
              11  12  13  14  15;
              16  17  18  19  20;
              21  22  23  24  25];

%%%  Variáveis auxiliares
quantidade = 0;               % Contador de variáveis da Matriz.
matriz     = zeros(5,1);      % Quais números da Matriz saíram.


%%% Verifica no jogo quantos números sorteados são agrupados nos conjuntos.
l{1} = find( jogo <= 5 );
l{2} = find( (jogo >= 6) & (jogo <= 10) );
l{3} = find( (jogo >= 11) & (jogo <= 15) );
l{4} = find( (jogo >= 16) & (jogo <= 20) );
l{5} = find( (jogo >= 21) & (jogo <= 25) );

%%% Saída do meu sistema. 
matriz(1) = numel(l{1});
matriz(2) = numel(l{2});
matriz(3) = numel(l{3});
matriz(4) = numel(l{4});
matriz(5) = numel(l{5});
end   
