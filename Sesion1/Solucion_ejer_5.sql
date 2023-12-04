BEGIN
CREATE OR REPLACE TABLE <<PROYECT_ID>>.<<DATASET_ID>>.listing_details AS
SELECT
  name,
  COALESCE(CAST(REGEXP_EXTRACT(name, r'^(.*?)[★0-9]') AS STRING), 'No Name') AS site_name,
  COALESCE(CAST(REGEXP_EXTRACT(name, r'^(.*?)[·]') AS STRING), 'No Name') AS site_name_2, -- otra manera de sacar el nombre
  COALESCE(CAST(REGEXP_EXTRACT(name, r'★([0-9.]+)') AS FLOAT64), 10) AS rating,
  CAST(REGEXP_EXTRACT(name, r'(\d+) bedroom|bedrooms') AS INT64) AS bedrooms,
  CAST(REGEXP_EXTRACT(name, r'(\d+) beds?\b') AS INT64) AS beds
FROM
  `<<PROYECT_ID>>.<<DATASET_ID>>.listings`;
END;