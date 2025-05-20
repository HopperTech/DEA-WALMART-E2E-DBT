
SELECT 
    TRY_CAST(store AS INTEGER) AS store,
    TRY_CAST(date as date) as date,
    TRY_CAST(temperature as number(5, 2)) as temperature,
    TRY_CAST(fuel_price as decimal(4, 3)) as fuel_price,
    TRY_CAST(markdown1 as decimal(8, 2)) as markdown1,
    TRY_CAST(markdown2 as decimal(8, 2)) as markdown2,
    TRY_CAST(markdown3 as decimal(8, 2)) as markdown3,
    TRY_CAST(markdown4 as decimal(8, 2)) as markdown4,
    TRY_CAST(markdown5 as decimal(8, 2)) as markdown5,
    TRY_CAST(cpi as number(14, 11)) as cpi,
    TRY_CAST(unemployment as number(5, 3)) as unemployment,
    TRY_CAST(isholiday as boolean) as isholiday
FROM {{ ref('raw_facts') }}