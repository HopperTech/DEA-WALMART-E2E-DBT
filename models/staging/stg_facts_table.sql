{{ config(
    materialized='incremental',
    incremental_strategy='delete+insert',
    unique_key=['date_id', 'store_id', 'dept_id']
) }}

SELECT 
    HASH(f.date) AS date_id,
    f.store as store_id,
    s.dept_id,
    s.store_size,
    d.weekly_sales as store_weekly_sales,
    f.fuel_price,
    f.temperature,
    f.unemployment,
    f.cpi,
    f.markdown1,
    f.markdown2,
    f.markdown3,
    f.markdown4,
    f.markdown5
FROM 
    {{ ref('stg_facts') }} as f 
    join {{ ref('raw_departments')}} as d on d.store = f.store and d.date = f.date
    join {{ ref('Walmart_store_dim') }} as s on s.store_id = f.store and s.dept_id = d.dept
