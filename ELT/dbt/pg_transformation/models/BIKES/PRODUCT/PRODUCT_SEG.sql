{{ config(alias=get_table_name(), schema = var('DATABASES')['target'] , enabled=enable()) }}


select * from
 {{ source('staging', 'products') }}
