function [qntAcerto] = comparaJogos(jogo1, jogo2, qntDezenas) 

% Verifica a quantidade de numeros acertados.
% -------------------------------------------
cont = 0;
for i = 1:qntDezenas
   for j = 1:qntDezenas
       
       if ( jogo1(1, i) == jogo2(1, j) )
           cont = cont + 1;
       end
       
   end
end

qntAcerto = cont;

end