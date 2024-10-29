{{ config(alias=get_table_name(), schema=var('DATABASES')['target'], enabled=enable()) }}

SELECT
    a.productid AS p_id,
    d.short_descr AS product_name,
    a.prodcategoryid AS p_Cat_id,
    c.short_descr AS category_name,
    to_date({{ cast('ChangeDat','varchar') }}, 'yyyyMMdd') as changedDate
FROM
    {{ source('staging', 'products') }} a
INNER JOIN
    {{ source('staging', 'productcategories') }} b
    ON a.prodcategoryid = b.prodcategoryid
INNER JOIN
    {{ source('staging', 'productcategorytext') }} c
    ON b.prodcategoryid = c.prodcategoryid
INNER JOIN
    {{ source('staging', 'producttexts') }} d
    ON a.productid = d.productid