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


-- 1.1.3 Gerar inteiros no intervalo de 20 a 50.
-- Leia dois valores inteiros X e Y. Imprima a soma de todos os valores ímpares entre eles.


-- 1.1.4 Gerar inteiros no intervalo de 1 a 100.
-- Leia um número indeterminado de pares de valores M e N (pare quando qualquer um desses 
-- valores for menor ou igual a zero). Para cada par, imprima a sequência do menor para o 
-- maior (incluindo ambos) e a soma de inteiros consecutivos entre eles (incluindo ambos).


-- 1.2 Faça um programa que calcule o determinante de uma matriz quadrada de ordem 3
-- utilizando a regra de Sarrus. Veja a regra aqui: https://en.wikipedia.org/wiki/Rule_of_Sarrus
-- Preencha a matriz com valores inteiros aleatórios no intervalo de 1 a 12.
