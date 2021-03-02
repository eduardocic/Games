function [soma, fibonacci, moldura, pares] = parametrosEstatisticos(historicoLotoFacil)

%%% Números a serem empregados na estatística.
MOLDURA   = [ 1  2  3  4  5  6 10 11 15 16 20 21 22 23 24 25];
FIBONACCI = [ 1  2  3  5  8 13 21];
PRIMOS    = [ 1  2  3  5  7 11 13 17 19 23];
PARES     = [ 2  4  6  8 10 12 14 16 18 20 22 24];
IMPARES   = [ 1  3  5  7  9 11 13 15 17 19 21 23 25];
MATRIZ    = [ 1  2  3  4  5;
              6  7  8  9 10;
             11 12 13 14 15;
             16 17 18 19 20;
             21 22 23 24 25];

%%% Roda os parâmetros de métrica sobre o histórico de resultados.
nMax    = max(size(historicoLotoFacil));

for i = 1:nMax
    
    %%% Captura o jogo
    jogo{i}      = historicoLotoFacil(i).dezenasSorteadas;
    
    %%% Faz a análise estatística para cada variável.
    soma(i)      = SomaDezenas(jogo{i});
    fibonacci{i} = Fibonacci(jogo{i});
    moldura{i}   = Moldura(jogo{i});
    pares{i}     = Pares(jogo{i});
    primos{i}    = Primos(jogo{i});
end

end

 % Quantidade de objetos
% n = max(size(historico.resultadoLotoFacil));
% 
% % -------------------------------------------------------------
% %                Estatística de SOMA DEZENAS
% % -------------------------------------------------------------
% vSoma = zeros(1, n);
% for i = 1:n
%     vSoma(i) = historico.resultadoLotoFacil(i).somaDezenas;
% end
% historico.estatistica.DEZENAS.soma                    = vSoma;
% historico.estatistica.DEZENAS.mediaSomaDezenas        = mean(vSoma);
% historico.estatistica.DEZENAS.desvioPadraoSomaDezenas = std(vSoma);
% 
% % Demais ajustes.
% mu    = historico.estatistica.DEZENAS.mediaSomaDezenas;
% sigma = historico.estatistica.DEZENAS.desvioPadraoSomaDezenas;
% intSigma{1} = [(mu - 1*sigma) (mu + 1*sigma)];
% intSigma{2} = [(mu - 2*sigma) (mu + 2*sigma)];
% intSigma{3} = [(mu - 3*sigma) (mu + 3*sigma)];
% intSigma{4} = [(mu - 4*sigma) (mu + 4*sigma)];
% 
% vSomaDezenas = zeros(1, 4);
% for i = 1:n
%     k = vSoma(i);
%     
%     if ( (intSigma{1}(1) <= k) & (k <= intSigma{1}(2)) )
%         vSomaDezenas(1) = vSomaDezenas(1) + 1;
%     elseif ((intSigma{2}(1) <= k) & (k <= intSigma{1}(1)) | (intSigma{1}(2) <= k) & (k <= intSigma{2}(2)) )
%         vSomaDezenas(2) = vSomaDezenas(2) + 1;
%     elseif ((intSigma{3}(1) <= k) & (k <= intSigma{2}(1)) || (intSigma{2}(2) <= k) & (k <= intSigma{3}(2)) )
%         vSomaDezenas(3) = vSomaDezenas(3) + 1;
%     else
%         vSomaDezenas(4) = vSomaDezenas(4) + 1;
%     end
% end
% historico.estatistica.DEZENAS.dentroSigma = vSomaDezenas;
% historico.estatistica.DEZENAS.intSigma = intSigma;
% 
% 
% % -------------------------------------------------------------
% %                 Estatística de Fibonacci
% % -------------------------------------------------------------
% vFibonacci = zeros(1, n);
% for i = 1:n
%     vFibonacci(i) = sum(historico.resultadoLotoFacil(i).fibonacci);
% end
% historico.estatistica.FIBONACCI.qntFibonacci = vFibonacci;
% 
% clear vFibonacci
% vFibonacci = zeros(1, 7);
% for i = 1:n
%     k = historico.estatistica.FIBONACCI.qntFibonacci(i);
%     vFibonacci(k) = vFibonacci(k) + 1;
% end
% historico.estatistica.FIBONACCI.freqFibonacci = vFibonacci;
% 
% 
% % -------------------------------------------------------------
% %                  Estatística de Moldura
% % -------------------------------------------------------------
% vMoldura = zeros(1, n);
% for i = 1:n
%     vMoldura(i) = sum(historico.resultadoLotoFacil(i).moldura);
% end
% historico.estatistica.MOLDURA.qntMoldura = vMoldura;
% 
% vMoldura =  zeros(1, size(MOLDURA, 2));
% for i = 1:n
%     k = historico.estatistica.MOLDURA.qntMoldura(i);
%     vMoldura(k) = vMoldura(k) + 1;
% end
% historico.estatistica.MOLDURA.freqMoldura = vMoldura;
% 
% 
% % -------------------------------------------------------------
% %                  Estatística de Primos
% % -------------------------------------------------------------
% vPrimos = zeros(1, n);
% for i = 1:n
%     vPrimos(i) = sum(historico.resultadoLotoFacil(i).primos);
% end
% historico.estatistica.PRIMOS.qntPrimos = vPrimos;
% 
% vPrimos =  zeros(1, size(PRIMOS, 2));
% for i = 1:n
%     k = historico.estatistica.PRIMOS.qntPrimos(i);
%     vPrimos(k) = vPrimos(k) + 1;
% end
% historico.estatistica.PRIMOS.freqPrimos = vPrimos;
% 
% % -------------------------------------------------------------
% %                 Estatística de Pares e ímpares
% % -------------------------------------------------------------
% vPares   = zeros(1, n);
% vImpares = zeros(1, n);
% for i = 1:n
%     vPares(i)   = sum(historico.resultadoLotoFacil(i).pares);
%     vImpares(i) = sum(historico.resultadoLotoFacil(i).impares);
% end
% historico.estatistica.PARES.qntPares     = vPares;
% historico.estatistica.IMPARES.qntImpares = vImpares;
% 
% vPares   =  zeros(1, size(PARES, 2));
% vImpares =  zeros(1, size(IMPARES, 2));
% for i = 1:n
%     k1 = historico.estatistica.PARES.qntPares(i);
%     k2 = historico.estatistica.IMPARES.qntImpares(i);
%     vPares(k1)   = vPares(k1) + 1;
%     vImpares(k2) = vImpares(k2) + 1;
% end
% historico.estatistica.PARES.freqPares = vPares;
% historico.estatistica.IMPARES.freqImpares = vImpares;
% end