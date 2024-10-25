{{ config(alias=this.name~'_'~var('FILTER'), schema = var('DATABASES')['target'] , enabled=true) }}

select * from {{ source('staging', 'businesspartners') }}
where currency = '{{ var("FILTER") }}'