# Selecionar TUDO da tabela boston airbnb limitado em 100 linhas 

SELECT *
FROM boston_airbnb_listings 
LIMIT 100


# Selecione name, host name, da tabela BostonAirbnb, 
# onde as pessoas respondem as perguntas em até 1 hora da tabela host_response_time 

SELECT name, host_name, host_response_time
FROM boston_airbnb_listings 
WHERE host_response_time = "within an hour"


# Selecionar as colunas
SELECT name, host_name, host_response_time 
# Qual tabela?
FROM boston_airbnb_listings 
# Qual a condição?
WHERE host_response_time = "within an hour"
# Ordenar por ordem alfabética 
ORDER BY host_name 


# Selecione as colunas name, host name, neighbourhood, beds da tabela boston airbnb 
# onde seja selecionado as beds com número maior e igual a 3 camas 

SELECT name, host_name, neighbourhood, beds 
FROM boston_airbnb_listings 
WHERE beds >=3


# Selecione as colunas name, host name, neighbourhood, beds da tabela boston airbnb 
# onde seja selecionado as beds diferentes de 3 camas 

SELECT name, host_name, neighbourhood, beds 
FROM boston_airbnb_listings 
WHERE beds !=3


# Usando a boston_airbnb_listings table combine host_name e host_neighbourhood
SELECT 
CONCAT(host_name, ' - ', host_neighbourhood)
FROM boston_airbnb_listings


# Selecione host_name, e faça a contagem de qts caracteres tem em cada nome que contem na coluna 

SELECT 
host_name, 
LENGTH(host_name)
FROM boston_airbnb_listings


# Lower deixa os caracter minusculos e Upper maiusculos 

SELECT 
LOWER (host_name)
#UPPER (host_name) 
FROM boston_airbnb_listings


# RIGHT trás os ultimos caracteres e Left os primeiros 
SELECT 
#RIGHT (host_name, 3) # o número é a qtd de caracteres que ele mostra
LEFT (host_name, 3)
FROM boston_airbnb_listings

# Usando a query abaixo, adapte esta query para mostrar em colunas ao lado, os 5 primeiros 
# caracteres da esquerda e 5 da direita 

SELECT 
CONCAT(host_name,' - ', host_neighbourhood)
LEFT(CONCAT(host_name,' - ', host_neighbourhood), 5)
RIGHT(CONCAT(host_name,' - ', host_neighbourhood), 5)
FROM boston_airbnb_listings 
LIMIT 1000


# Selecionando os caracteres do meio
SELECT 
host_neighbourhood,
SUBSTRING(host_neighbourhood, 2, 3)
FROM boston_airbnb_listings 
LIMIT 1000


# Elimina os espaços 

SELECT 
RTRIM(LTRIM)(CONCAT' ', host_neighbourhood, ' ')))
FROM boston_airbnb_listings 
LIMIT 1000


# Selecione name, summary e house_rules da tabela boston_airbnb_listings onde o campo 
# house_rules contenha a o termo "No Pets"

SELECT name,
summary, 
house_rules
FROM boston_airbnb_listings 
WHERE house_rules LIKE '%No Pets%'
# WHERE house_rules NOT LIKE '%No Pets%' - esse comando é para que não apareça No Pets 
LIMIT 100