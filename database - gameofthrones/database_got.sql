# Selecione name da tabela GotCharacters

SELECT
character_name 
FROM 
got_characters;


# Selecione TUDO do Game of Thrones Characters Table

SELECT * 
FROM got_characters;


# Selecione character name, and person ID on the Game of Thrones Characters Table

SELECT
character_name, 
person_id
FROM 
got_characters;


# Selecione character name, person ID, birth year and Gender on the Game of Thrones Characters Table e Limite os resultados para no máximo 10

SELECT
character_name,
person_id,
birthyear,
gender 
FROM 
got_characters
LIMIT 10;

# Selecione TUDO da tabela got creatures limitado em 29 linhas 

SELECT 
*
FROM gotcreatures
LIMIT 29


# Dê-me a lista dos primeiros 10 valores da tabela GOTCharacters com name e gender 

SELECT 
character_name, 
gender 
FROM
got_characters
LIMIT 10;

# Dê-me a lista única de species da tabela GOTCreatures

SELECT 
DISTINCT
species
FROM 
gotcreatures;

# Dê-me as primeiras 37 linhas da tabela GOTCharacters

SELECT 
*
FROM 
got_characters
LIMIT 37

# Colocar em ordem Alfábetica Crescente

SELECT 
character_name
FROM got_characters
ORDER BY character_name; 

# Colocar em ordem Alfábetica Decrescente

SELECT 
character_name
FROM got_characters
ORDER BY character_name DESC;


# Selecionar name, weight_unit, weight da tabela gotcreatures entre os numero 300kg a 400kg

SELECT name, weight_unit, weight 
FROM gotcreatures 
WHERE weight BETWEEN 300 AND 400; 


# Selecionar name, weight_unit, weight da tabela gotcreatures onde a condição é entre os nomes Drogon e Lady por ordem Alfábetica.

SELECT name, 
weight_unit, 
weight 
FROM gotcreatures 
WHERE name BETWEEN "Drogon" AND "Lady"
ORDER BY name 

# Selecione batalhas de números 10 a 20 (battles)

SELECT *
FROM got_battles 
WHERE battle_number BETWEEN 10 AND 20 


# Selecione todas as batlhas (com todos os detalhes) que começam com Lannister até 
# Greyjoy (battles)

SELECT * 
FROM got_battles 
WHERE attacker_1 BETWEEN "Greyjoy" AND "Lannister"
ORDER BY attacker_1

# Selecione o inventory type e spend para o período entre meia-noite até o 
# meio-dia (clean_ads_data) LIMIT 100 

# Use Battles Table and Clean Ads Data Table 

SELECT inventorytype, spend, hour_of_day 
FROM clean_ads_data 
WHERE hour_of_day BETWEEN 0 AND 12 
LIMIT 1000


# Selecione tudo da tabela got_battles, onde a condição seja attacker_2 e  attacker_3 não 
# contem valores vazios. 

SELECT * 
FROM got_battles 
WHERE attacker_2 IS NOT NULL AND attacker_3 IS NOT NULL


# Concatenar name e year da tabela got_battles

SELECT 
CONCAT(name, ' ', year)
FROM got_battles

# SELECT 
# CONCAT(name, ' - ', year)
# FROM got_battles


# Mostre-me todos os personagens (characters) da Familia Stark por ordem 
# crescente de nome (character_name) - Tabela got_caracters

SELECT character_name 
FROM got_characters 
WHERE character_name LIKE '%Stark%'
ORDER BY character_name ASC


# Mostre-me todos os personagens (characters) cujo nome começa com Jon - got_characters 

SELECT character_name 
FROM got_characters 
WHERE character_name LIKE 'Jon%'

# Mostre-me todos os personagens (characters) cujo o nome contenha 'ae' - got_characters 

SELECT character_name
FROM got_characters 
WHERE character_name LIKE '%ae%'

# Mostre-me todos os nomes das criaturas cinzentas (grey creatures) - gotcreatures 

SELECT *
FROM gotcreatures 
WHERE coloring LIKE '%grey%'

# o rei defensor (defender_king1) era um Stark - battles (got_battles) ------------------------XXXXXXXXXXXXXXXXXXXX------------------------------------------------

SELECT *
FROM got_battles
WHERE battle_number LIKE 


# Dê-me tudo de todas as batalhas de verão (summer) em que o atacante (attacker_king1)  ------------------------XXXXXXXXXXX----------------------------------------
# foi Joffrey

SELECT *
FROM got_battles
WHERE attacker_1 LIKE '%Joffrey%'


# Character_name, name, house_name, motto 

SELECT 
gch.character_name, 
gcr.name,
got.house_name, 
got.motto 
FROM got_characters gch  
JOIN gotcreatures gcr 
ON gcr.owner_person_id=gch.person_id 
JOIN gothouses got
ON gch.house_id=got.house_id 

