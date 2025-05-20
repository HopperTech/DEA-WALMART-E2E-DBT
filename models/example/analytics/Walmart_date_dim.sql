{{ config(
    materialized='incremental',
    incremental_strategy='delete+insert',
    unique_key=['date_id']
) }}

SELECT 
    HASH(date) AS date_id,
    date, 
    isholiday, 
    CURRENT_TIMESTAMP as insert_date,
    CURRENT_TIMESTAMP as udpate_date        
FROM (
    SELECT distinct date, isholiday
        FROM {{ ref('stg_departments') }}
    {% if is_incremental() %}
    WHERE insert_date >= (select max(update_date) from {{ this }})
    {% endif %}
)
