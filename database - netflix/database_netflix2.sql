# Selecione os filmes com o title, rating e release_year de todos os filmes em que o rating seja PG-13

SELECT title, rating, release_year 
FROM netflix 
WHERE rating = "PG-13"

# Selecione os filmes com o title, rating e release_year de todos os filmes em que o 
# ratingdescription seja maior ou igual a 100

SELECT title, rating, release_year, ratingdescription
FROM netflix 
WHERE ratingdescription >= 100

# Selecione os filmes com o title, rating e release_year de todos os filmes em que 
# o release_year seja 2012 

SELECT title, rating, release_year, release_year
FROM netflix 
WHERE release_year = 2012

# Selecione os filmes com o title, rating e release_year de todos os filmes em que 
# o release_year seja anterior a 2000

SELECT title, rating, release_year, release_year
FROM netflix 
WHERE release_year < 2000

# Selecione a lista distinta de filmes com title, rating e release_year de todos os filmes

SELECT DISTINCT title, rating, release_year 
FROM netflix 

#

SELECT * 
FROM netflix 
WHERE title BETWEEN "13 Reasons Why" AND "Baby Daddy"
ORDER BY title  

# 

SELECT *
FROM netflix 
WHERE ratingdescription BETWEEN 80 AND 110
ORDER BY ratingdescription 


# Selecione todos os valores do netflix em que o release_year seja 2017, 2015 ou 2014 apenas

SELECT *
FROM netflix 
WHERE release_year IN (2014,2015,2017)
ORDER BY release_year 

# Selecione todos os valores da tabela netflix em que o ratingdescription é 80, 70 ou 100

SELECT *
FROM netflix 
WHERE ratingdescription IN (80, 70, 100)
ORDER BY ratingdescription 


# Selecione as colunas title, rating, ratinglevel, da tabela netflix
# onde a condição seja ratinglevel retornando tudo com a palavra Parent no inicio da frase
SELECT  title,
rating, 
ratinglevel
FROM netflix 
WHERE ratinglevel LIKE "Parent%"
LIMIT 100


# Selecione as colunas title, rating, ratinglevel, da tabela netflix
# onde a condição seja ratinglevel retornando tudo com a palavra Parent em qlqr lugar da frase

SELECT  title,
rating, 
ratinglevel
FROM netflix 
WHERE ratinglevel LIKE "%Parent%"
LIMIT 100


# Selecione as colunas title, rating, ratinglevel, da tabela netflix
# onde a condição seja title retornando tudo com a palavra time em qlqr lugar da frase
SELECT  title,
rating, 
ratinglevel
FROM netflix 
WHERE title LIKE "%time%"
LIMIT 100

#

SELECT title, rating, ratinglevel
FROM netflix 
WHERE title LIKE "The%"

WHERE title LIKE 'a%' - Procurar por valores que começam com a 
WHERE title LIKE '%a' - Procurar por valores que terminam com a 
WHERE title LIKE '%a%' - Procurar por valores que possuem a letra a em qualquer lugar do title 


# Qual que é a media dos usuarios (user_rating_score)  por filme, dependendo do ano 
SELECT 
release_year, AVG(user_rating_score)
FROM netflix 
GROUP BY release_year  #pra qual dimensão da minha tabela eu quero agrupar essa média que estou gerando aqui
ORDER BY release_year ASC

# SUM()
# AVG()
# COUNT()
# MIN()
# MAX()



