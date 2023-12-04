CREATE OR REPLACE FUNCTION `<<PROYECT_ID>>.<<DATASET_ID>>.count_reviews_by_year_month`(year_param INT64, month_param INT64) AS (
  (
    SELECT COUNT(1) AS review_count
    FROM `<<PROYECT_ID>>.<<DATASET_ID>>.reviews_p`
    WHERE
      EXTRACT(YEAR FROM DATE_TRUNC(date, MONTH)) = year_param
      AND EXTRACT(MONTH FROM DATE_TRUNC(date, MONTH)) = month_param
  )
);

-- Ejemplo de uso
SELECT `<<PROYECT_ID>>.<<DATASET_ID>>.count_reviews_by_year_month`(2022, 1) AS review_count;

CREATE OR REPLACE PROCEDURE `<<PROYECT_ID>>.<<DATASET_ID>>.count_procedure`(
  IN table_name_param STRING,
  IN year_param INT64,
  IN month_param INT64
)
BEGIN
  DECLARE dynamic_sql STRING;
  DECLARE review_count INT64;

  SET dynamic_sql = FORMAT(
    '''
    SELECT COUNT(1) AS review_count
    FROM `%s`
    WHERE
      EXTRACT(YEAR FROM DATE_TRUNC(date, MONTH)) = %d
      AND EXTRACT(MONTH FROM DATE_TRUNC(date, MONTH)) = %d
    ''',
    table_name_param, year_param, month_param
  );

  EXECUTE IMMEDIATE dynamic_sql INTO review_count;

  SELECT review_count;
END;

-- Ejemplo de uso
CALL `<<PROYECT_ID>>.<<DATASET_ID>>.count_procedure`('<<PROYECT_ID>>.<<DATASET_ID>>.reviews_p', 2018, 1);