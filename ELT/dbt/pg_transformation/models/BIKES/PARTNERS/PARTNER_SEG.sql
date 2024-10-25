{{ config(alias=get_table_name(), schema = var('DATABASES')['target'] , enabled=true) }}

select partnerid as p_id,
 partnerrole as p_role,
 emailaddress as email,
 phonenumber as ph_no,
 coalesce(cast(faxnumber as varchar), '0000-000-000') as fax_no,
 webaddress as web_url,
 case
 when position('https' in webaddress)  > 0 then 'secured' else 'unsecured' end web_url_security,
 addressid as location_id,
 companyname,
 to_date({{ cast('createDat','varchar') }}, 'yyyyMMdd') as createdDate,
 to_date({{ cast('ChangeDat','varchar') }}, 'yyyyMMdd') as changedDate,
 case when createDat = changedat then 'Not Changed' else 'Changed' end isChange,
 currency
 from
 {{ source('staging', 'businesspartners') }}
WHERE lower({{ var('FILTER')[0] }}) = '{{ var("FILTER")[1]|lower}}'
