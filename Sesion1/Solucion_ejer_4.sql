SELECT
  l.id,
  l.name,
  l.host_name,
  r.date AS last_review,
  AVG(CAST(REGEXP_EXTRACT(l.name, r'★([\d.]+)') AS FLOAT64)) AS calificacion_promedio
FROM
  `<<PROYECT_ID>>.<<DATASET_ID>>.listings` l
JOIN
  `<<PROYECT_ID>>.<<DATASET_ID>>.reviews` r
ON
  l.id = r.listing_id
WHERE
  DATE_DIFF(CURRENT_DATE(), DATE(r.date), DAY) <= 30
  AND REGEXP_CONTAINS(l.name, r'★([\d.]+)') -- Aseguramos que el campo name contiene la puntuación
GROUP BY
  l.id, l.name, l.host_name, r.date
HAVING
  calificacion_promedio > 4.8
ORDER BY
  calificacion_promedio DESC;