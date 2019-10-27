T = 10000;                      % tamanho do array
r = char(randi([0,1],1,T));     % array de 0s e 1s criado aleatoriamente
L = [2 3 4 5 6 7 8 9 10];       % array com os diferentes tamanhos de palavras
A = zeros(1, 9);                % array auxiliar 
entropy =  zeros(1, 9);         % array para armazenar as entropias

%loop para os diferentes tamanhos L de palavra
for aux1 = 1 : 9
    
    pat = (dec2bin(2^L(aux1)-1:-1:0))-'0';          % cria em uma matriz todas as combinações de palavra de tamanho L
    tam_n = max(size(pat));
    
   % loop para os diferentes patterns
    for aux = 1: tam_n
        
        %loop para percorrer o vetor randomico
        for i = 1 : T
            
            %loop para conferir se há pradrao
            for j = 1 : L(aux1)
                
                %se nao tem padrao, sai do loop
                if (r(i) ~= pat(aux, j))
                    break;   
                end
                A(aux1) = A(aux1) + 1;
            end
        end
    end
        p_A = A(aux1)/T;
        entropy(aux1) = - p_A*log(p_A); 
end

plot(entropy, L);
