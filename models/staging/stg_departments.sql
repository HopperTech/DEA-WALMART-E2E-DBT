
SELECT
    TRY_CAST(store as int) as store,
    TRY_CAST(dept as int) as dept,
    TRY_CAST(date as date) as date,
    TRY_CAST(weekly_sales as decimal(8, 2)) as weekly_sales,
    TRY_CAST(isholiday as boolean) as isholiday
FROM {{ ref('raw_departments')}}
