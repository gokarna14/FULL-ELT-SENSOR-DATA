{{config(
    materialized = 'table'
)}}
WITH src_sensor_data AS (
    SELECT * FROM {{ref('src_sensor_data')}}
)
SELECT DISTINCT 
    ROW_NUMBER() OVER(
        ORDER BY STORE_NUMBER
    ) AS STORE_ID,
    STORE_NUMBER,
    STORE_NAME
FROM src_sensor_data
GROUP BY STORE_NUMBER, STORE_NAME