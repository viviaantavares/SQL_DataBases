# Selecione as colunas date, ad_type, revenue da coluna ads_data_reference_1, 
# fazendo a união com ads_data_reference_2 

SELECT 
date,
ad_type,
revenue
FROM ads_data_revenue_1 
UNION 
SELECT 
date, 
ad_type,
revenue 
FROM ads_data_revenue_2 


# Selecione as colunas date, ad_type e faça a soma com o revenue, da tabela ads_ data_revenue_1 

SELECT 
date,
ad_type,
SUM(revenue)
FROM ads_data_revenue_1 
GROUP BY date, ad_type 


# Selecione as colunas name e message da tabela bbc_228735667216_2 e faça a união com 
# a tabela cbs_news_131459315949_2, com o name em ordem alfabética 
SELECT 
name, 
message
FROM bbc_228735667216_2 
UNION 
SELECT 
name,
message
FROM cbs_news_131459315949_2
ORDER BY name 
LIMIT 1000 


# E se eu quiser filtrar por postagens com "count" maior que a 1000?
SELECT 
name, 
message,
likes_count 
FROM cbs_news_131459315949_2
WHERE likes_count > 1000
UNION 
SELECT 
name, 
message,
likes_count 
FROM bbc_228735667216_2 
WHERE likes_count > 1000


# Sobre querys 
 
SELECT 
name, 
message 
FROM 
(SELECT 
name, 
message,
likes_count 
FROM cbs_news_131459315949_2
WHERE likes_count > 1000
UNION 
SELECT 
name, 
message,
likes_count 
FROM bbc_228735667216_2 
WHERE likes_count > 1000) t1 
ORDER BY message DESC 

# Merge data from these 2 tables (Bring everything - All columns)
# Ads_data_revenue_1 AND ads_data_revenue_2 
# ORDER BY Campaign ID

SELECT 
campaign_id, -- 1 # Também pode ser colocado por ordem númerica  
timestamp,  -- 2
date, -- 3
inventorytype, -- 4
ad_type,
available_impressions,
matched_queries,
impressions,
clicks,
spend,
fee,
revenue,
ctr,
cpm,
cpc
FROM ads_data_revenue_1 
UNION
SELECT 
campaign_id,
timestamp,
date,
inventorytype,
ad_type,
available_impressions,
matched_queries,
impressions,
clicks,
spend,
fee,
revenue,
ctr,
cpm,
cpc
FROM ads_data_revenue_2 
ORDER BY campaign_id 
LIMIT 1000


# Combine os dados de bbc_228735667216 table with cbs_news_131459315949_2 table 
# Selecione o ID, name and post_type 
# Filtre por name com as seguintes condições 
# bbc-228735667216 table - Onde o nome é BBC News Photos 
# cbs_news_131459315949_2 table - Onde o nome contém 'Australia'
# (pode ser Australian, Australians, Australi'as', etc) 
-- # Limite os resultados by 1000 rows 

SELECT 
id,
name, 
post_type 
FROM bbc_228735667216_2 
WHERE name = 'BBC News Photos'
UNION
SELECT 
id,
name,
post_type 
FROM cbs_news_131459315949_2 
WHERE name LIKE '%Australia%'
LIMIT 1000

# Crie uma tabela com o custo toal (cost) by partner e advertiser 
SELECT 
partner,
advertiser, 
ROUND(SUM(cost))  # ROUND arredonda os valores, SUM faz a soma 
FROM auto_data 
GROUP BY partner, advertiser 
UNION 
SELECT 
partner,
advertiser, 
ROUND(SUM(cost))  # ROUND arredonda os valores, SUM faz a soma 
FROM auto_data_november 
GROUP BY partner, advertiser 

SELECT 
t1.product_code, # t1 pois está na tabela products_type
t1.company,      # t1 pois está na tabela products_type
t1.type,         # t1 pois está na tabela products_type
t2.cost          # t2 pois está na tabela products_cost
FROM products_type t1 # foi dado o nome de t1 para o products_type
JOIN products_cost t2 # foi dado o nome de t2 para o products_cost
ON t1.product_code=t2.product_code # utilizar as duas colunas que são iguais nas duas tabelas que foram juntadas


# Escreva uma consulta SQL para JOIN nas tabelas ads_data_reference e ads_data_revenue ONDE 
# você obtém a Hora do Dia em uma tabela e a taxa da outra 

SELECT 
data1.hour_of_day,
data2.fee 
FROM ads_data_reference data1
JOIN ads_data_revenue_1 data2
ON data1.campaign_id=data2.campaign_id


# Escreva uma consulta SQL para JOIN nas tabelas ads_data_reference e ads_data_revenue 
# onde você obtém o inventorytype e o adsize de uma tabela e as impressões e cliques da 
# da outra para os seguintes formatos e tipo de inventário: 
# Format2, Format3, Format4, Format5, Format6
# Somar as impressões e os clicks 

