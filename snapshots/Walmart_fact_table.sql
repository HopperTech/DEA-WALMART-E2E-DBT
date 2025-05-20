{% snapshot Walmart_fact_table %}

{{
    config(
        target_schema='analytics', 
        unique_key=['date_id','store_id','dept_id'],
        strategy='check',
        check_cols=['store_weekly_sales', 'fuel_price', 'store_temperature', 'unemployment', 'cpi', 'markdown1', 'markdown2', 'markdown3', 'markdown4', 'markdown5']
    )
}}

SELECT 
    HASH(f.date) AS date_id,
    f.store as store_id,
    d.dept as dept_id,
    d.weekly_sales as store_weekly_sales,
    f.fuel_price,
    f.temperature as store_temperature,
    f.unemployment,
    f.cpi,
    f.markdown1,
    f.markdown2,
    f.markdown3,
    f.markdown4,
    f.markdown5
FROM 
    {{ ref('stg_facts') }} as f 
    join {{ ref('stg_departments') }} as d on d.store = f.store and d.date = f.date 
    join {{ ref('Walmart_store_dim') }} as s on s.store_id = f.store and s.dept_id = d.dept

{% endsnapshot %}