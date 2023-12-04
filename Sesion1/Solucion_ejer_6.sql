WITH PreciosEnero AS (
  SELECT
    listing_id AS listing_id,
    AVG(price) AS precio_promedio_enero
  FROM `<<PROYECT_ID>>.<<DATASET_ID>>.calendar`
  WHERE
    EXTRACT(MONTH FROM DATE) = 1
  GROUP BY
    listing_id
),
PreciosJulio AS (
  SELECT
    listing_id AS listing_id,
    AVG(price) AS precio_promedio_julio
  FROM `<<PROYECT_ID>>.<<DATASET_ID>>.calendar`
  WHERE
    EXTRACT(MONTH FROM DATE) = 7
  GROUP BY
    listing_id
)
SELECT
  e.listing_id,
  e.precio_promedio_enero,
  j.precio_promedio_julio,
  j.precio_promedio_julio - e.precio_promedio_enero AS diferencia_precio
FROM PreciosEnero AS e
JOIN PreciosJulio AS j
  ON e.listing_id = j.listing_id
ORDER BY diferencia_precio DESC


BEGIN
CREATE TEMP TABLE PreciosPromedioDiarios AS
SELECT
  DATE_TRUNC(c.date, DAY) AS fecha,
  AVG(c.price) AS precio_promedio
FROM
  `<<PROYECT_ID>>.<<DATASET_ID>>.calendar` AS c
GROUP BY fecha;
END;

select * from PreciosPromedioDiarios where <condition>;
