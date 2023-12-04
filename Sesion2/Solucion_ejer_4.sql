CREATE OR REPLACE TABLE `<<PROYECT_ID>>.<<DATASET_ID>>.neighbourhoods_changed` (
  neighbourhood_group STRING,
  neighbourhood STRING,
  new_neighbourhood STRING
);

-- Insertar filas
INSERT INTO `<<PROYECT_ID>>.<<DATASET_ID>>.neighbourhoods_changed` (neighbourhood_group, neighbourhood, new_neighbourhood)
VALUES
  ('Barajas', 'Aeropuerto', 'Aeropuerto Suarez'),
  ('Barajas', 'Alameda de Osuna', 'Osuna de Alameda'),
  ('Barajas', 'Bar Tío Paco', NULL),
  ('Barajas', 'Plenilunio', NULL)
;

MERGE `<<PROYECT_ID>>.<<DATASET_ID>>.neighbourhoods` AS destino
USING `<<PROYECT_ID>>.<<DATASET_ID>>.neighbourhoods_changed` AS nuevos
  ON destino.neighbourhood_group = nuevos.neighbourhood_group
  AND destino.neighbourhood = nuevos.neighbourhood
WHEN MATCHED THEN
  UPDATE SET
    destino.neighbourhood = nuevos.new_neighbourhood
WHEN NOT MATCHED THEN
  INSERT (neighbourhood_group, neighbourhood)
  VALUES (nuevos.neighbourhood_group, nuevos.neighbourhood);
