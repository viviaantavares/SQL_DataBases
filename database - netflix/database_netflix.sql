# A lista de filmes da tabela netflix com title, rating e release_year

SELECT 
title, 
rating,
release_year 
FROM
netflix; 


# A lista completa de filmes da tabela netflix (apenas 100 resultados)

SELECT *
FROM netflix
LIMIT 100

# A lista de filmes da tabela netflix com title, rating, rating_description e release_year (apenas 1000 resultados)

SELECT 
title, 
rating,
ratingdescription,
release_year 
FROM netflix
LIMIT 1000


# A lista de todos os titulos (title) do NETFLIX ordenada por ordem alfabética

SELECT 
DISTINCT title
FROM netflix 
ORDER BY title;

