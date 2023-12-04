

/*

EJERCICIO 1

Encuentra el número total de reseñas para cada listado en Madrid. Muestra el nombre del listado y la cantidad de reseñas.

La distribución de los datos se realiza en función de las claves de JOIN y no del tamaño físico en megabytes de las tablas.
BigQuery intenta distribuir los datos para que la carga de trabajo se distribuya de manera uniforme entre los nodos de procesamiento.

Es importante que esta recomendación puede variar dependiendo del tipo de JOIN que estés realizando y de la naturaleza específica de los datos.

*/


/*

EJERCICIO 2

Queremos encontrar las ciudades (neighbourhood_group) con un promedio de precio superior a 100$ por noche,
pero solo queremos incluir las ciudades que tienen al menos 100 listados.

Se pide la solución usando la palabra clave HAVING, una vez hecho con HAVING, realizo de nuevo con WHERE y compara las diferencias.

Ambas cláusulas sirven para filtrar filas, pero hay una diferencia clave en su aplicación:


*   **WHERE** : se utiliza para filtrar filas antes de que se realice cualquier agregación.
*   **HAVING** : se utiliza para filtrar el resultado después de que se ha realizado la agregación.

El orden de ejecución SQL es el siguiente:

    1 - FROM
    2 - WHERE
    3 - GROUP BY
    4 - HAVING
    5 - SELECT
    6 - ORDER BY
    7 - LIMIT

*/

/*

EJERCICIO 3

Extraer el número de habitaciones y la puntuación promedio.
Se aportan los REGEX para poder extraer los datos de las columna name.
Eres libre de mejorarlos hasta el infinito y más allá.


COALESCE(CAST(REGEXP_EXTRACT(name, r'★([0-9.]+)') AS FLOAT64), 10) AS rating
CAST(REGEXP_EXTRACT(name, r'(\d+) bedroom|bedrooms') AS INT64) AS bedrooms


¿Que hace **COALESCE**? Filtra el nuevo campo llamado rating por la puntación 10 y fíjate como es el campo original name.

*/

/*
EJERCICIO 4

Encuentra los listados que tienen comentarios realizados en los últimos 30 días y una calificación promedio mayor a 4.8.

*/


/*

EJERCICIO 5

Crear la tabla listing_details con los campos del nombre de la propiedad, ratio, el número de habitaciones y número de camas.


*/

/*

EJERCICIO 6

Obtener precios promedio para enero y julio usando subqueries (with), después crear una tabla temporal para
todos los meses del año así como sus días. Por último, sacar el precio promedio de cada lunes y domingo.

*/