-- Active: 1726576516959@@localhost@1234@20242_ipi_pbdi_stephanie@public

-- 1. Exercícios:

-- 1.1 Resolva cada exercício a seguir usando LOOP, WHILE, FOR e FOREACH. Quando o 
-- enunciado disser que é preciso “ler” algum valor, gere-o aleatoriamente.

-- 1.1.1 Escreva um programa que imprima todos os números pares entre 1 e 100, incluindo-os se for o caso.
-- VERSÃO LOOP
DO $$  
DECLARE
    numero INT := 1;  -- Declara uma variável inteira 'numero' e inicializa com 1
BEGIN
    LOOP  
        IF numero % 2 = 0 THEN  -- Verifica se 'numero' é par
            RAISE NOTICE '%', numero;  -- Se 'numero' for par, exibe uma mensagem no console com o valor de 'numero'
        END IF;  
        numero := numero + 1;  -- Incrementa 'numero' em 1
        EXIT WHEN numero > 100;  -- Sai do loop se 'numero' for maior que 100
    END LOOP; 
END; 
$$; 

-- VERSÃO WHILE
DO $$
DECLARE
    numero INT := 1;  -- Declara uma variável 'numero' do tipo inteiro e inicializa com o valor 1
BEGIN
    WHILE numero <= 100 
        LOOP  -- Inicia um loop que continuará enquanto 'numero' for menor ou igual a 100
            IF numero % 2 = 0 THEN  -- Verifica se o valor de 'numero' é par (resto da divisão por 2 igual a 0)
                RAISE NOTICE '%', numero;
            END IF;

            numero := numero + 1; 
        END LOOP;  
END;
$$;

-- VERSÃO FOR
DO $$
BEGIN
    FOR numero IN 2..100 BY 2  -- Inicia um loop 'FOR' que vai de 2 até 100, com incremento de 2
        LOOP
            RAISE NOTICE '%', numero;
        END LOOP; 
END;
$$;

-- VERSÃO FOREACH
DO $$
DECLARE
    vetor INT[] := ARRAY[2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100];
    -- Declara um vetor (array) de inteiros contendo números pares de 2 até 100
    numero INT; -- Declara uma variável 'numero' do tipo inteiro para armazenar os valores do array durante a iteração
BEGIN
    FOREACH numero IN ARRAY vetor -- Inicia um loop 'FOREACH', percorrendo cada elemento do array 'vetor'
        LOOP
            RAISE NOTICE '%', numero;
        END LOOP;
END;
$$;


-- 1.1.2 Gerar inteiros no intervalo de -50 a 50.
-- Escreva um programa que leia 6 números. Esses números serão apenas positivos ou 
-- negativos (desconsidere valores nulos). Imprima o número total de números positivos.
-- VERSÃO LOOP
DO $$ 
DECLARE
    iteracao INT := 1;  
    valor INT;  
    total_positivo INT := 0;  -- Declara e inicializa a variável 'total_positivo' para contar quantos números positivos foram gerados
BEGIN
    LOOP  
        valor := valor_aleatorio_entre(-50, 50);  -- Atribui à variável 'valor' um número aleatório entre -50 e 50
        RAISE NOTICE '%', valor;  

        IF valor > 0 THEN  -- Se o valor for maior que 0 (positivo)
            total_positivo := total_positivo + 1;  -- Incrementa o contador 'total_positivo'
        END IF;

        iteracao := iteracao + 1;  -- Incrementa o valor de 'iteracao' em 1
        EXIT WHEN iteracao > 6;  -- Sai do loop quando 'iteracao' for maior que 6 (ou seja, após 6 iterações)
    END LOOP;

    RAISE NOTICE '% valores positivos', total_positivo;  -- Exibe o total de valores positivos gerados
END;
$$;

-- VERSÃO WHILE
DO $$  
DECLARE
    iteracao INT := 1;  
    valor INT;  
    total_positivo INT := 0;  
