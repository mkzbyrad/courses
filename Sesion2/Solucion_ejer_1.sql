CREATE OR REPLACE TABLE `<<PROYECT_ID>>.<<DATASET_ID>>.listings_mod`
CLUSTER BY neighbourhood_group, categoria
OPTIONS (
    description = 'a table clustered by neighbourhood_group and categoria')
AS
WITH precios_con_categorias AS (
  SELECT
    id as listing_id
	, name
	, host_id
	, COALESCE(CAST(REGEXP_EXTRACT(name, r'^(.*?)[·]') AS STRING), 'No Name') AS site_name
  , COALESCE(CAST(REGEXP_EXTRACT(name, r'★([0-9.]+)') AS FLOAT64), 10) AS rating
  , CAST(REGEXP_EXTRACT(name, r'(\d+) bedroom|bedrooms') AS INT64) AS bedrooms
  , CAST(REGEXP_EXTRACT(name, r'(\d+) beds?\b') AS INT64) AS beds
	, neighbourhood_group
	, neighbourhood
	, room_type
	, price
	, number_of_reviews
	, last_review
  , NTILE(5) OVER (ORDER BY price) AS categoria
  FROM `<<PROYECT_ID>>.<<DATASET_ID>>.listings`
),
primer_ultimo_precio AS (
  SELECT
    listing_id
  , MIN(primer_precio) AS primer_precio
  , MAX(ultimo_precio) AS ultimo_precio
FROM (
    SELECT
      listing_id
    , FIRST_VALUE(price) OVER (PARTITION BY listing_id ORDER BY date ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS primer_precio
    , LAST_VALUE(price) OVER (PARTITION BY listing_id ORDER BY date ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS ultimo_precio
    FROM `<<PROYECT_ID>>.<<DATASET_ID>>.calendar`
)
GROUP BY listing_id
)
SELECT
  pcc.*,
  CASE
    WHEN categoria = 1 THEN 'Muy Económico'
    WHEN categoria = 2 THEN 'Económico'
    WHEN categoria = 3 THEN 'Moderado'
    WHEN categoria = 4 THEN 'Caro'
    WHEN categoria = 5 THEN 'Muy Caro'
    ELSE 'Otro'
  END AS categoria_nombre
  , primer_precio
  , ultimo_precio
  , ROUND(((ultimo_precio - primer_precio) / primer_precio),2) * 100 AS diferencia_porcentual
FROM precios_con_categorias pcc
INNER JOIN primer_ultimo_precio pup
   ON pcc.listing_id = pup.listing_id