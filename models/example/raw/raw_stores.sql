{{
    config(
        materialized="incremental",
        post_hook="{{ copy_csv(this, '@WALMART.RAW.S3_STAGE', '.*\/stores\/.*\.csv') }}",
    )
}}

select 
    null::text as store, 
    null::text as type, 
    null::text as size
where false

