{{
    config(
        materialized="incremental",
        post_hook="{{ copy_csv(this, '@WALMART.RAW.S3_STAGE', '.*\/departments\/.*\.csv') }}",
    )
}}

select
    null::text as store,
    null::text as dept,
    null::text as date,
    null::text as weekly_sales,
    null::text as isholiday
where false
