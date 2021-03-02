function M = estatistica_ocorrencia(resultadoLotoFacil)

%%% Quantidade máxima de jogos. 
nMax = max(size(resultadoLotoFacil));
mHistorico = zeros(nMax, 25);

%%% Variáveis que estão em GAP
for i = 1:nMax
    
    b = resultadoLotoFacil(i).dezenasSorteadas;
    k = 0;
    
    for j = 1:25
        b2 = (b == j);
        if (sum(b2) < 1)
        else
            mHistorico(i, j) = 1;
        end
    end
end

M = mHistorico;
end