BEGIN
    WHILE iteracao <= 6  -- Inicia um loop WHILE, que será executado enquanto 'iteracao' for menor ou igual a 6
        LOOP
            valor := valor_aleatorio_entre(-50, 50);  
            RAISE NOTICE '%', valor;  

            IF valor > 0 THEN  
                total_positivo := total_positivo + 1;  -- Incrementa a contagem de valores positivos
            END IF;

            iteracao := iteracao + 1;  -- Incrementa a variável 'iteracao' em 1, controlando o número de iterações
        END LOOP;  -- Fim do loop WHILE, volta para a condição 'WHILE iteracao <= 6'

    RAISE NOTICE '% valores positivos', total_positivo;  
END;
$$;

-- VERSÃO FOR
DO $$  
DECLARE
    valor INT;  
    total_positivo INT := 0;  
BEGIN
    FOR iteracao IN 1..6 LOOP  -- Inicia um loop FOR que será executado 6 vezes, de iteracao = 1 até iteracao = 6
        valor := valor_aleatorio_entre(-50, 50);  -- Gera um valor aleatório entre -50 e 50 e atribui à variável 'valor'
        RAISE NOTICE '%', valor; 

        IF valor > 0 THEN 
            total_positivo := total_positivo + 1; 
        END IF;
    END LOOP;  

    RAISE NOTICE '% valores positivos', total_positivo;
END;
$$;

-- VERSÃO FOREACH
DO $$  
DECLARE
    vetor INT[] := ARRAY[1, 2, 3, 4, 5, 6];  -- Declara um array com 6 elementos (de 1 a 6) para controlar o número de iterações
    iteracao INT;  
    valor INT;  
    total_positivo INT := 0;  
BEGIN
    FOREACH iteracao IN ARRAY vetor LOOP  -- Inicia um loop FOREACH que percorre cada valor do array 'vetor'
        valor := valor_aleatorio_entre(-50, 50);  
        RAISE NOTICE '%', valor;  

        IF valor > 0 THEN 
            total_positivo := total_positivo + 1;
        END IF;
    END LOOP; 

    RAISE NOTICE '% valores positivos', total_positivo;
END;
$$;


-- 1.1.3 Gerar inteiros no intervalo de 20 a 50.
-- Leia dois valores inteiros X e Y. Imprima a soma de todos os valores ímpares entre eles.
-- VERSÃO LOOP
DO $$  
DECLARE
    x INT := valor_aleatorio_entre(20, 50);  -- Gera um valor aleatório entre 20 e 50 e atribui a 'x'
    y INT := valor_aleatorio_entre(20, 50);  -- Gera outro valor aleatório entre 20 e 50 e atribui a 'y'
    swap INT;  -- Declara a variável 'swap' que será usada para trocar os valores de 'x' e 'y'
    soma INT := 0;  -- Declara a variável 'soma', inicializada com 0, que acumulará a soma dos valores ímpares entre 'x' e 'y'
BEGIN
    RAISE NOTICE 'x: %, y: %', x, y; 
    -- Verifica se 'x' é maior que 'y' e, se for, troca seus valores
    IF x > y THEN
        swap := x;  -- Armazena 'x' temporariamente em 'swap'
        x := y;  -- Atribui 'y' a 'x'
        y := swap;  -- Atribui o valor de 'swap' (que contém 'x') a 'y', completando a troca
    END IF;

    x := x + 1;
    LOOP
        EXIT WHEN x >= y;

        IF x % 2 <> 0 THEN  -- Se 'x' for ímpar
            soma := soma + x;  -- Adiciona 'x' à variável 'soma'
        END IF;

        x := x + 1;  -- Incrementa 'x' para passar para o próximo valor
    END LOOP;

    RAISE NOTICE '%', soma;
END;
$$;

-- VERSÃO WHILE
DO $$
DECLARE
    x INT := valor_aleatorio_entre(20, 50);  
    y INT := valor_aleatorio_entre(20, 50); 
    swap INT;  
    soma INT := 0;  
