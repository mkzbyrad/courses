SELECT
  l.name AS nombre_listado,
  COUNT(r.listing_id) AS cantidad_resenas
FROM `<<PROYECT_ID>>.<<DATASET_ID>>.listings` AS l
INNER JOIN `<<PROYECT_ID>>.<<DATASET_ID>>.reviews` AS r
  ON l.id = r.listing_id
GROUP BY
  nombre_listado
ORDER BY
  cantidad_resenas DESC;