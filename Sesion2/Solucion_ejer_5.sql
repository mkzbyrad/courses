WITH DuracionEstancias AS (
  SELECT
    l.neighbourhood,
    AVG(DATE_DIFF(c.date, c.date + INTERVAL c.minimum_nights DAY, DAY)) AS duracion_promedio
  FROM `<<PROYECT_ID>>.<<DATASET_ID>>.listings` AS l
  JOIN `<<PROYECT_ID>>.<<DATASET_ID>>.calendar` AS c
    ON l.id = c.listing_id
  WHERE c.available = FALSE
  GROUP BY
    neighbourhood
)
SELECT
  neighbourhood,
  duracion_promedio
FROM
  DuracionEstancias
ORDER BY
  duracion_promedio DESC;