BEGIN
    RAISE NOTICE 'x: %, y: %', x, y; 

    IF x > y THEN
        swap := x;  
        x := y; 
        y := swap;
    END IF;

    x := x + 1;

    -- Inicia um loop 'WHILE' para somar os valores ímpares entre 'x' e 'y'
    WHILE x < y LOOP  -- Enquanto 'x' for menor que 'y'
        IF x % 2 <> 0 THEN  -- Se 'x' for ímpar (x % 2 != 0)
            soma := soma + x;  
        END IF;

        x := x + 1; 
    END LOOP;  

    RAISE NOTICE '%', soma; 
END;
$$;

-- VERSÃO FOR
DO $$  
DECLARE
    x INT := valor_aleatorio_entre(20, 50);  
    y INT := valor_aleatorio_entre(20, 50);  
    swap INT;  
    soma INT := 0; 
BEGIN
    RAISE NOTICE 'x: %, y: %', x, y;  

    IF x > y THEN
        swap := x; 
        x := y;  
        y := swap; 
    END IF;

    x := x + 1;  
    y := y - 1;  

    -- Laço FOR para percorrer os números entre 'x' e 'y'
    FOR numero IN x..y LOOP  -- O loop percorre os valores de 'x' até 'y', substituindo 'i' por 'numero'
        IF numero % 2 <> 0 THEN  -- Se o valor for ímpar
            soma := soma + numero;  -- Adiciona o valor de 'numero' à soma
        END IF;
    END LOOP;

    RAISE NOTICE '%', soma;
END;
$$;

-- VERSÃO FOREACH
DO $$ 
DECLARE
    x INT := valor_aleatorio_entre(20, 50);  
    y INT := valor_aleatorio_entre(20, 50);  
    swap INT;  
    soma INT := 0;  
    vetor INT[];  -- Declara um vetor de inteiros que será usado para armazenar os números entre 'x' e 'y'
    numero INT;  -- Declara a variável 'numero', que substituirá 'i' e será usada nos loops
BEGIN
    RAISE NOTICE 'x: %, y: %', x, y;

    IF x > y THEN
        swap := x;  
        x := y;  
        y := swap;  
    END IF;

    x := x + 1;  
    y := y - 1; 

    -- Laço FOR para percorrer os valores entre 'x' e 'y'
    FOR numero IN x..y LOOP
        vetor := vetor || numero;  -- Adiciona o valor de 'numero' ao vetor
    END LOOP;
    
    -- Verifica se x é menor que y para evitar um vetor vazio
    IF x < y THEN  -- Se 'x' for menor que 'y', o vetor não está vazio
        -- Laço FOREACH para percorrer os valores do vetor
        FOREACH numero IN ARRAY vetor LOOP
        IF numero % 2 <> 0 THEN  -- Verifica se o valor é ímpar
            soma := soma + numero;  -- Se for ímpar, adiciona o valor à soma
        END IF;
        END LOOP;
    END IF;

    RAISE NOTICE '%', soma;
END;
$$;


-- 1.1.4 Gerar inteiros no intervalo de 1 a 100.
-- Leia um número indeterminado de pares de valores M e N (pare quando qualquer um desses 
-- valores for menor ou igual a zero). Para cada par, imprima a sequência do menor para o 
-- maior (incluindo ambos) e a soma de inteiros consecutivos entre eles (incluindo ambos).
-- VERSÃO LOOP
DO $$ 
DECLARE
    m INT;
    n INT;
    swap INT;
    saida TEXT;
    soma INT;
