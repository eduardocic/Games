% =================================================================
%                  IMPRIME JOGOS PARA ANÁLISE
% =================================================================
function [] = imprime_Gap(resultadoLotoFacil)

dataHoje = date;
nameFile = strcat('historico_sorteio_dia_',dataHoje);
nameFile = strcat(nameFile, '.txt');
file = fopen(nameFile,'w');

fprintf(file, '  +----------------------------------------------------------------------------------+\n');
fprintf(file, '  |                                                                                  |\n');
fprintf(file, '  |                                GAP DA LOTO FÁCIL                                 |\n');
fprintf(file, '  |                                                                                  |\n');
fprintf(file, '  +----------------------------------------------------------------------------------+\n\n');

for i = 1:max(size(resultadoLotoFacil))
    fprintf(file, 'Concurso %5d = [', i);
    
    b = resultadoLotoFacil(i).dezenasSorteadas;
    k = 0;
    for j = 1:25
        b2 = (b == j);
        
        if (sum(b2) < 1)
            fprintf(file, '  ** ');
        else
            k = k + 1;
            fprintf(file, '%4d ', resultadoLotoFacil(i).dezenasSorteadas(1, k));
        end
    end
    fprintf(file, ']\n');
end
fclose(file);
end