SELECT 
ad1.inventorytype,
ad1.ad_size, 
SUM(ad2.impressions) total_impressoes, # total_impressoes é o nome que ficou para a soma das impressoes 
SUM(ad2.clicks) total_clicks            # total_click é o nome que ficou para a soma dos clicks
FROM ads_data_reference ad1
JOIN ads_data_revenue_1 ad2
ON ad1.campaign_id=ad2.campaign_id
WHERE ad1.inventorytype BETWEEN 'Format2' AND 'Format6'
GROUP BY ad1.inventorytype, ad1.ad_size 


# Usando vários JOINS obtenha o nome do cliente, email e produtos 
# use as tabelas a seguir 
# Store_costumer_ids (field 'client' for client name)
# Store_costumer_contact (field 'email')
# Store_costumer_sales (field 'product_1' for products)

SELECT 
sci.client, 
scc.email, 
scs.product_1 
FROM store_costumer_ids sci 
JOIN store_costumer_contact scc 
ON sci.client_id=scc.client_id 
JOIN store_costumer_sales scs 
ON scs.client_id=sci.client_id 

# Store_costumer_ids (field 'client' for client name)
# Store_costumer_contact (field 'email')
# Store_costumer_sales (field 'product_1' for products)

SELECT 
sci.client, 
scc.email, 
SUM(price) total_gasto 
FROM store_costumer_ids sci 
JOIN store_costumer_contact scc 
ON sci.client_id=scc.client_id 
JOIN store_costumer_sales scs 
ON scs.client_id=sci.client_id 
GROUP BY sci.client, scc.email 

# Joins & Unions 
# Usando as tabelas employees (há 4 tabelas). Observe o esquema das tabelas, descubra que tipo de dados está 
# em cada tabela e responda às seguintes perguntas 
# 1 - Crie uma tabela (view) com o name, state, salary and bonus de cada funcionário. Retorne todos os funcionários 
# (mesmo em branco) da tabela que contém name e state, mas apenas os registros correspondentes da tabela à direita
# (tabela 2) contendo salário e bônus 

SELECT 
ep.employee_name,
ep.state, 
es.salary, 
es.bonus 
FROM employees ep 
LEFT JOIN employees_salary es 
ON ep.employee_id=es.employee_id 

# Joins & Unions 
# Usando as tabelas employees (há 4 tabelas). Observe o esquema das tabelas, descubra que tipo de dados está 
# em cada tabela e responda às seguintes perguntas 
# Retornar os mesmo valores do exercicio 1, mas apenas para funcionarios de TX, FL e CA 

SELECT 
ep.employee_name, 
ep.state, 
es.salary, 
es.bonus 
FROM employees ep 
LEFT JOIN employees_salary es 
ON ep.employee_id=es.employee_id 
WHERE state IN ('CA', 'TX', "FL")

# Joins & Unions 
# Usando as tabelas employees (há 4 tabelas). Observe o esquema das tabelas, descubra que tipo de dados está 
# em cada tabela e responda às seguintes perguntas 
# Temos que pagar a cada funcionário seus bônus. O bônus é calculado como uma porcentagem de seu salário. 
# Por favor, me dê todos os IDs de funcionários, nomes e valor de seus bônus em dólares. $ 
SELECT ep.employee_name, ep.state, (es.salary* es.bonus) AS Bonus
FROM employees ep
LEFT JOIN employees_salary es
ON ep.employee_id=es.employee_id
WHERE state IN ('CA', 'TX', 'FL')


# Joins & Unions 
# Usando as tabelas employees (há 4 tabelas). Observe o esquema das tabelas, descubra que tipo de dados está 
# em cada tabela e responda às seguintes perguntas 
# Usando a mesma query, por favor, mostre apenas aos funcionários que têm bônus acima de US # 3.000 
SELECT ep.employee_name, ep.state, (es.salary* es.bonus) AS Bonus
FROM employees ep
LEFT JOIN employees_salary es
ON ep.employee_id=es.employee_id
WHERE state IN ('CA', 'TX', 'FL')
HAVING (es.salary* es.bonus) > 3000


# 

SELECT 
employeename, 
jobtitle, 
(CAST(basepay AS DECIMAL)+
CAST(overtimepay AS DECIMAL)) AS total_salary 
FROM san_francisco_salaries  


# Usando a tabela san_francisco_salaries gere: 
# Uma tabela com a média (AVG) de totalpay por jobtitle 

SELECT 
jobtitle,
AVG (totalpay) average_salary #nome pra essa coluna
FROM san_francisco_salaries 
GROUP BY jobtitle
ORDER BY average_salary DESC # ordenar pelo mais alto para o mais baixo 



