SELECT
  name,
  COALESCE(CAST(REGEXP_EXTRACT(name, r'★([0-9.]+)') AS FLOAT64), 10) AS rating,
  CAST(REGEXP_EXTRACT(name, r'(\d+) bedroom|bedrooms') AS INT64) AS bedrooms
FROM <<PROYECT_ID>>.<<DATASET_ID>>.listings
