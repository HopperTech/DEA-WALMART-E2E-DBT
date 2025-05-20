SELECT 
    TRY_CAST(store AS INTEGER) AS store,
    TRY_CAST(type AS CHAR(1)) AS type,
    TRY_CAST(size AS INTEGER) AS size
FROM {{ ref('raw_stores') }}