-- Solución usando HAVING
SELECT
  neighbourhood_group,
  AVG(price) AS avg_price,
  COUNT(*) AS num_listings
FROM
  `<<PROYECT_ID>>.<<DATASET_ID>>.listings`
GROUP BY
  neighbourhood_group
HAVING
  AVG(price) > 100 AND COUNT(*) >= 100
ORDER BY
  avg_price DESC;

-- Solucion usando WHERE

SELECT *
FROM (
    SELECT
    neighbourhood_group,
    AVG(price) AS avg_price,
    COUNT(*) AS num_listings
  FROM
    `<<PROYECT_ID>>.<<DATASET_ID>>.listings`
  GROUP BY
    neighbourhood_group
)
WHERE avg_price > 100 and num_listings >= 100  

-- Ojo! que la solución con WHERE requiere de una subconsulta...