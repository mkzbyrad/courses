CREATE OR REPLACE _________ `<<PROYECT_ID>>.<<DATASET_ID>>.count_procedure`(
 IN _____ STRING,
 IN _____ INT64,
 IN _____ INT64
)
BEGIN
 _______ dynamic_sql STRING;
 _______ review_count INT64;
 SET __________ = _____________(
  '''
  SELECT COUNT(1) AS review_count
  FROM `__`
  WHERE
   EXTRACT(YEAR FROM DATE_TRUNC(date, MONTH)) = __
   AND EXTRACT(MONTH FROM DATE_TRUNC(date, MONTH)) = __
  ''',
  ______, year_param, month_param
 );
 EXECUTE IMMEDIATE ___________ INTO ___________;
 SELECT _________;
END;
-- Llamada
____ `<<PROYECT_ID>>.<<DATASET_ID>>.count_procedure`('<<PROYECT_ID>>.<<DATASET_ID>>.reviews_p', 2023, 1);