{{
    config(
        materialized="incremental",
        post_hook="{{ copy_csv(this, '@WALMART.RAW.S3_STAGE', '.*\/facts\/.*\.csv') }}",
    )
}}

select
    null::text as store,
    null::text as date,
    null::text as temperature,
    null::text as fuel_price,
    null::text as markdown1,
    null::text as markdown2,
    null::text as markdown3,
    null::text as markdown4,
    null::text as markdown5,
    null::text as cpi,
    null::text as unemployment,
    null::text as isholiday
where false