{{
    config(
        materialized="incremental",
        incremental_storage="delete+insert",
        schema="ANALYTICS",
        unique_key=["Store_id", "Dept_id"],
    )
}}

with
    new_data as (
        select
            s.store as store_id,
            d.dept as dept_id,
            s.type as store_type,
            s.size as store_size,
            current_timestamp as insert_date,
            current_timestamp as udpate_date
        from {{ ref("stg_stores") }} s
        left join
            (select distinct store, dept from {{ ref("stg_departments") }}) d
            on s.store = d.store
        {% if is_incremental() %}
            where insert_date >= (select max(update_date) from {{ this }})
        {% endif %}
    )

select *
from new_data