BEGIN
  <<externo>>
    LOOP
        m := valor_aleatorio_entre(-5, 100);
        n := valor_aleatorio_entre(-5, 100);
        RAISE NOTICE '% %', m, n;
        
        EXIT externo WHEN m <= 0 OR n <= 0;

        IF m > n THEN
            swap := m;
            m := n;
            n := swap;
        END IF;

        saida := '';  -- Inicializa a string de saída
        soma := 0;    -- Inicializa a soma

        <<interno>> 
        LOOP
        -- Concatena os valores de m à string de saída
            saida := saida || m || ' ';
            soma := soma + m; 
            m := m + 1;

            EXIT interno WHEN m > n;
        END LOOP;

        saida := saida || 'Soma = ' || soma;
        RAISE NOTICE '%', saida;
    END LOOP;
END;
$$;

-- VERSÃO WHILE
DO $$
DECLARE
    m INT := valor_aleatorio_entre(-5, 100);  
    n INT := valor_aleatorio_entre(-5, 100);  
    swap INT;
    saida TEXT;
    soma INT;
BEGIN
    RAISE NOTICE '% %', m, n;

    WHILE m > 0 AND n > 0 
        LOOP
            IF m > n THEN
                swap := m;
                m := n;
                n := swap;
            END IF;

            saida := '';  -- Inicializa a string de saída
            soma := 0;    -- Inicializa a soma

            WHILE m <= n 
                LOOP
                    saida := saida || m || ' ';  
                    soma := soma + m;  
                    m := m + 1;  
                END LOOP;

            saida := saida || 'Soma = ' || soma;
            RAISE NOTICE '%', saida;

            -- Gera novos valores aleatórios para m e n para a próxima iteração
            m := valor_aleatorio_entre(-5, 100);
            n := valor_aleatorio_entre(-5, 100);
            RAISE NOTICE '% %', m, n;
        END LOOP;
END;
$$;

-- VERSÃO FOR
DO $$
DECLARE
    m INT;
    n INT;
    swap INT;
    saida TEXT;
    soma INT;
BEGIN
    LOOP
        m := valor_aleatorio_entre(-5, 100);
        n := valor_aleatorio_entre(-5, 100);
        RAISE NOTICE '% %', m, n;
        
        EXIT WHEN m <= 0 OR n <= 0;

        IF m > n THEN
            swap := m;
            m := n;
            n := swap;
        END IF;

        saida := '';  
        soma := 0;    

        -- Loop FOR para percorrer os valores de m até n
        FOR numero IN m..n 
            LOOP
                saida := saida || numero || ' '; 
                soma := soma + numero; 
            END LOOP;

        saida := saida || 'Soma = ' || soma;
        RAISE NOTICE '%', saida;
    END LOOP;
END;
$$;

-- VERSÃO FOREACH
DO $$
DECLARE
    m INT;
    n INT;
    swap INT;
    saida TEXT;
    soma INT;
    vetor INT[];  -- Declaração do vetor
    numero INT;
BEGIN
    LOOP
        m := valor_aleatorio_entre(-5, 100);
        n := valor_aleatorio_entre(-5, 100);
        RAISE NOTICE '% %', m, n;
        
        EXIT WHEN m <= 0 OR n <= 0;

        IF m > n THEN
            swap := m;
            m := n;
            n := swap;
        END IF;

        saida := '';  
        soma := 0;   
        vetor := ARRAY[]::INT[]; 

        FOR numero IN m..n 
            LOOP
                vetor := vetor || numero;
            END LOOP;

        -- Itera sobre o vetor com FOREACH
        FOREACH numero IN ARRAY vetor 
            LOOP
                saida := saida || numero || ' ';
                soma := soma + numero; 
            END LOOP;

        saida := saida || 'Soma = ' || soma;
        RAISE NOTICE '%', saida;
    END LOOP;
END;
$$;

-- 1.2 Faça um programa que calcule o determinante de uma matriz quadrada de ordem 3
-- utilizando a regra de Sarrus. Veja a regra aqui: https://en.wikipedia.org/wiki/Rule_of_Sarrus
-- Preencha a matriz com valores inteiros aleatórios no intervalo de 1 a 12.
