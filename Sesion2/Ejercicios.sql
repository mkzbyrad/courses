/*

EJERCICIO 1

  Crea la tabla listings_mod con las siguientes características:

        listing_id --> el id del listing
        name --> tabla listings
        host_id --> tabla listings
        site_name --> , COALESCE(CAST(REGEXP_EXTRACT(name, r'^(.*?)[·]') AS STRING), 'No Name') AS site_name
        rating --> CAST(REGEXP_EXTRACT(name, r'★([0-9.]+)') AS FLOAT64), en caso de no ser encontrado por default que sea un 10.
        bedrooms --> , CAST(REGEXP_EXTRACT(name, r'(\d+) bedroom|bedrooms') AS INT64) AS bedrooms
        beds --> , CAST(REGEXP_EXTRACT(name, r'(\d+) beds?\b') AS INT64) AS beds
        neighbourhood_group --> tabla listings
        neighbourhood --> tabla listings
        room_type --> tabla listings
        price --> tabla listings
        number_of_reviews --> tabla listings
        last_review --> tabla listings
        categoria --> 5 categorías equilibradas en número dado el campo price dentro de listings_id, crear exactamente 5 categorías.
        categoria_nombre --> categorías string extraídas del campo categoria generado con anterioridad (Muy Económico - Económico - Moderado - Caro - Muy Caro)
        primer_precio --> primer precio registrado para ese listing_id detro de la tabla calendar, si es posible usar UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ultimo_precio --> ultimo precio registrado para ese listing_id dentro de la tabla calendar, si es posible usar UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        diferencia_porcentual --> la diferencia % entre el primer y último precio


  Se pide que la tabla este clusterizada por neighbourhood_groupy y categoria

*/



/*
EJERCICIO 2

  La tabla reviews contiene 2 campos solamente listing_id y date

  Crea la tabla reviews_p particionada mensualmente por el campo date.

  Compara el count(1) para enero del 2023 entre la tabla recién creada y la tabla   original reviews.

  Ahora podrías probar la opción que existe para la sentencia PARTITION BY  llamada require_partition_filter, observa si existe alguna diferencia.

  Crea la tabla reviews_pc añadiendo también el clusterizado por el campo   listing_id y vuelve a comprobar las diferencias.

  Vuelve a comparar el count(1), prueba algún group by y comprueba las  diferencias de consumo de recursos.

*/


/*
EJERCICIO 3
  Ahora vamos a crear una función para simplemente automatizar la llamada a la tabla review_p para poder usarla de manera que sirva para cualquier año y mes.
  
  Pero que sucede si también queremos parametrizar la tabla a la cual queremos hacer ese count(), es decir, parametrizar la llamada a las tablas review,
  review_p y reciew_pc de manera que se pueda llamar haciendo un CALL y dándole los argumentos de tabla, año y mes.

  Para ello debemos de crear un PROCEDURE. ¡El orden de los parámetros importa!

*/


/*
EJERCICIO 4
  Crea la tabla neighbourhoods_changed con la siguiente sentencia:

*/
CREATE OR REPLACE TABLE `<<PROYECT_ID>>.<<DATASET_ID>>.airbnb.neighbourhoods_changed` (
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

/*
  Revisa en la tabla origen el neighbourhood_group = 'Barajas'
  Ahora usa la sentencia MERGE para comparar la tabla origen con la recién creada e inserta aquellos registros que no existan
  y modifica los que si existen por el campo new_neighbourhood.
  Obsera de nuevo la tabla con el filtro WHERE neighbourhood_group = 'Barajas'
*/


/*
EJERCICIO 5
  Consulta para encontrar la duración promedio de las estancias en cada vecindario
  usando la tabla listings y calendar, donde el campo minimum_nights es el que 
  indica la estancia mínima por reserva, se debe de filtrar por el campo available
*/  


